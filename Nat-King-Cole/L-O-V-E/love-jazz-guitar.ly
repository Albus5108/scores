\version "2.24.1"

% ***** Jazz Guitar ***** 
dashPlus = "trill"
gtr_intro = \relative c' {
  \repeat "percent" 2 {d2 e | fis e |}
}

gtr_verse = \relative c' {
  \mark \markup \center-column { \box "Verse 1" }
  \repeat "percent" 4 {d2 e | fis e |}
  \repeat "percent" 3 {g2 a | b a |} d4 r r2 | R1 | 
}

gtr_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  \repeat "percent" 4 {d2 e | fis e |}
  g2 a | b a | g2 a | bes g | d2 e | fis e | d4 r r2 | R1 | 
}

gtr_trumpet_solo = \relative c'' {
  \mark \markup \center-column { \box "Trumpet Solo" }
  \key aes \major
  R1*16
  
}

gtr_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  \key a \major
  R1*16
}

gtr_verse_iv = \relative c'' {
  \mark \markup \center-column { \box "Verse 4" }
  \repeat "percent" 4 {e2 fis | gis fis |}
  R1*8 | 
  R1*4
  R1*4
  R1 | r2 r4 a->~ | a1\fermata |
}

gtr = \relative c'' {
  \global
  % Intro 
  \gtr_intro \bar"||"
  % Verse 1 et 2
  \gtr_verse \bar"||"
  \gtr_verse_ii \bar"||"
  % Trumpet solo
  \gtr_trumpet_solo \bar"||"
  % Verse 3
  \gtr_verse_iii \bar"||"
  % Chorus
  \gtr_verse_iv \bar"|."
}

\book{
  \bookOutputSuffix "Jazz-Guitar"
  \header {
      title = \markup { \fontsize #3 \bold "L-O-V-E"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
        }
      }
      subtitle = ""
      instrument = "Jazz Guitar"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      \chords {
        \transpose g a {\chrd}             
      }
      \new StaffGroup <<
        \new Staff \relative c' {
          \set Staff.instrument="electric guitar (jazz)"
          \transpose g a {\gtr}
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}