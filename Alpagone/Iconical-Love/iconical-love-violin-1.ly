\version "2.20.0"

% ***** Violons ***** 
dashPlus = "trill"

vln_intro = \relative c'' {  
  R1*1 |  a1~ | a1~ | a1~ | a1~ | a1~ | a1~ | a1 |
}

vln_theme = \relative c'' {
  \mark \markup \center-column { \box "Theme" }  
  \repeat "volta" 2 {
    \time 4/4 
    
    <<
  % 1ere tourne 
  \context Voice = voiceA {\tiny c1_"1st"~\( | c1~ | c1 | d1~ | d\) |  c1~ | }
  % 2nd tourne
  \context Voice = voiceB {c2^"2nd"\( e4 f |  e2. g4 | a1\) | d2.\( e4 | f1 | e\) |}
    >>
    
    
    % 1ere tourne 
    %c1~ | c1~ | c1 | d1 |  d |  c1~ | 
    % 2nd tourne
    % c2\(^"1x Tacet" e4 f |  e2. g4 | a1\) | d2.\( e4 | f1 | e\) |
  }
  \alternative{
    {
    \tiny c,1 | \normalsize bes2.\< r4\mf |
  } {
     f''1~ |  f |
  }
  }
  g,,\( |  a |  bes |  a |
  bes\) |  r1 |  
  
}

vln_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  bes1\( |  a |
  bes |  c |  bes |  a |
  bes |  c |  bes |  a |
  bes |  c |  bes |  a |
  bes |  c\<\) \bar"||"
  d2\(\f f4 e |  c1\) |
  d2\( f |  a2. g4 |  d1\) | a\>\( |
  bes |  c1\mp~ | c1\fermata\) 
}

vln = \relative c'' {
  \global
  % Intro 
  \vln_intro 
  % Verse 1 et 2  
  \vln_theme \bar"||"
  % Outro
  \vln_outro \bar"|."
  
}

\book{
  \bookOutputSuffix "Violin-1"
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
          \vln
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}