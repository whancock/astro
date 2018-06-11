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

:- set(tree_type,classification).

%% :- set(classes,[ydanger, ndanger]).
%% :- set(classes,[ypacifist, npacifist]).
:- set(classes,[yintelligent, nintelligent]).
%% :- set(classes,[ypopular, npopular]).


:- set(minpos,2).       % minimum examples in leaf for splitting
:- set(prune_tree,true).
:- set(confidence,0.25).% pruning conf parameter used by C4.5
:- set(evalfn,entropy).
:- set(dependent,2).    % second argument of class/2 is the one to predict


:- set(rulefile, treerules).




%% :- modeh(1, danger(+car, -class)).
%% :- modeh(1, pacifist(+car, -class)).
:- modeh(1, intelligent(+car, -class)).
%% :- modeh(1, popular(+car, -class)).


:- modeb(1, sign(+car, #sign)).
:- modeb(1, ascendant(+car, #sign)).
:- modeb(10, blending(+car, #planet, #planet)).
:- modeb(10, harmonizing(+car, #planet, #planet)).
:- modeb(10, discordant(+car, #planet, #planet)).
:- modeb(12, planet_pos(+car, #planet, #sign)).
:- modeb(12, houserel(+car, #planet, #house)).






:- determination(danger/2, sign/2).
:- determination(danger/2, ascendant/2).
:- determination(danger/2, blending/3).
:- determination(danger/2, harmonizing/3).
:- determination(danger/2, discordant/3).
:- determination(danger/2, planet/3).
:- determination(danger/2, houserel/3).


:- determination(popular/2, sign/2).
:- determination(popular/2, ascendant/2).
:- determination(popular/2, blending/3).
:- determination(popular/2, harmonizing/3).
:- determination(popular/2, discordant/3).
:- determination(popular/2, planet/3).
:- determination(popular/2, houserel/3).


:- determination(intelligent/2, sign/2).
:- determination(intelligent/2, ascendant/2).
:- determination(intelligent/2, blending/3).
:- determination(intelligent/2, harmonizing/3).
:- determination(intelligent/2, discordant/3).
:- determination(intelligent/2, planet/3).
:- determination(intelligent/2, houserel/3).


:- determination(pacifist/2, sign/2).
:- determination(pacifist/2, ascendant/2).
:- determination(pacifist/2, blending/3).
:- determination(pacifist/2, harmonizing/3).
:- determination(pacifist/2, discordant/3).
:- determination(pacifist/2, planet/3).
:- determination(pacifist/2, houserel/3).




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




% gandhi
harmonizing(gandhi, jupiter, uranus).
houserel(gandhi, mercury, 1).
planet(gandhi, saturn, sagittarius).
sign(gandhi, libra).
harmonizing(gandhi, venus, uranus).
houserel(gandhi, sun, 1).
ascendant(gandhi, libra).
harmonizing(gandhi, uranus, pluto).
houserel(gandhi, mars, 2).
houserel(gandhi, pluto, 8).
harmonizing(gandhi, moon, neptune).
blending(gandhi, jupiter, pluto).
planet(gandhi, venus, scorpio).
planet(gandhi, mars, scorpio).
houserel(gandhi, saturn, 3).
houserel(gandhi, jupiter, 8).
harmonizing(gandhi, sun, saturn).
discordant(gandhi, moon, venus).
discordant(gandhi, moon, jupiter).
discordant(gandhi, moon, pluto).
discordant(gandhi, uranus, neptune).
planet(gandhi, moon, leo).
discordant(gandhi, mars, jupiter).
planet(gandhi, mercury, scorpio).
planet(gandhi, jupiter, taurus).
discordant(gandhi, venus, jupiter).
blending(gandhi, venus, mars).
planet(gandhi, sun, libra).
car(gandhi).
harmonizing(gandhi, mars, uranus).
discordant(gandhi, mars, pluto).
discordant(gandhi, moon, mars).
houserel(gandhi, moon, 11).
houserel(gandhi, uranus, 10).
houserel(gandhi, neptune, 7).
houserel(gandhi, venus, 2).
harmonizing(gandhi, moon, saturn).
discordant(gandhi, venus, pluto).



% mandela
planet(mandela, saturn, leo).
ascendant(mandela, sagittarius).
blending(mandela, jupiter, pluto).
harmonizing(mandela, mercury, mars).
harmonizing(mandela, mars, saturn).
harmonizing(mandela, sun, moon).
planet(mandela, sun, cancer).
discordant(mandela, moon, uranus).
car(mandela).
houserel(mandela, saturn, 9).
houserel(mandela, pluto, 7).
harmonizing(mandela, venus, uranus).
discordant(mandela, moon, mercury).
planet(mandela, venus, gemini).
harmonizing(mandela, jupiter, uranus).
planet(mandela, jupiter, cancer).
houserel(mandela, mercury, 9).
planet(mandela, moon, scorpio).
houserel(mandela, jupiter, 7).
blending(mandela, mercury, saturn).
houserel(mandela, venus, 6).
houserel(mandela, sun, 8).
sign(mandela, cancer).
houserel(mandela, mars, 11).
houserel(mandela, uranus, 3).
houserel(mandela, moon, 12).
houserel(mandela, neptune, 8).
discordant(mandela, moon, saturn).
planet(mandela, mercury, leo).
planet(mandela, mars, libra).



% einstein
houserel(einstein, venus, 11).
planet(einstein, mercury, aries).
houserel(einstein, mars, 8).
harmonizing(einstein, sun, mars).
houserel(einstein, jupiter, 9).
houserel(einstein, moon, 6).
houserel(einstein, pluto, 11).
planet(einstein, saturn, aries).
harmonizing(einstein, mars, pluto).
planet(einstein, mars, capricorn).
car(einstein).
houserel(einstein, uranus, 3).
houserel(einstein, saturn, 10).
blending(einstein, mercury, saturn).
planet(einstein, venus, aries).
harmonizing(einstein, moon, venus).
houserel(einstein, sun, 10).
discordant(einstein, jupiter, pluto).
harmonizing(einstein, sun, pluto).
planet(einstein, jupiter, aquarius).
sign(einstein, pisces).
houserel(einstein, neptune, 11).
houserel(einstein, mercury, 10).
planet(einstein, moon, sagittarius).
planet(einstein, sun, pisces).
ascendant(einstein, cancer).
discordant(einstein, jupiter, uranus).





% gauss
sign(gauss, taurus).
planet(gauss, saturn, libra).
harmonizing(gauss, neptune, pluto).
harmonizing(gauss, jupiter, neptune).
planet(gauss, jupiter, cancer).
car(gauss).
planet(gauss, mars, libra).
discordant(gauss, saturn, pluto).
planet(gauss, sun, taurus).
planet(gauss, mercury, taurus).
harmonizing(gauss, mercury, jupiter).
blending(gauss, sun, mercury).
planet(gauss, venus, gemini).




% euler
car(euler).
planet(euler, mars, cancer).
planet(euler, venus, pisces).
sign(euler, aries).
planet(euler, saturn, gemini).
discordant(euler, mercury, uranus).
harmonizing(euler, mercury, venus).
planet(euler, jupiter, leo).
harmonizing(euler, neptune, pluto).
harmonizing(euler, jupiter, neptune).
harmonizing(euler, sun, jupiter).
harmonizing(euler, venus, mars).
planet(euler, mercury, taurus).
harmonizing(euler, sun, pluto).
planet(euler, sun, aries).
blending(euler, jupiter, pluto).



% newton
houserel(newton, venus, 4).
discordant(newton, venus, uranus).
harmonizing(newton, saturn, uranus).
houserel(newton, pluto, 8).
houserel(newton, neptune, 2).
planet(newton, saturn, pisces).
ascendant(newton, libra).
planet(newton, sun, capricorn).
planet(newton, jupiter, pisces).
houserel(newton, mars, 7).
planet(newton, mercury, sagittarius).
planet(newton, mars, taurus).
sign(newton, capricorn).
houserel(newton, jupiter, 5).
blending(newton, moon, venus).
discordant(newton, mercury, jupiter).
harmonizing(newton, jupiter, uranus).
harmonizing(newton, sun, mars).
houserel(newton, mercury, 2).
planet(newton, moon, aquarius).
houserel(newton, moon, 4).
discordant(newton, neptune, pluto).
houserel(newton, sun, 3).
planet(newton, venus, aquarius).
car(newton).
houserel(newton, saturn, 5).
discordant(newton, moon, uranus).
houserel(newton, uranus, 2).
harmonizing(newton, moon, mercury).



% da vinci
planet(vinci, mercury, aries).
houserel(vinci, moon, 12).
houserel(vinci, venus, 6).
harmonizing(vinci, mars, saturn).
planet(vinci, jupiter, aquarius).
houserel(vinci, mars, 3).
discordant(vinci, mars, pluto).
houserel(vinci, jupiter, 3).
planet(vinci, moon, scorpio).
harmonizing(vinci, mercury, pluto).
discordant(vinci, sun, uranus).
houserel(vinci, pluto, 8).
planet(vinci, saturn, libra).
harmonizing(vinci, mercury, mars).
sign(vinci, aries).
houserel(vinci, mercury, 4).
planet(vinci, venus, taurus).
harmonizing(vinci, neptune, pluto).
discordant(vinci, moon, venus).
harmonizing(vinci, sun, jupiter).
houserel(vinci, uranus, 8).
houserel(vinci, neptune, 10).
ascendant(vinci, scorpio).
discordant(vinci, venus, mars).
discordant(vinci, moon, mars).
planet(vinci, sun, aries).
planet(vinci, mars, aquarius).
houserel(vinci, saturn, 10).
car(vinci).
houserel(vinci, sun, 5).




% trump
houserel(trump, venus, 12).
blending(trump, venus, neptune).
houserel(trump, mercury, 12).
houserel(trump, pluto, 10).
houserel(trump, uranus, 12).
blending(trump, mercury, uranus).
houserel(trump, saturn, 5).
harmonizing(trump, moon, saturn).
car(trump).
ascendant(trump, pisces).
sign(trump, pisces).
planet(trump, saturn, leo).
houserel(trump, moon, 9).
houserel(trump, neptune, 12).
planet(trump, venus, aquarius).
houserel(trump, sun, 1).
planet(trump, moon, sagittarius).
harmonizing(trump, mercury, jupiter).
planet(trump, mars, gemini).
harmonizing(trump, venus, mars).
discordant(trump, jupiter, neptune).
planet(trump, mercury, pisces).
discordant(trump, sun, pluto).
harmonizing(trump, mars, neptune).
houserel(trump, mars, 3).
discordant(trump, venus, jupiter).
houserel(trump, jupiter, 8).
planet(trump, jupiter, scorpio).
harmonizing(trump, sun, saturn).
discordant(trump, mars, uranus).
harmonizing(trump, sun, moon).
planet(trump, sun, pisces).
discordant(trump, mercury, mars).




% michelle bachmann
houserel(bachmann, neptune, 4).
discordant(bachmann, sun, mars).
harmonizing(bachmann, neptune, pluto).
houserel(bachmann, mars, 6).
discordant(bachmann, mars, neptune).
houserel(bachmann, uranus, 12).
discordant(bachmann, moon, venus).
houserel(bachmann, sun, 10).
ascendant(bachmann, leo).
discordant(bachmann, uranus, neptune).
planet(bachmann, mars, capricorn).
planet(bachmann, jupiter, leo).
harmonizing(bachmann, sun, jupiter).
houserel(bachmann, pluto, 2).
houserel(bachmann, saturn, 5).
planet(bachmann, saturn, sagittarius).
harmonizing(bachmann, mercury, jupiter).
harmonizing(bachmann, venus, uranus).
car(bachmann).
harmonizing(bachmann, moon, neptune).
discordant(bachmann, moon, saturn).
houserel(bachmann, venus, 11).
discordant(bachmann, mars, uranus).
sign(bachmann, aries).
harmonizing(bachmann, moon, mercury).
discordant(bachmann, venus, saturn).
blending(bachmann, jupiter, pluto).
harmonizing(bachmann, sun, moon).
houserel(bachmann, moon, 8).
harmonizing(bachmann, saturn, uranus).
planet(bachmann, mercury, aries).
planet(bachmann, sun, aries).
discordant(bachmann, saturn, pluto).
houserel(bachmann, jupiter, 2).
discordant(bachmann, moon, jupiter).
houserel(bachmann, mercury, 10).
planet(bachmann, moon, aquarius).
planet(bachmann, venus, gemini).
discordant(bachmann, moon, pluto).
blending(bachmann, sun, mercury).

%% mlk
sign(king, capricorn).
planet(king, mercury, aquarius).
discordant(king, mars, saturn).
planet(king, saturn, sagittarius).
discordant(king, sun, pluto).
planet(king, moon, pisces).
planet(king, jupiter, taurus).
harmonizing(king, saturn, neptune).
planet(king, mars, gemini).
car(king).
harmonizing(king, jupiter, saturn).
planet(king, sun, capricorn).
planet(king, venus, pisces).
discordant(king, sun, jupiter).



:-end_bg.

:-begin_in_pos.




pacifist(gandhi, ypacifist).
pacifist(mandela, ypacifist).
pacifist(einstein, ypacifist).
pacifist(king, ypacifist).



pacifist(hitler, npacifist).
pacifist(washington, npacifist).
pacifist(mckinley, npacifist).
pacifist(bush, npacifist).



popular(lincoln, ypopular).
popular(kennedy, ypopular).
popular(obama, ypopular).
popular(washington, ypopular).
popular(roosevelt, ypopular).
popular(gandhi, ypopular).


popular(mckinley, npopular).
popular(garfield, npopular).
popular(bush, npopular).
popular(hitler, npopular).
popular(trump, npopular).



danger(lincoln, ydanger).
danger(mckinley, ydanger).
danger(kennedy, ydanger).
danger(garfield, ydanger).
danger(karl, ydanger).
danger(gandhi, ydanger).
danger(king, ydanger).


danger(obama, ndanger).
danger(bush, ndanger).
danger(roosevelt, ndanger).
danger(washington, ndanger).
danger(trump, ndanger).
danger(einstein, ndanger).






intelligent(newton, yintelligent).
intelligent(einstein, yintelligent).
intelligent(gauss, yintelligent).
intelligent(euler, yintelligent).
intelligent(vinci, yintelligent).
intelligent(obama, yintelligent).
intelligent(lincoln, yintelligent).


intelligent(bush, nintelligent).
intelligent(trump, nintelligent).
intelligent(bachmann, nintelligent).
intelligent(gandhi, nintelligent).
intelligent(mckinley, nintelligent).



:-end_in_pos.
:-begin_in_neg.



:-end_in_neg.
:-aleph_read_all.
