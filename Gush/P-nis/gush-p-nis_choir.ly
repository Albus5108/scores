\version "2.20.0"

\header {
      title = \markup { \fontsize #3 \bold "P-nis"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Gush"}
        }
      }
      subtitle = ""
      instrument = "Choir"
      % opus = "Op. 9"
      % copyright= \markup { "Arthur Petit - Copyright 2022" \char ##x00A9 }
      tagline=##f
    }

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
  \accords_hoo
  % Introduction Do me Do me
  \accords_do_me
  % Verse
  \accords_verse

}

% ***** Voix *****
intro_piano = \relative c'{
  R1 \bar "||" R1  \bar "||" \time 2/4 R2 \bar "||" \time 4/4 R1 * 4 | \bar "||"
  R1 \bar "||" \time 2/4 R2 \bar "||" \time 4/4 R1 * 3
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=90
  %Intro Piano
  %\intro_piano 
}

% ***** Soprano *****
soprano_hoo = \relative c'' {
  r2 r4 b4( | 
  \repeat "volta" 2 {
    c2) r4 d( \bar "||" \time 2/4 e2) |
  }
  \alternative {{\bar "||" \time 4/4 d4( c4 d c | d2.) b4}
                {\time 4/4 d4( c4 d c) | b2. r4}}
  \bar "||"
  a2( d4 c | b2) r | b( d | c) g( | a a) | r r4 b8 b % \bar "||"
}

soprano_do_me = \relative c'' {
  \repeat "volta" 2 {
    c8^\segno c r4 r d8 d \bar "||" \time 2/4 e8 e r8. a,16 |
  }
  \alternative {{\bar "||" \time 4/4 d8 d c16 c8 d16~ d8 c8 c c | d8 d~ d2 b8 b}
                {\time 4/4 d8 d c16 c8 d16~ d8 c8 c c \bar "||" }}
  \tempo 4=110
  f8 \magnifyMusic 0.63 {e\glissando} f2.~ | f2\bendAfter #-6 r4 b,( | 
}

soprano_verse = \relative c'' {
  \repeat "volta" 2 {
    c4)  r4 r a( | b4) r r b( |
    a) r r a( | a) r r b^\markup {
    \italic "D.S. "
    \tiny \raise #1	
    \musicglyph "scripts.segno"
  }
  }
}

soprano = \relative c'' {
  \global
  % Introduction Hooo
  \soprano_hoo
  % Introduction Do me Do me
  \soprano_do_me 
  % Verse
  \soprano_verse
  
}

% ***** Alto *****

alto_hoo = \relative c' {
  r2 r4 gis'4( | 
  \repeat "volta" 2 {
    a2) r4 b( \bar "||" \time 2/4 c2) |
  }
  \alternative {{\bar "||" \time 4/4 a4( g~ g a | b2.) gis4}
                {\time 4/4 a4( g~ g a) | g4( fis gis) r4}}
  \bar "||"
  f2( fis | g2) r | g( gis | a) g( | fis f) | r r4 gis8 gis % \bar "||"
}

alto_do_me = \relative c' {
  \repeat "volta" 2 {
    a'8 a r4 r b8 b \bar "||" \time 2/4 c8 c r8. a16 |
  }
  \alternative {{\bar "||" \time 4/4 a8 a g16 g8 g16~ g8 g8 a a | b8 b~ b2 gis8 gis}
                {\time 4/4 a8 a g16 g8 g16~ g8 g8 a a \bar "||" }}
  d8 \magnifyMusic 0.63 {cis\glissando} d2.~ | d2\bendAfter #-6 r4 s4 | % gis, 
}

alto_verse = \relative c'' {
  \repeat "volta" 2 {
    s1 * 4
  }
}

alto = \relative c' {
  \global
  % Introduction Hooo
  \alto_hoo
  % Introduction Do me Do me
  \alto_do_me
  % Verse
  \mark \markup \box "Verse"
  \alto_verse
}

% ***** Tenor *****

tenor_hoo = \relative c' {
  r2 r4 e4( | 
  \repeat "volta" 2 {
    e2) r4 g( \bar "||" \time 2/4 g2) |
  }
  \alternative {{\bar "||" \time 4/4 f4( g~ g a | b2.) e,4}
                {\time 4/4 a4( g~ g a) | e2. r4}}
  \bar "||"
  d2 d | d2 r | d( e | e) d( | d d) | r r4 e8 e % \bar "||"
}

tenor_do_me = \relative c' {
  \repeat "volta" 2 {
    e8 e r4 r g8 g \bar "||" \time 2/4 g8 g r8. f16 |
  }
  \alternative {{\bar "||" \time 4/4 f8 f g16 g8 g16~ g8 g8 a a | b8 b~ b2 e,8 e}
                {\time 4/4 a8 a g16 g8 g16~ g8 g8 a a \bar "||" }}
  b8 \magnifyMusic 0.63 {ais\glissando} b2.~ | b2\bendAfter #-6 r4 gis( | 
}

tenor_verse = \relative c'' {
  \repeat "volta" 2 {
    a4) r4 r fis( | g4) r r g( |
    fis) r r fis( | f) r r gis |
  }
}

tenor = \relative c' {
  \global
  % Introduction Hooo
  \tenor_hoo
  % Introduction Do me Do me
  \tenor_do_me
  % Verse
  \tenor_verse
  
}

% ***** Bass *****

bass_hoo = \relative c {
  r2 r4 e'4( | 
  \repeat "volta" 2 {
    a,2) r4 g( \bar "||" \time 2/4 c2) |
  }
  \alternative {{\bar "||" \time 4/4 d4( e f fis | g,2.) e'4}
                {\time 4/4 d4( c b a) | e2. r4}}
  \bar "||"
  f2( fis | g2) r | g( gis | a) c( | d c) | r r4 e8 e % \bar "||"
}

bass_do_me = \relative c {
  \repeat "volta" 2 {
    a'8 a r4 r g8 g \bar "||" \time 2/4 c8 c r8. d16 |
  }
  \alternative {{\bar "||" \time 4/4 d8 d e16 e8 f16~ f8 f8 fis fis | g,8 g~ g2 e'8 e}
                {\time 4/4 d8 d e16 e8 f16~ f8 f8 fis fis \bar "||" }}
  g8 \magnifyMusic 0.63 {fis\glissando} g2.~ | g2\bendAfter #-6 r4 e( | 
}

bass_verse = \relative c {
  \repeat "volta" 2 {
    e'4) r4 r d( | d4) r r d( |
    d) r r d( | c) r r e
  }
}

bass = \relative c {
  \global
  % Introduction Hooo
  \bass_hoo
  % Introduction Do me Do me
  \bass_do_me
  % Verse
  \bass_verse
  
}

verseOne = \lyricmode {
  %\set stanza = "1."
  hoo hoo hoo 
  ho 
  hoo hoo hoo hoo hoo Do me
  
  Do me all night ba- by
  I just can't get en- ough, I'm way too nee- dy Do me
  just can't get en- ough, I'm way too nee- dy 
  hoo hoo hoo hoo hoo hoo hoo hoo hoo hoo
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
    \chords {
        \accords                
      }
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
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
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout { }
  \midi { }
}
