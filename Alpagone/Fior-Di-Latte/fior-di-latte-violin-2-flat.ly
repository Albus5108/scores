\version "2.20.0"

% ***** Violons ***** 
dashPlus = "trill"

vln_ii_intro = \relative c'' {  
  R1*1 |  a1~ | a1~ | a1~ | a1~ | a1~ | a1~ | a1 |
}

vln_ii_theme = \relative c'' {
  \mark \markup \center-column { \box "Theme" }  
  \time 4/4 
    
   a1\p~\( | a1~ | a1~ | a1~ | a1~ | a1 | a1 | bes2.\<\) r4\mf |
   c1~\( | c2. g'4~ | g4 f2.~ | f1 | d'1 | c | d1~ |  d \) |
   
  g,,\( |  a |  bes |  a |
  bes\) |  c,1^"Solo" |  
  
}
  
vln_ii_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  bes1\mp\( |  a |
  bes | a |  bes |  a |
  bes | c |  bes |  a |
  bes | a |  bes |  a | 
  bes |  c\<\) \bar"||"
  bes2\f\( d4 c |  a1\) |
  bes2\( d | f2. e4 |  bes1\) |  a\>\( |
  bes | a1\mp~ a1\fermata\)
}

vln_ii = \relative c'' {
  \global
  % Intro 
  \vln_ii_intro 
  % Verse 1 et 2  
  \vln_ii_theme \bar"||"
  % Outro
  \vln_ii_outro \bar"|."
  
}

\book{
  \bookOutputSuffix "Violin-2"
  \header {
      title = \markup { \fontsize #3 \bold "Fior Di Latte"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Alpagone"}
        }
      }
      subtitle = ""
      instrument = "Violin"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2024" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      \chords {
        %\accords                
      }
      \new StaffGroup <<
        \new Staff \relative c' {
          \set Staff.instrument="violin"
          \vln_ii
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}