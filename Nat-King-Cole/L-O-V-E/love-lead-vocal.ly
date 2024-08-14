\version "2.24.1"

% ***** Violons ***** 
dashPlus = "trill"
vcl_intro = \relative c'' {
  R1*4 
}

vcl_verse = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  g2. fis4 | fis e dis e | g2. fis4 | fis2. r4 |
  fis2. e4 | e d cis d | fis2. e4 | e2. r4 |
  b'2. a4 | a g fis g | b2. a4 | a g fis g | 
  b2. a4 | a g fis g | b a a g | g fis e fis |
}

vcl_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  g2. fis4 | fis e dis e | g2. fis4 | fis2. r4 |
  fis2. e4 | e d cis d | fis2. e4 | e2. r4 |
  b'2. a4 | a g fis g | b a a g | g fis e fis | 
  g2. fis4 | fis e fis a | g4 r4 r2 | r1 |
}

vcl_trumpet_solo = \relative c'' {
  \mark \markup \center-column { \box "Trumpet Solo" }
  \key aes \major
  R1*16
  
}

vcl_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  \key a \major
  \transpose g a {\vcl_verse}
}

vcl_verse_iv = \relative c'' {
  \mark \markup \center-column { \box "Verse 4" }
  \transpose g a {
    \vcl_verse_ii
  }
  \transpose g a {
    \relative c'' {
      g2. fis4 | fis e fis a | g4 r4 r2 | r1 |
      g2. fis4 | fis e fis a | g4 r4 r2 | r1 |
    }
  }
  R1*3 |
}

vcl = \relative c'' {
  \global
  % Intro 
  \vcl_intro \bar"||"
  % Verse 1 et 2
  \vcl_verse \bar"||"
  \vcl_verse_ii \bar"||"
  % Trumpet solo
  \vcl_trumpet_solo \bar"||"
  % Verse 3
  \vcl_verse_iii \bar"||"
  % Chorus
  \vcl_verse_iv \bar"|."
}

\book{
  \bookOutputSuffix "lead-vocal"
  \header {
      title = \markup { \fontsize #3 \bold "L-O-V-E"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
        }
      }
      subtitle = ""
      instrument = "Vocal"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      \chords {
        %\accords                
      }
      \new StaffGroup <<
        \new Staff \relative c' {
          \set Staff.instrument="electric piano 1"
          \transpose g a {\vcl}
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}