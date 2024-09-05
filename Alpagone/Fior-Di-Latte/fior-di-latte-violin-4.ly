\version "2.20.0"

% ***** Violons ***** 
dashPlus = "trill"

vln_iv_intro = \relative c' {  
  R1*1 |  c1~ | c1~ | c1~ | c1~ | c1~ | c1~ | c1 |
}

vln_iv_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }  
  \repeat "volta" 2 {
    \time 4/4 
    
    <<
  % 1ere tourne 
  \context Voice = voiceA {\tiny f1_"1st"\( |  e |  g1~ | g2 r2 | f1 | e | \) }
  % 2nd tourne
  \context Voice = voiceB {f1~^"2nd"\( | f1~ | f4 f'2.~ | f1 | bes1 |  a\) |}
    >>
  }
  \alternative{
    {
    \tiny d,,1~ | \normalsize d2\< e2\mf |
  } {
     g'8 a8~ a2. |  b1 |
  }
  }
  bes,,1\( |  c |  d |  c |
  d\) |  c1^"Solo" |  
  
}
  
vln_iv_outro = \relative c' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  d1\( |  c |
  d1 |  f |  d |  c |
  d |  f |  d |  c |
  d |  f |  d |  c |
  d |  f\<\) \bar"||"
  d\f\( |  f\) |
  
  d\( |  a' |  d,\) |  c\>\( |
  d |  f\mp |  c\fermata\) |
}

vln_iv = \relative c'' {
  \global
  % Intro 
  \vln_iv_intro 
  % Verse 1 et 2  
  \vln_iv_theme \bar"||"
  % Outro
  \vln_iv_outro \bar"|."
  
}

\book{
  \bookOutputSuffix "Violin-4"
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
          \vln_iv
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}