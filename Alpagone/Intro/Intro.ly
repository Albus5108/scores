% Lily was here -- automatically converted by midi2ly.py from D:/02-Pr_MUSIQUE/Scores/Alpagone/Intro/Violins-export-from-Live.mid
\version "2.24.4"

global = {
  \time 4/4
  \key d \major
  \tempo 4= 122
}

vln_tutti = \relative c'' {
  \compressMMRests {
  R1*8 \bar"||" R1*24 |
  }
  \repeat "volta" 2 {
    r4^"Tutti"-\f b'8\bendAfter -4 r8 r8 fis8-. gis-- a-. | r2 b16 d e r16 r4 | r8 b8-. d16-- b8-. b16-. r4  r8 a8-. | r2  fis8-- d'-. e16-- d-. r8 |
    r4 b8\bendAfter -4 r8 r8 fis8-. gis-- a-. | r2 b16 d e r16 r4 | r4 b16 g a8 r4 r8 b8-. | r2  fis8-- d'-. e16-- d-. r8 |
  }
  
  r4 b8\bendAfter -4 r8 r4 r8 fis,8-.-\mf 
  a8 a16 b r4 r2 | r4 f'16 e d b r2 | r2 b'16-\f d e r16 r4 | r4 r8 b,16---\mf d-. r4 r8 r16 e16-> |
  r8. b16 fis'8-> f e16 d b a~ a8 fis-. |
  r4. fis'16-. a16--~ a8 fis8 r4 | r4 r8 e8-. e4 r16 e r8 | r2 r4 fis16-\f a-- a-- fis | 
  a16 b r8 r4 r2 | r4 b8\bendAfter -4 r8 r2 | r2 b16 d e r16 r4 | r1 | 
  a,,16-\mf b-- b-- a d4.->\(   b16 a fis f e d |
  b8\) r8 r4 r2 | r8 e16\( fis a4. b16 a b d-- d-- a |
  b4\) r4 r2 |
  \compressMMRests {
    R1*7  \bar"||" R1*2 |
  }
  r8 a16 b r4 r2 |
  \compressMMRests {R1*4 |} 
  r4 d8\< e4-- d4.-- 
  b4->-\f r4 r2 |
  
}

vln = \relative c'' {
  \global
  % Intro 
  %\vln_intro 
  % Verse 1 et 2  
  \vln_tutti \bar"|."
  
}


\book{
  \bookOutputSuffix "Violin"
  \header {
      title = \markup { \fontsize #3 \bold "Intro"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Music by"} }
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
    \midi{ \tempo 4 = 122 } 
    \layout {} 
  }
}