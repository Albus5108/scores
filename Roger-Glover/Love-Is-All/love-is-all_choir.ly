\version "2.20.0"

% ***** Accords *****
accords_intro = \chordmode {
  s2 s4 e4:7 | a2.:m g4: | c2: | d4:m c4: g:/b d:7/a | e2:m e: | 
  f2: d:/fis | g1: | e4: a2:m g4: | c2: | d4:m c4:/e f: d:/fis |
  g2: e2: | a2:m e2: |
}

accords_hoo = \chordmode {
  | a2.:m e4: |
  \repeat "volta" 2 {
    a2.:m g4: | c2: |
  }
  \alternative {{d4:m c4:/e f: d:7/fis | g2.: e4: }
                {d4:m c4: g:/b d:/a | e4:m e:sus2 e2:}}
   f2: d:/fis | g1: | g2: e:/gis | a2:m g2:sus4 | d2: d2:m |
}

accords_do_me = \chordmode {
  | s2. e4: |
  \repeat "volta" 2 {
    a2.:m g4: | c2: |
  }
  \alternative {{d4:m c4:/e f: d:7/fis | g2.: e4: }
                {d4:m c4:/e f: d:7/fis | g1:7}}
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
  %\accords_intro
  % Introduction Hooo
  % \accords_hoo
  % Introduction Do me Do me
  % \accords_do_me
  % Verse
  % \accords_verse

}

% ***** Voix *****

global = {
  \time 12/8
  %\key c \major
  \tempo 4. =110
  \compressFullBarRests % compress rest bars
}

choir_interlude = \relative c'' {
  \key d \major
  R1. * 4 \bar "||"
  \key c \major
}

% ***** Soprano *****
soprano_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  e2.~ e4. d4 a8( | a1.) | e'2.~ e4. d4 c8( | c1.) |
  e2.~ e4. d4 a8( | a1.) | r4. e'4 d8 e4 c8 d4. | c2.~ c4. r 
}

soprano_verse_i = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  e2.( d | e a,) | e'2.( d | e c) |
  e2.( d | e a,) | R1. * 2 \bar "||"
  % ^\segno
}

soprano_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  r4. g,4 a8 b4 c8 d4 e8 | g1. |
  r1. | e'4. e4. c4. c4. |
  c2.( d | e d) | R1. * 2 % r4. d,4 d8 g4 g8~ g4 b8~ | b2. r2. | 
  % ^\segno
}

soprano_waltz = \relative c'' {
  \time 3/4 
  \key a \major
  R2. * 30 \bar "||"
  \key c \major
  \time 12/8 R1. \bar "||"
}

soprano = \relative c'' {
  \global
  % Intro
  \choir_interlude 
  % Verse 1 et 2
  R1. * 8  \bar "||" R1. * 8 \bar "||" 
  % Chorus
  \soprano_chorus \bar "||"
  % Post chorus
  \choir_interlude 
  % Verse 3
  \soprano_verse_i
  % Chorus
  \soprano_chorus \bar "||"
  \soprano_waltz
  % Verse 4
  \soprano_verse_ii
  % Chorus
  \repeat "volta" 2 {
  \soprano_chorus
  }  
}

% ***** Alto *****

alto_chorus = \relative c'' {
  a2.~ a4. a4 fis8( | fis1.) | g2.~ g4. g4 e8( | e1.) |
  a2.~ a4. a4 fis8( | fis1.) | r4. g4 g8 g4 e8 f4. | e2.~ e4. r 
}

alto_verse_i = \relative c'' {
  c2.( b | c a) | c2.( b | c c) |
  c2.( b | c a) | R1. * 2 \bar "||"
  % ^\segno
}

alto_verse_ii = \relative c'' {
  r4. g,4 a8 b4 c8 d4 e8 | e1. |
  r1. | c'4. c4. a4. a4. |
  g2.( b | c a) | R1. * 2 % r4. d,4 d8 g4 g8~ g4 b8~ | b2. r2. | 
  % ^\segno
}

alto_waltz = \relative c'' {
  \time 3/4 R2. * 30 \bar "||"
  \time 12/8 R1. \bar "||"
}

alto = \relative c'' {
  \global
  % Intro
  \choir_interlude 
  % Verse 1 et 2
  R1. * 8  \bar "||" R1. * 8 \bar "||" 
  % Chorus
  \alto_chorus \bar "||"
  % Post chorus
  \choir_interlude 
  % Verse 3
  \alto_verse_i
  % Chorus
  \alto_chorus \bar "||"
  \alto_waltz
  % Verse 4
  \alto_verse_ii
  % Chorus
  \repeat "volta" 2 {
  \alto_chorus
  }  
}

