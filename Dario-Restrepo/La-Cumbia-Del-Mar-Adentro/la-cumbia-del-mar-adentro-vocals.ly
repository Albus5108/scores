\version "2.20.0"
% ***** Vocals *****

vocals_intro = \relative c' {
  \partial 8 r8 | R1*3
}

vocals_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  \repeat "segno" 2 {
  \repeat "volta" 2 {
  % accordeon
  R1*7
  % chant
  r2 r4 r16 e a c |  e16 e8 e16 f8 e16 d~ d d8 d16 e8 d16 c~ c c8 c16 d8 c16 b~ b4 r16 e, a c |
  e16 e8 e16 f8 e16 d~ d d8 d16 e8 d16 c~ | 
  }
  \alternative{
    {
    c16 c8 c16 d8 c16 b~ b4 r4 |
  } {
    c16 c8 c16 d8 c16 b~ b4 r4 |
  }
  }
  %clarinet
  R1*8
  \mark \markup \small "Fine" 
  \bar"||"
  % Percussions
  R1*4
  \time 3/4 r2.
  \time 4/4 
  R1*4
  \time 2/4
  r2 
  }
  
}

% vocals_outro = \relative c'' {
%   \mark \markup \center-column { \box "Outro" }
%   
% }

vocals = \relative c'' {
  \global
  % Intro 
  \vocals_intro 
  % Verse 1 et 2  
  \vocals_theme \bar"|."
  % Outro
  %\vocals_outro \bar"|."
  
}

\book{
  \bookOutputSuffix "Vocals"
  \header {
      title = \markup { \fontsize #3 \bold "La Cumbia Del Mar Adentro"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words & Music by"} }
          \line{\center-align \fontsize #0 "Darío Restrepo"}
        }
      }
      subtitle = ""
      instrument = "Vocals"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2024" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      \chords {
        \chrd
      }
      \new StaffGroup <<
        \new Staff \relative c' {
          \set Staff.instrument="Vocals"
          \vocals
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 95  } 
    \layout {} 
  }
}