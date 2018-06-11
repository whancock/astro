sun_signs = ['aries', 'taurus', 'gemini', 'cancer', 'leo', 'virgo', 'libra', 'scorpio', 
			 'sagittarius', 'capricorn', 'aquarius', 'pisces']


planets= ['sun', 'moon', 'mercury', 'venus', 'mars', 'jupiter', 
		  'saturn',  'uranus', 'neptune', 'pluto']


relations = ['blending', 'harmonizing', 'discordant']




import requests
from bs4 import BeautifulSoup
import math
import re



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




def get_rules_for_page(page):

	result = requests.get(page)
	soup = BeautifulSoup(result.content, "lxml")


	rules = set()


	person = soup.findAll("div", {"class": "rSubjectName"})[0].get_text().split()[-1].lower()



	rules.add('car({})'.format(person))


	title = soup.findAll("h1", {"class": "page-title"})[0].get_text()
	sign = get_item(title, sun_signs)

	rules.add('sign({}, {})'.format(person, sign))


	natal_title = soup.findAll("div", {"class": "natal_title"})
	natal_sign = get_item(natal_title[0].get_text(), sun_signs)


	rules.add('ascendant({}, {})'.format(person, natal_sign))


	for item in natal_title[1:]:
		rule = process_relation(person, item.get_text())
		if rule:
			rules.add(rule)

	return rules



page = "https://www.zodiacsignastrology.org/birth-chart/archduke-of-austria-franz-karl/"
# page = "https://www.zodiacsignastrology.org/birth-chart/adolf-hitler/"
# page = "https://www.zodiacsignastrology.org/birth-chart/george-washington/"
# page = "https://www.zodiacsignastrology.org/birth-chart/james-garfield/"
# page = "https://www.zodiacsignastrology.org/birth-chart/theodore-roosevelt/"
# page = "https://www.zodiacsignastrology.org/birth-chart/george-w-bush/"
# page = "https://www.zodiacsignastrology.org/birth-chart/barack-obama/"
# page = "https://www.zodiacsignastrology.org/birth-chart/william-mckinley/"
# page = "https://www.zodiacsignastrology.org/birth-chart/john-f-kennedy/"
# page = "https://www.zodiacsignastrology.org/birth-chart/abraham-lincoln/"
rules = get_rules_for_page(page)

for item in rules:
	print(item + ".")