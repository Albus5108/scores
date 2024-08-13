\version "2.24.1"

% ***** Violons ***** 
dashPlus = "trill"
vln_intro = \relative c'' {
  R1*4 
}

vln_verse = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  R1*16
}

vln_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  b,1~( | b | c~ | c~ | c~ | c | b~ | b) |
  f'~( | f | e | bes | b! | c) | b2( d | cis1) |
}

vln_trumpet_solo = \relative c'' {
  \mark \markup \center-column { \box "Trumpet Solo" }
  \key aes \major
  ees1~\p( | ees~ | ees~ | ees~ | ees~ | ees~ | ees | c) |
  f1\mf( | aes2 e | f1~ | f2 g | aes1 | f2 g | aes1) | a2~ a8 r8 r4 |
  
}

vln_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  \key a \major
  fis,1( | gis2 fis | fis1~ | fis) | b1( | cis2 c | b1 | a) |
  cis1( | e2 e | e1 | a1) | fis1( | b) | e,4->\f r4 r2 | r1
}

vln_verse_iv = \relative c'' {
  \mark \markup \center-column { \box "Verse 4" }
  e1~\mf( | e~ | e~ | e~ | e~ | e~ | e | cis) |
  fis1( | a2 f | fis1~ | fis2 gis | a1 | fis2 gis | a1~ | a1 )| 
  a( | fis2 gis | a1~ | a1) |
  a( | fis2 gis | a1~ | a1) |
  r1 | r2 r4 b->~ | b1\fermata |
}

vln = \relative c'' {
  \global
  % Intro 
  \vln_intro \bar"||"
  % Verse 1 et 2
  \vln_verse \bar"||"
  \vln_verse_ii \bar"||"
  % Trumpet solo
  \vln_trumpet_solo \bar"||"
  % Verse 3
  \vln_verse_iii \bar"||"
  % Chorus
  \vln_verse_iv \bar"|."
}

\book{
  \bookOutputSuffix "Violin"
  \header {
      title = \markup { \fontsize #3 \bold "L-O-V-E"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
        }
      }
      subtitle = ""
      instrument = "Violin"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
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
          \transpose g a {\vln}
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}