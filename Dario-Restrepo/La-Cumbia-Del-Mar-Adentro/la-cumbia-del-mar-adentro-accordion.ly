\version "2.20.0"
% ***** Accordion *****

accordion_intro = \relative c' {
  \partial 8 r8 | R1*3
}

accordion_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  % accordeon
  \time 2/4
  r8. e16 a8. e16 
  \time 4/4
  \repeat "percent" 3 { gis8. gis16 b gis b gis a8. e16 a8. e16 }
  gis8. gis16 b gis b gis
  a8. e16 a8 c16 e~ e e8 e16 d8 c | a4 r4 r2 |
  r8. e16 a8 c16 e~ e e8 e16 d8 c | a4 r4 r2 |
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

accordion_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  
}

accordion = \relative c'' {
  \global
  % Intro 
  \accordion_intro 
  % Verse 1 et 2  
  \accordion_theme \bar"||"
  % Outro
  \accordion_outro \bar"|."
  
}

\book{
  \bookOutputSuffix "Accordion"
  \header {
      title = \markup { \fontsize #3 \bold "La Cumbia Del Mar Adentro"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words & Music by"} }
          \line{\center-align \fontsize #0 "Darío Restrepo"}
        }
      }
      subtitle = ""
      instrument = "Accordion"
      % opus = "Op. 9"
      copyright= \markup { "Catalina Restrepo - Copyright 2024" \char ##x00A9 }
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
          \set Staff.instrument="accordion"
          \accordion
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 70  } 
    \layout {} 
  }
}