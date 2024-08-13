\version "2.20.0"

\header {
      title = \markup { \fontsize #3 \bold "Killing Me Softly With His Song"}
      poet = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words by"} }
          \line{\center-align \fontsize #0 "Norman Gimbel, Lori Lieberman"}
        }
      }
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Music by"} }
          \line{\center-align \fontsize #0 "Charles Fox"}
        }
      }
      subtitle = "(The Chorus)"
      instrument = "Vocals"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
      tagline=##f
    }

% ***** Accords *****
accords_intro = \chordmode {
  f1:m7 | bes1:m7 | ees1:7 | aes1:maj7 | f1:m | bes1:/d
  ees1: | des1: | aes1: | des1: | 
  ges1*2:maj7 | f1*2: |
}

accords_verse = \chordmode {
  | s2. e4: |
  \repeat "volta" 2 {
    a2.:m d4: | g2.: g4: |
    d2.:/fis d4:/fis | f2. e4: |
  }
}

accords = \chordmode { 
  % Intro Piano
  \accords_intro
  %R1*8
  \accords_intro
  % Introduction Hooo
  % \accords_hoo
  % Introduction Do me Do me
  % \accords_do_me
  % Verse
  % \accords_verse

}

% ***** Voix *****

global = {
  \time 4/4
  \key f \minor
  \tempo 4=106
  \compressFullBarRests % compress rest bars
}

% ***** Soprano *****
soprano_chorus = \relative c'' {
  %\mark \markup \center-column { \box Chorus }
  R1*2 | %aes8 aes aes aes~ aes f c ees~ | ees des4.~ des2 |
  bes8 bes bes bes~ bes bes bes aes~ | aes2. r4 | aes8 aes aes aes~ aes aes aes aes ~ |
  aes aes4. aes8 aes aes aes( | bes) bes4.~ bes8 r bes8 bes~ |bes8 aes4. aes8 aes aes aes~ |
  aes aes4.~ aes4 aes8 aes~ | aes f4. f8 f f f~ | f f4.~ f2 ~ |
  f2 f8 f4 f8~ f1~ | f2. r4 |
}

soprano_verse_i = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  
  % ^\segno
}

soprano_chorus_ooh = \relative c'' {
  %\mark \markup \center-column { \box Chorus }
  R1*4
  c8 c4 c c  bes8~ | bes8 bes4.~ bes4 d( |
  c4 bes4.) bes4 bes8~ | bes8( aes4.~) aes4 f |
  f4 ees2.~ | ees4 des2.~ | des1~ | des2. r4 |
  c4.\( des8( c4.) des8( | c des)  c2\) r4 |
}

soprano = \relative c'' {
  \global
  % Intro
  \soprano_chorus
  %R1*8
  \soprano_chorus_ooh
   
}

% ***** Alto (solo) *****
alto_chorus = \relative c'' {
  %\mark \markup \center-column { \box Chorus }
  aes8 aes aes aes~ aes f c ees~ | ees des4.~ des2 |
  g8 g g g~ g ees bes c~ | c2. r4 | c8 c c c~ c f aes g ~ |
  g f4. bes8 bes bes aes~ | aes g4.~ g8 r ees8 g~ |g8 f4. f8 f f f~ |
  f ees4.~ ees4 c8 ees~ | ees des4. des8 des des c~ | c bes4.~ bes2 ~ |
  bes2 bes8 bes4 c8~ c1~ | c2. r4 |
}

alto_verse_i = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  
  % ^\segno
}

alto_chorus_ooh = \relative c'' {
  %\mark \markup \center-column { \box Chorus }
  r4 r8 aes~ aes4 g8 f~ | f2~ f8 g aes g~ |
  g4 aes8 g4 f  ees8~ | ees2. r4 |
  aes8 aes4 aes g  g8~ | g8 f4.~ f4 bes( |
  aes4 g4.) ees4 g8~ | g8( f4.~) f4 aes |
  f4 ees2.~ | ees4 f2.~ | f1~ | f2. r4 |
  f4.\( ges8( f4.) ges8( | f ges f2)\)  r4 |
}

alto = \relative c'' {
  \global
  % Intro
  \alto_chorus
  \bar"||" %R1*8
  \alto_chorus_ooh
  \bar"||"
   
}

% ***** Ténor *****