% ***** Tenor *****

tenor_chorus = \relative c'' {
  c2.~ c4. b4 c8( | c1.) | b2.~ b4. b4 g8( | g1.) |
  c2.~ c4. b4 c8( | c1.) | r4. b4 b8 b4 g8 g4. | g2.~ g4. r 
}

tenor_verse_i = \relative c'' {
  g2.( g | g f) | g2.( g | g a) |
  g2.( g | g f) | R1. * 2 \bar "||"
  % ^\segno
}

tenor_verse_ii = \relative c'' {
  r4. g4 a8 b4 c8 d4 e8 | c1. |
  r1. | g4. g4. f4. f4. |
  e2.( g | g f) | R1. * 2 % r4. d,4 d8 g4 g8~ g4 b8~ | b2. r2. | 
  % ^\segno
}

tenor_waltz = \relative c'' {
  \time 3/4 R2. * 30 \bar "||"
  \time 12/8 R1. \bar "||"
}

tenor = \relative c'' {
  \global
  % Intro
  \choir_interlude 
  % Verse 1 et 2
  R1. * 8  \bar "||" R1. * 8 \bar "||" 
  % Chorus
  \tenor_chorus \bar "||"
  % Post chorus
  \choir_interlude 
  % Verse 3
  \tenor_verse_i
  % Chorus
  \tenor_chorus \bar "||"
  \tenor_waltz
  % Verse 4
  \tenor_verse_ii
  % Chorus
  \repeat "volta" 2 {
  \tenor_chorus
  }  
}

% ***** Bass *****

bass_chorus = \relative c'' {
  a2.~ a4. a4 d,8( | d1.) | g2.~ g4. g4 c,8( | c1.) |
  a'2.~ a4. a4 d,8( | d1.) | r4. g4 g8 g4 g8 g4. | c,2.~ c4. r 
}

bass_verse_i = \relative c'' {
  c,2.( d | e f) | c2.( d | e f) |
  c2.( d | e f) | R1. * 2 \bar "||"
  % ^\segno
}

bass_verse_ii = \relative c'' {
  R1. * 2 % r4. g4 a8 b4 c8 d4 e8 | g1. |
  r1. | e,4. e4. f4. f4. |
  c2.( d | e f) | R1. * 2 % r4. d,4 d8 g4 g8~ g4 b8~ | b2. r2. | 
  % ^\segno
}

bass_waltz = \relative c'' {
  \time 3/4 R2. * 30 \bar "||"
  \time 12/8 R1. \bar "||"
}

bass = \relative c'' {
  \global
  % Intro
  \choir_interlude 
  % Verse 1 et 2
  R1. * 8  \bar "||" R1. * 8 \bar "||" 
  % Chorus
  \bass_chorus \bar "||"
  % Post chorus
  \choir_interlude
  % Verse 3
  \bass_verse_i
  % Chorus
  \bass_chorus \bar "||"
  \bass_waltz
  % Verse 4
  \bass_verse_ii
  % Chorus
  \repeat "volta" 2 {
  \bass_chorus
  }  
}

verseOne = \lyricmode {
  %\set stanza = "1."
  Love___ is all____
  Love___ is all____
  Love___ is all____
  at the Bu- tter- fly Ball____
  
  Hoo____ Hoo____
  Hoo____ 
  
  Love___ is all____
  Love___ is all____
  Love___ is all____
  at the Bu- tter- fly Ball____
  
  Love is all is all you need
  Let the peo- ple know____
  %Let your fee- lings show
  
  Love___ is all____
  Love___ is all____
  Love___ is all____
  at the Bu- tter- fly Ball____
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



\book{
  \bookOutputSuffix "Choir"
  \header {
      title = \markup { \fontsize #3 \bold "Love Is All"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Roger Glover"}
        }
      }
      subtitle = ""
      instrument = "Choir"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
      tagline=##f
    }
  \score {
  \new ChoirStaff <<
    \chords {
        \accords                
      }
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \transpose c aes, {\soprano} }
      \new Voice = "alto" { \voiceTwo \transpose c aes, {\alto} }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
%    \ new Lyrics \with {
%       \override VerticalAxisGroup #'staff-affinity = #CENTER
%     } \lyricsto "soprano" \verseTwo
%     \new Lyrics \with {
%       \override VerticalAxisGroup #'staff-affinity = #CENTER
%     } \lyricsto "soprano" \verseThree
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { T B }
    } <<
      %\clef bass
      \new Voice = "tenor" { \voiceOne \transpose c aes, {\tenor} }
      \new Voice = "bass" { \voiceTwo \transpose c aes, {\bass} }
    >>
  >>
  \layout { }
  \midi { }
  }
}