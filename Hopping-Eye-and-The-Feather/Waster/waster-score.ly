\version "2.8.7"

% \paper {
%   #(define dump-extents #t)
%   indent = 10\mm
%   ragged-right = ##t
% }

\header {
  title = "Waster"
  composer = "Hopping Eye and The Feather"
  subtitle = "Faces - 2014"
 % opus = "Op. 9"
 copyright = "Hopping Eye and The Feather - 2014"
}

%{
*************************
*     				                *
*	 Definition des voix 	*
*     				                *
*************************
%}

% ***** Accords *****
chrdVerse = \chordmode {
  bes1:m ees1:7 aes1 f:7
  bes1:m ees1:7 aes1 aes1  
}
chrdRefrain = \chordmode {
  ges1 aes1 des2 des2/c bes2:m bes2:m/aes
  ges1 aes1 des2 des2/c bes2:m bes2:m/aes
  ges1 ges1 aes1 aes1
}
chrdPont = \chordmode {
  bes1:m bes1:m bes1:m bes1:m 
}
% ***** Chant *****
melVerse = {
  b'8 b4 |
}
partieChant = \relative c' {
      R1*7 | r2 r8 bes8 bes4 % Introduction m8
      \repeat "volta" 3 {
      | f'8 f f f f4 r8 f | g8 g4 g8 g4 ees8 ees | ees8 ees4 ees8 ees4 des4 | c4 r4 bes4 c8 des8~|
      des8 des4 des8 des4 r8 c8 | des8 des4 des8 des4 bes8 aes8 | aes4 r4 r2 | r2 r8 aes'8 aes4 | 
      \inStaffSegno
      bes8 bes bes bes bes4 bes8 bes | c8 des4 c4 aes8 aes aes | aes4. ges8 f f ges4 | f4 r4 ees8 f4 ges8~ |
      ges8 ges ges ges ges ges ees des | ees f4 ees des8 des8 ees | f4 r aes8 aes4 bes8(~ | bes4 f4) ees8( f4) ees8~ | 
      ees2 r4 bes8 bes | bes4  bes f'( ees~ | ees1) | r1 |
      }
      \alternative { {R1*3 | r2 r8 bes8 bes4 } { R1*3 | r2 r8 aes'8 aes4_"D.S." \bar "||" }}
      R1*4 \bar "||"
      R1*12 \bar "||"
      R1*4 \bar "|."
}
versei =  \lyricmode {
   I was walk ing through the street
  Old shoes on my feet
  The sun is raising and I don't mind
  There's no one back to me
  Only a shade follow me
  But I'm fine
}  
verseii =  \lyricmode {  
  And I light { \skip 1 } cig ar ettes 
  { \skip 1 } life is a set
  I could lose { \skip 1 } but I don't mind
  If the sun lights the street
  For the sack of pete
  I am fine
}
 verseiii =  \lyricmode { 
  I was walk ing like a swagger
  A stone on my shoulder
  The sun de creases and I don't mind
  There's no one back to me
  Not e- ven a shade fo- llow me
}
chorus = \lyricmode {
  And I rea- lly rea- lly guess
  That's al ways the same
  You says He llo I rea lly don't mind
  and it's rea- lly rea- lly time
  to ge-tting an off- ense
  but an- y- time I am fine
  I thought I'm al- ways con- fused
}

% ***** Trompette Voix 1 *****

partieTpti = {

}

% ***** Trompette 2 *****

partieTptii = {

}

% ***** Trompette 3 *****

partieTptiii = {

}

%{
**************************
*                        *
* Mise en place des voix *
*                        *
**************************
%}

\score {
        <<
            \chords {
                \chrdVerse
                \chrdVerse
                \chrdRefrain
                \chrdPont   
                \chrdPont 
                \chrdPont 
                \chrdRefrain
                \chrdPont                 
            }
            \new Voice = "one" {
                \clef G
                \time 4/4
                \key as \major 
                \tempo 4=180
                \partieChant
            }
            \new Lyrics \lyricsto "one" {
                \set stanza = "1. "
                \once \override LyricText.self-alignment-X = #LEFT %aligne les paroles à gauche de la note
                 \versei
                 \chorus
            }
            \new Lyrics \lyricsto "one" {
                \set stanza = "2. "
                \once \override LyricText.self-alignment-X = #LEFT 
                 \verseii
            }
            \new Lyrics \lyricsto "one" {
                \set stanza = "3. "
                \once \override LyricText.self-alignment-X = #LEFT 
                 \verseiii
            }
        >>
%         \new StaffGroup {
%                 \new Staff \relative c' {
%                       \set Staff.instrument="chant"
%                       \clef G
%                       \time 4/4
%                       \partieTpti
%                 }
%                  \new Staff \relative c' {
%                       \set Staff.instrument="chant"
%                       \clef G
%                       \time 4/4
%                       \partieTptii
%                 }
%         }
}