% %Old
% tenor_chorus = \relative c' {
%   f8 f f f~ f f f ees~ | ees f4.~ f2 |
%   ees8 ees ees ees~ ees ees ees ees~ | ees2. r4 | 
%   aes8_"Cue intro" aes aes aes~ aes f f ees ~ |
%   ees d4. f8 f f f~ | f ees4.~ ees8 r ees8 ees~ | ees8 des4. des8 des des des~ |
%   des c4.~ c4 c8 c~ | c des4. f8 f f f~ | f <des ges>4.~ <des ges>2 ~ |
%   <des ges>2 <des ges>8 <des ges>4 <a f'>8~ | <a f'>1~ | <a f'>2. r4 |
% }

tenor_chorus = \relative c' {
  \small
  f8_"1x Tacet" f f f~ f f aes, c~ | c bes4.~ bes2 |
  ees8 ees ees ees~ ees ees ees ees~ | ees2. r4 | 
  \normalsize
  f8_"Cue intro" f f f~ f f ees d ~ |
  d d4. d8 d d d( | ees) ees4.~ ees8 r ees8 c~ | c8 des4. des8 des des <aes c>~ |
  <aes c> <aes c>4.~ <aes c>4 <aes c>8 <aes c>~ | <aes c> bes4. bes8 bes bes bes~ | bes <ges des'>4.~ <ges des'>2 ~ |
  <ges des'>2 <ges des'>8 <ges des'>4 a8~ | a1~ | a2. r4 |
}

tenor_verse_i = \relative c'' {
  c2.( b | c a) | c2.( b | c c) |
  c2.( b | c a) | R1. * 2 \bar "||"
  % ^\segno
}

tenor_chorus_ooh = \relative c' {
  %\mark \markup \center-column { \box Chorus }
  R1*4
  f8 f4 f ees  ees8~ | ees8 bes4.~ bes2 |
  ees2~ ees8 c4 ees8~ | ees8( des4.~) des4 des |
  c4 c2.~ | c4 bes2.~ | bes1~ | bes2. r4 |
  a4.\( bes8 a4. bes8( | a bes)  a2\) r4 |
}

tenor = \relative c'' {
  \global
  % Intro
  \tenor_chorus
  %R1*8
  \tenor_chorus_ooh 
}

verseOne = \lyricmode {
  %\set stanza = "1."
  Strum- ming my pain with his fin- gers
  Sing- ing my life with his words
  Kill- ing me soft- ly with his song
  Kill- ing me soft- ly with his song
  Tell- ing my whole life with his words
  Kill- ing me soft- ly with his song
  
  Ooh _ _ _ _ _ _ _ _ _
  La la la la la la
  Ooh _ _
  La la la la
  Aah _ _
  
  % I heard he sang a good song
%   I heard he had a style
%   And so I came to see him
%   To list- en for a while
%   And there he was this young boy
%   A stran- ger to my eyes
%   
%   I felt all flushed with fever
%   Em- bar- rassed by the crowd
%   I felt he found my lett- ers
%   And read each one out loud
%   I prayed that he would fi- nish
%   But he just kept right on
%   
%   He sang as if he knew me
%   In all my dark des- pair
%   And then he looked right through me
%   As if I was- n't there
%   And he just kept on sing- ing
%   Sing- ing clear and strong


}

% verseTwo = \lyricmode {
%   \set stanza = "2."
%   ho
%   
% }
% 
% verseThree = \lyricmode {
%   \set stanza = "3."
%   ho
%   
% }

\score {
  \new ChoirStaff <<
    % Soprano
    \chords {
        \accords                
      }
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "SOPRANO" }
    } <<
      \new Voice = "soprano" { \voiceTwo {\soprano} }
    >>
    % Alto
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "ALTO" }
    } <<
      \new Voice = "alto" { \voiceOne {\alto} }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseOne
%    \ new Lyrics \with {
%       \override VerticalAxisGroup #'staff-affinity = #CENTER
%     } \lyricsto "alto" \verseTwo
%     \new Lyrics \with {
%       \override VerticalAxisGroup #'staff-affinity = #CENTER
%     } \lyricsto "alto" \verseThree
    % Tenor
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "TENOR" }
    } <<
      %\clef bass
      \new Voice = "tenor" { \voiceTwo {\tenor} }
    >>
  >>
  \layout { }
  \midi { }
}
