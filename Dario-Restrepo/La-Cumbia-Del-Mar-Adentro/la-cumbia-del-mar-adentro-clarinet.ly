\version "2.23.6"
% ***** Clarinet *****

clarinet_intro = \relative c' {
  \partial 8 e'8 | a4~ \tuplet 3/2 {a8 c8 a} \tuplet 3/2 {g8 a g} \tuplet 3/2 {e g e} \tuplet 3/2 {d e d} c8 d c a~ a4~| a2\fermata r2
}

clarinet_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  \repeat "segno" 2 {
  \repeat "volta" 2 {
  % accordeon
  R1*8
  % chant
  R1*3
  }
  \alternative{
    {
    R1 |
  } {
    R1 |
  }
  }
  % clarinet
  e'16 e e e d8 f e8. a,16 c8 e | g4 e8 c16 a~ a4 r4 |
  e'16 e e e d8 f e8. a,16 c8 e | g4 e8 c16 a~ a8. a'16 g a g e |
  % clarinet motif 2
  a8.-- a16 g a g e a8 r16 a16 g a g e | a8.-- a16 g a g e a8 r16 e16 d e d c
  e8.-- e16 d e d c e8 r16 e16 d e d c | e8.-- g16 e g e d c2 |
  
  %percussions
  R1*9 | \time 2/4 r2 \time 4/4
  }
  
  
}

% clarinet_outro = \relative c'' {
%   \mark \markup \center-column { \box "Outro" }
%   
% }

clarinet = \relative c'' {
  \global
  % Intro 
  \clarinet_intro 
  % Verse 1 et 2  
  \clarinet_theme \bar"|."
  % Outro
  %\clarinet_outro \bar"|."
  
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
        \transposition bes
        \transpose bes c' { \chrd }
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