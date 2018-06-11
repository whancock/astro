/* Simple illustration of the use of Aleph to construct features
   on Michalski's trains problem
 To run do the following:
       a. induce_features(Features)
*/
/** <examples>
?- induce_features(Features).
*/


/*
 ok so what do I want to learn here?

first, what are my features?
astro symbols and states... fine

it seems that astro maps from the event of one's birth...
to what???




*/

:- use_module(library(aleph)).
:- if(current_predicate(use_rendering/1)).
:- use_rendering(prolog).
:- endif.

:- aleph.

% :- set(i,3).
% :- set(evalfn, compression).
% :- set(clauselength,10).

:- set(minacc, 0.0).
:- set(noise, 20).

% :- set(minscore,3).
% :- set(minpos,3).

% :- set(nodes,5000).

:- set(explore,true).
% :- set(max_features,10).


:- set(rulefile, rules).




%% :- modeh(1, danger(+car)).
:- modeh(1, popular(+car)).


:- modeb(1, sign(+car, #sign)).
:- modeb(1, ascendant(+car, #sign)).
:- modeb(10, blending(+car, #planet, #planet)).
:- modeb(10, harmonizing(+car, #planet, #planet)).
:- modeb(10, discordant(+car, #planet, #planet)).
:- modeb(12, planet_pos(+car, #planet, #sign)).
:- modeb(12, houserel(+car, #planet, #house)).






:- determination(danger/1, sign/2).
:- determination(danger/1, ascendant/2).
:- determination(danger/1, blending/3).
:- determination(danger/1, harmonizing/3).
:- determination(danger/1, discordant/3).
:- determination(danger/1, planet/3).
:- determination(danger/1, houserel/3).





:- determination(popular/1, sign/2).
:- determination(popular/1, ascendant/2).
:- determination(popular/1, blending/3).
:- determination(popular/1, harmonizing/3).
:- determination(popular/1, discordant/3).
:- determination(popular/1, planet/3).
:- determination(popular/1, houserel/3).





% show examples as boolean vectors
:- set(portray_examples,true).

aleph_portray(train_pos):-
        setting(train_pos,File),
        show_features(File,positive).

aleph_portray(train_neg):-
        setting(train_neg,File),
        show_features(File,negative).

show_features(File,Class):-
        open(File,read,Stream),
        repeat,
        read(Stream,Example),
        (Example = end_of_file -> close(Stream);
                write_features(Example,Class),
                fail).

write_features(Example,_):-
        features(_,(Example:- Body)),
        (Body -> write(1), write(' '); write(0), write(' ')),
        fail.

write_features(_,Class):-
	writeq(Class), nl.





:-begin_bg.

sign(aries).
sign(taurus).
sign(gemini).
sign(cancer).
sign(leo).
sign(virgo).
sign(libra).
sign(scorpio).
sign(sagittarius).
sign(capricorn).
sign(aquarius).
sign(pisces).


planet(sun).
planet(moon).
planet(mercury).
planet(venus).
planet(mars).
planet(jupiter).
planet(saturn).
planet(uranus).
planet(neptune).
planet(pluto).

house(1).
house(2).
house(3).
house(4).
house(5).
house(6).
house(7).
house(8).
house(9).
house(10).
house(11).
house(12).




%% lincoln
car(lincoln).
harmonizing(lincoln, moon, jupiter).
houserel(lincoln, mercury, 1).
harmonizing(lincoln, uranus, pluto).
planet(lincoln, venus, aries).
houserel(lincoln, pluto, 1).
harmonizing(lincoln, moon, saturn).
harmonizing(lincoln, venus, neptune).
houserel(lincoln, venus, 2).
harmonizing(lincoln, venus, saturn).
houserel(lincoln, mars, 8).
planet(lincoln, saturn, sagittarius).
planet(lincoln, mercury, pisces).
planet(lincoln, sun, aquarius).
houserel(lincoln, saturn, 10).
blending(lincoln, saturn, neptune).
planet(lincoln, moon, capricorn).
houserel(lincoln, neptune, 10).
planet(lincoln, jupiter, pisces).
houserel(lincoln, moon, 12).
houserel(lincoln, sun, 1).
discordant(lincoln, moon, mars).
blending(lincoln, mercury, pluto).
harmonizing(lincoln, sun, mars).
harmonizing(lincoln, mercury, uranus).
discordant(lincoln, mercury, neptune).
ascendant(lincoln, aquarius).
planet(lincoln, mars, libra).
houserel(lincoln, uranus, 9).
sign(lincoln, aquarius).
houserel(lincoln, jupiter, 2).




%% kenneddy
car(kennedy).
discordant(kennedy, mercury, uranus).
harmonizing(kennedy, moon, mars).
ascendant(kennedy, libra).
houserel(kennedy, sun, 8).
discordant(kennedy, jupiter, uranus).
houserel(kennedy, pluto, 9).
blending(kennedy, mercury, jupiter).
planet(kennedy, saturn, cancer).
blending(kennedy, saturn, neptune).
discordant(kennedy, moon, venus).
planet(kennedy, moon, virgo).
harmonizing(kennedy, sun, neptune).
houserel(kennedy, venus, 8).
houserel(kennedy, jupiter, 8).
blending(kennedy, mercury, mars).
sign(kennedy, gemini).
planet(kennedy, mars, taurus).
planet(kennedy, sun, gemini).
planet(kennedy, jupiter, taurus).
houserel(kennedy, uranus, 4).
harmonizing(kennedy, moon, jupiter).
houserel(kennedy, mercury, 8).
houserel(kennedy, neptune, 10).
houserel(kennedy, saturn, 10).
harmonizing(kennedy, jupiter, saturn).
planet(kennedy, mercury, taurus).
houserel(kennedy, moon, 11).
houserel(kennedy, mars, 8).
planet(kennedy, venus, gemini).
harmonizing(kennedy, moon, mercury).
blending(kennedy, mars, jupiter).
discordant(kennedy, mars, uranus).



%% mckinley
car(mckinley).
planet(mckinley, jupiter, aquarius).
blending(mckinley, moon, jupiter).
houserel(mckinley, moon, 4).
houserel(mckinley, saturn, 3).
houserel(mckinley, venus, 3).
houserel(mckinley, mercury, 4).
discordant(mckinley, saturn, pluto).
houserel(mckinley, mars, 1).
houserel(mckinley, uranus, 5).
planet(mckinley, mercury, aquarius).
planet(mckinley, moon, aquarius).
discordant(mckinley, mars, neptune).
blending(mckinley, sun, moon).
harmonizing(mckinley, mercury, venus).
ascendant(mckinley, libra).
planet(mckinley, venus, sagittarius).
discordant(mckinley, venus, uranus).
houserel(mckinley, jupiter, 4).
harmonizing(mckinley, neptune, pluto).
harmonizing(mckinley, mars, saturn).
houserel(mckinley, sun, 4).
planet(mckinley, mars, scorpio).
planet(mckinley, saturn, capricorn).
houserel(mckinley, neptune, 4).
planet(mckinley, sun, aquarius).
sign(mckinley, aquarius).
houserel(mckinley, pluto, 6).
blending(mckinley, sun, jupiter).



%% garfield
planet(garfield, moon, taurus).
planet(garfield, saturn, virgo).
houserel(garfield, pluto, 7).
discordant(garfield, sun, moon).
sign(garfield, scorpio).
harmonizing(garfield, moon, neptune).
blending(garfield, jupiter, uranus).
discordant(garfield, moon, jupiter).
planet(garfield, venus, libra).
ascendant(garfield, virgo).
houserel(garfield, saturn, 12).
car(garfield).
harmonizing(garfield, venus, uranus).
houserel(garfield, venus, 1).
planet(garfield, mars, scorpio).
houserel(garfield, sun, 3).
planet(garfield, sun, scorpio).
houserel(garfield, moon, 9).
harmonizing(garfield, sun, neptune).
houserel(garfield, neptune, 4).
blending(garfield, sun, mercury).
houserel(garfield, uranus, 5).
planet(garfield, mercury, scorpio).
planet(garfield, jupiter, aquarius).
houserel(garfield, mercury, 3).
harmonizing(garfield, venus, jupiter).
discordant(garfield, mars, uranus).
discordant(garfield, venus, pluto).
houserel(garfield, jupiter, 5).
houserel(garfield, mars, 2).
harmonizing(garfield, uranus, pluto).
harmonizing(garfield, moon, saturn).




%% obama
sign(obama, leo).
car(obama).
ascendant(obama, aquarius).
discordant(obama, moon, pluto).
harmonizing(obama, neptune, pluto).
planet(obama, jupiter, aquarius).
blending(obama, jupiter, saturn).
houserel(obama, neptune, 9).
planet(obama, moon, gemini).
harmonizing(obama, moon, mercury).
discordant(obama, mercury, jupiter).
harmonizing(obama, venus, pluto).
planet(obama, mercury, leo).
houserel(obama, venus, 5).
houserel(obama, saturn, 12).
houserel(obama, moon, 4).
houserel(obama, mars, 7).
planet(obama, sun, leo).
planet(obama, venus, cancer).
houserel(obama, jupiter, 12).
harmonizing(obama, mars, saturn).
planet(obama, mars, virgo).
harmonizing(obama, moon, jupiter).
planet(obama, saturn, capricorn).
discordant(obama, sun, neptune).
houserel(obama, mercury, 6).
houserel(obama, uranus, 7).
houserel(obama, pluto, 7).
houserel(obama, sun, 6).





%% bush
harmonizing(bush, moon, venus).
planet(bush, jupiter, libra).
houserel(bush, neptune, 3).
car(bush).
planet(bush, venus, leo).
houserel(bush, sun, 12).
harmonizing(bush, sun, mars).
harmonizing(bush, jupiter, uranus).
blending(bush, moon, jupiter).
houserel(bush, mars, 2).
houserel(bush, uranus, 11).
houserel(bush, pluto, 1).
ascendant(bush, leo).
harmonizing(bush, moon, pluto).
houserel(bush, jupiter, 3).
sign(bush, cancer).
harmonizing(bush, neptune, pluto).
houserel(bush, moon, 3).
harmonizing(bush, moon, mercury).
discordant(bush, sun, jupiter).
planet(bush, saturn, cancer).
houserel(bush, mercury, 1).
planet(bush, moon, libra).
harmonizing(bush, mercury, neptune).
planet(bush, mercury, leo).
harmonizing(bush, venus, jupiter).
discordant(bush, sun, neptune).
harmonizing(bush, venus, uranus).
discordant(bush, sun, moon).
harmonizing(bush, moon, uranus).
houserel(bush, venus, 1).
planet(bush, sun, cancer).
houserel(bush, saturn, 12).
planet(bush, mars, virgo).
blending(bush, mercury, pluto).




%% roosevelt
planet(roosevelt, jupiter, gemini).
discordant(roosevelt, sun, pluto).
discordant(roosevelt, saturn, pluto).
houserel(roosevelt, jupiter, 12).
planet(roosevelt, saturn, leo).
houserel(roosevelt, saturn, 3).
discordant(roosevelt, moon, mars).
discordant(roosevelt, mercury, pluto).
planet(roosevelt, sun, scorpio).
blending(roosevelt, sun, mercury).
car(roosevelt).
houserel(roosevelt, uranus, 12).
planet(roosevelt, mercury, scorpio).
discordant(roosevelt, venus, neptune).
sign(roosevelt, scorpio).
houserel(roosevelt, venus, 6).
discordant(roosevelt, venus, jupiter).
houserel(roosevelt, sun, 5).
houserel(roosevelt, neptune, 10).
harmonizing(roosevelt, mars, neptune).
planet(roosevelt, venus, sagittarius).
harmonizing(roosevelt, moon, neptune).
discordant(roosevelt, sun, saturn).
houserel(roosevelt, moon, 2).
houserel(roosevelt, mercury, 5).
planet(roosevelt, moon, cancer).
houserel(roosevelt, pluto, 11).
ascendant(roosevelt, gemini).
planet(roosevelt, mars, capricorn).
discordant(roosevelt, jupiter, neptune).
houserel(roosevelt, mars, 8).



%% washington
sign(washington, pisces).
houserel(washington, moon, 12).
harmonizing(washington, neptune, pluto).
planet(washington, saturn, aries).
houserel(washington, jupiter, 8).
houserel(washington, neptune, 5).
houserel(washington, pluto, 8).
planet(washington, mars, scorpio).
discordant(washington, uranus, neptune).
harmonizing(washington, mercury, jupiter).
discordant(washington, moon, pluto).
houserel(washington, mars, 10).
houserel(washington, saturn, 2).
ascendant(washington, capricorn).
blending(washington, venus, saturn).
houserel(washington, mercury, 1).
car(washington).
planet(washington, mercury, aquarius).
discordant(washington, moon, jupiter).
harmonizing(washington, mercury, saturn).
houserel(washington, uranus, 11).
houserel(washington, sun, 1).
planet(washington, venus, pisces).
harmonizing(washington, mercury, uranus).
planet(washington, moon, capricorn).
discordant(washington, jupiter, saturn).
planet(washington, jupiter, libra).
houserel(washington, venus, 2).
planet(washington, sun, pisces).
discordant(washington, sun, uranus).
harmonizing(washington, jupiter, uranus).


%% hitler
planet(hitler, mars, taurus).
houserel(hitler, neptune, 8).
harmonizing(hitler, sun, moon).
planet(hitler, moon, capricorn).
houserel(hitler, pluto, 8).
harmonizing(hitler, sun, jupiter).
houserel(hitler, moon, 3).
discordant(hitler, venus, saturn).
sign(hitler, taurus).
houserel(hitler, jupiter, 3).
houserel(hitler, sun, 7).
blending(hitler, venus, mars).
houserel(hitler, mercury, 7).
houserel(hitler, mars, 7).
blending(hitler, moon, jupiter).
ascendant(hitler, libra).
planet(hitler, mercury, aries).
car(hitler).
houserel(hitler, uranus, 12).
blending(hitler, neptune, pluto).
houserel(hitler, venus, 7).
blending(hitler, sun, mercury).
houserel(hitler, saturn, 10).
planet(hitler, venus, taurus).
planet(hitler, jupiter, capricorn).
planet(hitler, saturn, leo).
planet(hitler, sun, taurus).
discordant(hitler, mars, saturn).



%% franz ferdinand
harmonizing(karl, mars, pluto).
harmonizing(karl, sun, uranus).
sign(karl, sagittarius).
planet(karl, venus, capricorn).
planet(karl, jupiter, libra).
planet(karl, mars, cancer).
houserel(karl, uranus, 5).
houserel(karl, moon, 12).
harmonizing(karl, venus, saturn).
discordant(karl, mars, uranus).
discordant(karl, moon, neptune).
blending(karl, mercury, neptune).
houserel(karl, mercury, 6).
houserel(karl, sun, 6).
discordant(karl, moon, mercury).
houserel(karl, mars, 1).
houserel(karl, pluto, 10).
houserel(karl, venus, 8).
planet(karl, moon, taurus).
harmonizing(karl, mercury, jupiter).
planet(karl, sun, sagittarius).
harmonizing(karl, moon, venus).
houserel(karl, saturn, 4).
ascendant(karl, gemini).
planet(karl, mercury, scorpio).
houserel(karl, jupiter, 5).
harmonizing(karl, venus, neptune).
car(karl).
harmonizing(karl, moon, saturn).
discordant(karl, sun, saturn).
harmonizing(karl, saturn, neptune).
houserel(karl, neptune, 6).
planet(karl, saturn, virgo).


:-end_bg.

:-begin_in_pos.

danger(lincoln).
danger(mckinley).
danger(kennedy).
danger(garfield).
danger(karl).



popular(lincoln).
popular(kennedy).
popular(obama).
popular(washington).
popular(roosevelt).



:-end_in_pos.
:-begin_in_neg.


danger(obama).
danger(bush).
danger(roosevelt).
danger(washington).



popular(mckinley).
popular(garfield).
popular(bush).
popular(hitler).



:-end_in_neg.
:-aleph_read_all.
