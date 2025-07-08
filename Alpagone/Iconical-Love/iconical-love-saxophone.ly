\version "2.20.0"
% ***** Saxophone *****

sax_intro = \relative c' {
  R1*8 | r2 r4 r8 c 
}

sax_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  \repeat "volta" 2 {
    \time 4/4 a'8 c8~ c4 r4 r8 f,16 e~ | e4 r4 r4 e'16 f8 a,16~ | a4 r4 r2 | r2 r4 r16 f8 e16 |
    f8 c'~ c4 r4. f,16 e~ | e8 f~ f4 r4. c'16 e,~ | 
  }
  \alternative{
    {
    e8 f~ f4 r2 | r2 r4 r8 c |
  } {
    e8 f~ f4 r4 r8 g16 a | \acciaccatura g16 a8 g~ g4 r2 |
  }
  }
  r1 | r2 r4. f16 e~ | e8 f~ f4 r4. f16 e~ | e8 f~ f4 r4. c'16 e,~ | e8 f~ f4 r2 | r1 |
  
}

sax_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  R1*8 | R1*8 | R1*8 | r1\fermata 
}

sax = \relative c'' {
  \global
  % Intro 
  \sax_intro 
  % Verse 1 et 2  
  \sax_theme \bar"||"
  % Outro
  \sax_outro \bar"|."
  
}

\book{
  \bookOutputSuffix "Sax-Eb"
  \header {
      title = \markup { \fontsize #3 \bold "Fior Di Latte"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Music by"} }
          \line{\center-align \fontsize #0 "Alpagone"}
        }
      }
      subtitle = ""
      instrument = "Saxophone Eb"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2024" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      \chords {
        \transposition ees
        \transpose ees c' { \chrd }
      }
      \new StaffGroup <<
        \new Staff \relative c' {
          \set Staff.instrument="alto sax"
          \transposition ees
          \transpose ees c' { \sax }
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 70  } 
    \layout {} 
  }
}