\version "2.20.0"
% ***** Clarinet *****

clarinet_intro = \relative c' {
  \partial 8 e'8 | a4 c8 a g a g e | g e d e d c d c | a1\fermata
}

clarinet_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  % accordeon
  R1*8
  % chant
  R1*2
  % \repeat "volta" 2 {
%     \time 4/4 a'8 c8~ c4 r4 r8 f,16 e~ |
%   }
%   \alternative{
%     {
%     e8
%   } {
%     e8
%   }
%   }
  
}

clarinet_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  
}

clarinet = \relative c'' {
  \global
  % Intro 
  \clarinet_intro 
  % Verse 1 et 2  
  \clarinet_theme \bar"||"
  % Outro
  \clarinet_outro \bar"|."
  
}

\book{
  \bookOutputSuffix "Clarinet-Bb"
  \header {
      title = \markup { \fontsize #3 \bold "La Cumbia Del Mar Adentro"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words & Music by"} }
          \line{\center-align \fontsize #0 "Darío Restrepo"}
        }
      }
      subtitle = ""
      instrument = "Clarinet Bb"
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
          \set Staff.instrument="clarinet"
          \transposition bes
          \transpose bes c' { \clarinet }
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 70  } 
    \layout {} 
  }
}