\version "2.20.0"

\header {
      title = \markup { \fontsize #3 \bold "Lonesome Tears"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words & Music by"} }
          \line{\center-align \fontsize #0 "The Crickets"}
        }
      }
      subtitle = "Back Vocals"
      % instrument = "Vocals"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2024" \char ##x00A9 }
      tagline=##f
    }

% ***** Accords *****
accords_intro = \chordmode {
  b1:7 |
}

accords_verse = \chordmode {
  e1: |  cis:m |
  gis1:7 | a1: | e2: cis:m7 | fis2: b:7 |
  e2: a:7-9 |  e4: b2.:7 |
  
  e1: |  cis1:m |
  gis1:7 | a: | e2: cis:m7 | fis2: b:7 |
  e2: a:7-9 |  e4: e2.:7 |
}

accords_bridge = \chordmode {
  a1: | a1: |
  e2: a2:/e | e2: e2:7
  a1: | a1: |
  fis1:7 | b:7
}

accords = \chordmode { 
  \accords_intro
  \accords_verse
  \accords_bridge

}

% ***** Voix *****

global = {
  \time 4/4
  \key e \major
  \tempo 4 = 115
  %\compressFullBarRests % compress rest bars
}

% ***** Alto *****
alto_intro = \relative c' {
  r1 |  
}

alto_verse_i = \relative c' {
  \mark \markup \center-column { \box "Verse 1" }
  gis'4 gis8 gis8~ gis4 r4 |
  gis gis8 gis8~( gis8 a8) r4 |  gis gis8 gis4. r4 |  a a8 a4. r4 |  gis2\( b |
  ais a\) |  b4 dis d8 cis4 b8~ b8 dis4 dis8 dis2 
}

alto_verse_ii = \relative c' {
  \mark \markup \center-column { \box "Verse 2" }
  r2 b' | r2  cis r2 |  bis r2 |
  cis r4 b |  r4 d r4 cis |  r4 bis r4 d |  r8 cis4. r8 b b b |
  b b b b cis1~( cis2. dis4 b2 cis dis b) | cis1~ | cis1 r1 |  b4 a gis fis |
}

alto = \relative c'' {
  \global
  % Intro
  \alto_intro \bar"||"
  \alto_verse_i \bar"||" 
  \alto_verse_ii \bar"||"
}

% ***** Tenor (solo) *****
tenor_chorus = \relative c' {
  r1 |
  gis'4 gis8 gis4. r4 |  gis gis8 gis4. r4 |  gis gis8 gis4. r4 |  a a8 a4. r4 |
  gis2\( b |  ais a\) |  gis4 b ais8 a4 gis8~ | gis8 b4 b8 b2 r2 gis r2 |  gis r2 |
  gis r2 |  a r4 gis |  r4 b r4 ais |  r4 a r4 b |
  r8 a4. r8 gis gis gis |  gis gis gis gis 
  
  a1(~ a1 | gis2 a | b gis) | a1~ | a1 | r1 |
  b4 a gis fis |
}

tenor_verse_i = \relative c' {
  
}

tenor_chorus_ooh = \relative c' {
  
}

tenor = \relative c'' {
  \global
  % Intro
  \tenor_chorus
  \bar"||" %R1*8
  \tenor_chorus_ooh
  \bar"||"
   
}

% ***** Ténor *****

bass_chorus = \relative c' {
  r1 |  e4 e8 e4. r4 |  cis cis8 cis4. r4 |
  bis bis8 bis4. r4 |  cis cis8 cis4. r4 |  e,2\( gis |  fis fis\) |
  e4 gis g8 fis4 e8~ e8 b'4 b8 b2 r2 e, r2 |  gis r2 |  gis r2 |  a r4 e |
  r4 gis r4 fis |  r4 fis r4 g |  r8 fis4. r8 e e e |  e e e e 
  
  a1~( a1 | gis2 a |
  b gis) | a1~ | a1 | r1 |  b4 a gis fis |
}

bass_verse_i = \relative c'' {
  
}

bass_chorus_ooh = \relative c' {
  
}

bass = \relative c'' {
  \global
  % Intro
  \bass_chorus
  %R1*8
  \bass_chorus_ooh 
}

verseOne = \lyricmode {
  "Lone-"4 "some"8 "tears"8*5 |  "Lone-"4 "some"8 "blue"8*5 |  "Lone-"4 "some"8 "tears"8*5 |  "Lone-"4 "some"8 "tears"8*5 |
  "Ooh"2 "wha" |  "Ooh" "wha" |  "Ooh"4 "I" "cried"8 "for"4 "you" "lone-" "some"8 "tears"1 "Baa" |  "Baa" |
  "Baa" |  "Baa"2. "Baa"2 "Baa" "Baa" |
  "Baa" "Baa"4. "Baa"2 "Ba"8 "ba" "ba" "ba" "ba" "ba" "ba" "Baa..."1*4   "Baa"1*3 "Ba"4 "ba" "ba" "ba" |

}

\score {
  \new ChoirStaff <<
    % Soprano
    \chords {
        \accords                
      }
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "ALTO" }
    } <<
      \new Voice = "alto" { \voiceTwo {\alto} }
    >>
    % Tenor
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "TENOR" }
    } <<
      \new Voice = "tenor" { \voiceOne {\tenor} }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "tenor" \verseOne
%    \ new Lyrics \with {
%       \override VerticalAxisGroup #'staff-affinity = #CENTER
%     } \lyricsto "tenor" \verseTwo
%     \new Lyrics \with {
%       \override VerticalAxisGroup #'staff-affinity = #CENTER
%     } \lyricsto "tenor" \verseThree
    % Tenor
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "BASS" }
    } <<
      \clef bass
      \new Voice = "bass" { \voiceTwo {\bass} }
    >>
  >>
  \layout { }
  \midi { }
}
