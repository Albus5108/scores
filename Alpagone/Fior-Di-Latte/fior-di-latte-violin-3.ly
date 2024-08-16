\version "2.20.0"

% ***** Violons ***** 
dashPlus = "trill"

vln_iii_intro = \relative c' {  
  R1*1 |  <e f>1~ | <e f>1~ | <e f>1~ | <e f>1~ | <e f>1~ | <e f>1~ | <e f>1 |
}

vln_iii_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }  
  \repeat "volta" 2 {
    \time 4/4 
    
   % <<
  % 1ere tourne 
  %\context Voice = voiceA {\tiny a1_"1st"~\( | a1~ | a1~ | a1~ | a1~ | a1 \) }
  % 2nd tourne
  %\context Voice = voiceB {c1~^"2nd"\( | c2. g'4~ | g4 f2.~ | f1 | d'1 | c\) |}
  c'1~^"2nd"\mf\( | c2. r4 | d1\) | r1 | d'\( | c\) | 
   % >>
  }
  \alternative{
    {
    f,,1 | g\< |
  } {
      d''1~\! |  d  |
  }
  }
  f,,1~\( | f | g1 | f |
  g\) |  r1 |  
}
  
vln_iii_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  g1\( |  f |
  g |  a |  g |  f |
  g |  a |  g |  f |
  g |  a |  g |  f |
  g |  a\<\) \bar"||"
  g1\f\( |  c,1\) |
  g'1\( |  c |  g\) |  f\>\( |
  g | f1\mp~ <e f>1\fermata\)
}

vln_iii = \relative c'' {
  \global
  % Intro 
  \vln_iii_intro 
  % Verse 1 et 2  
  \vln_iii_theme \bar"||"
  % Outro
  \vln_iii_outro \bar"|."
  
}

\book{
  \bookOutputSuffix "Violin-3"
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
          \vln_iii
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}