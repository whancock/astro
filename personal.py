sun_signs = ['aries', 'taurus', 'gemini', 'cancer', 'leo', 'virgo', 'libra', 'scorpio', 
			 'sagittarius', 'capricorn', 'aquarius', 'pisces']


planets= ['sun', 'moon', 'mercury', 'venus', 'mars', 'jupiter', 
		  'saturn',  'uranus', 'neptune', 'pluto']


relations = ['blending', 'harmonizing', 'discordant']




import requests
from bs4 import BeautifulSoup
import math
import re
import roman



def parse_ord(n):
	return int(re.sub("\D", "", n))


def get_item(string, stuff):
	for item in stuff:
		if item.lower() in string.lower():
			return item
	return ''


def process_relation(person, string):

	lower = string.lower()
	tokens = lower.split()

	for rel in relations:
		if rel in lower:
			return '{}({}, {}, {})'.format(rel, person, tokens[0], tokens[3])

	if tokens[1] == "in" and tokens[0] in planets and tokens[2] in sun_signs:
		return 'planet({}, {}, {})'.format(person, tokens[0], tokens[2])
	elif len(tokens) == 4 and tokens[3] == "house":
		return 'houserel({}, {}, {})'.format(person, tokens[0], parse_ord(tokens[2]))




def get_rules_for_page(pagesoup):

	person = 'test'
	rules = set()

	rules.add('car({})'.format(person))


	content = pagesoup.find_all('td', {'class': 'content'})[0]

	facts = re.findall('\s\w+\s+in\s+\w+\s', content.text, flags=re.IGNORECASE)

	for fact in facts:

		tokens = fact.lower().split()

		if tokens[0] in planets and tokens[2] in sun_signs:

			if tokens[0] == 'sun':
				rules.add('sign({}, {})'.format(person, tokens[2]))
			else:
				rules.add('planet({}, {}, {})'.format(person, tokens[0], tokens[2]))

		elif re.search('^m{0,4}(cm|cd|d?c{0,3})(xc|xl|l?x{0,3})(ix|iv|v?i{0,3})$', tokens[0].strip()):
			sign = tokens[2].strip()

			sign = get_item(sign, sun_signs)

			if sign:

				num = roman.fromRoman(tokens[0].strip().upper())

				rules.add('houserel({}, {}, {})'.format(person, sign, num))


	return rules




headers = {
	'Cookie': 'PHPSESSID=69vslrt565tiljmkg2knil1rl1; userid=35620473',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36',
}


payload = {
	'index': '0',
	'command': 'new',
	'name': 'tron',
	'sex': 't',
	'type': '24', 
	'userid': '35620473',
	'd1year': '2000', 
	'd1month': '1', 
	'd1day': '1', 
	'time': '0', 
	'lat': '36.83', 
	'long': '-76.28', 
	'tz': '-5.00', 
	'citylist': 'Norfolk,51,1,36.83,-76.28',
	'lang': 'en'
	}



url = 'http://astro.cafeastrology.com/natal.php'
session = requests.session()
r = session.get(url)
r = session.post(url, headers=headers, data=payload)
soup = BeautifulSoup(r.text, "html5lib")


facts = get_rules_for_page(soup)


for fact in facts:
	print(fact + '.')