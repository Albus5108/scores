\version "2.20.0"

% ***** Violons ***** 
dashPlus = "trill"
vln_intro = \relative c'' {
  s1 \bar"||" R1*3 \bar"||"
}

vln_preverse = \relative c'' {
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*3 \time 3/4 R2.
}

vln_verse = \relative c'' {
  \mark \markup \center-column { \box "Verse" }
  \time 4/4 b,2\(^"1x Tacet" d2 \time 3/4 g8 a b2~ \time 4/4 b1 \time 3/4 b8 a b2\) \time 4/4 c2\( b c1\) | R1 | \time 3/4 d,2^"dirty" d8 r8
}

vln_chorus_i = \relative c'' {
  \mark \markup \center-column { \box "Chorus I" }
  \time 4/4
  R1*7 \time 2/4 R2 \bar"||"
}

vln_guitar_solo = \relative c'' {
  \mark \markup \center-column { \box "Guitar Solo" }
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. 
  \time 4/4 c16 d c a e a e a b c b g e g e g | 
  a b a d, d a' a d d a d' d a, d' d d | d,, d d d d d d d c c c c c c c c \time 3/4 b8 c d4 d8 e |
}

vln_chorus_ii = \relative c'' {
  \mark \markup \center-column { \box "Chorus II" }
  \time 4/4
  % zooooob
  g4 r r2 | r2 fis8\f f \tuplet 3/2 { e8 ees d~ } | d8 r r4 r2 | r2 fis8 f \tuplet 3/2 { e8 ees d~ } |
  d8 r r4 r2 | R1*2 \time 2/4 r2 
}

vln_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse" }
  \time 4/4 b2\( d2 \time 3/4 g8 a b2~ \time 4/4 b1 \time 3/4 b8 a b2\) \time 4/4 c2\( b a1\) | R1 | \time 3/4 R2.
}

vln_chorus_iii = \relative c'' {
  \mark \markup \center-column { \box "Chorus III" }
  \repeat "volta" 2 {
  \time 4/4
  R1 | r2 fis,8 f \tuplet 3/2 { e8 ees d~ } | d8 r r4 r2 | R1 |
  \tuplet 3/2 { g4\f^"1x Tacet" g g } \tuplet 3/2 { b4 b b } | 
  \tuplet 3/2 { e4 e e } \tuplet 3/2 { g4 g g } |
  \tuplet 3/2 { b4 b b } \tuplet 3/2 { d4 d d } | 
  } 
  \alternative {{ \time 2/4 R2 | } { \time 2/4 \ottava 1 g8 g g g | }}
}

vln_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \ottava 1 
  \time 4/4
  g''8 g g g g g g g | g8\> g g g g g g g\! | g8\p g g g g g g g | g8 g g g g g g g
  \tempo "Straight"
  \repeat "percent" 4 {g4 g g g }
  g8\pp^\markup \italic "In The Mood - Glenn Miller" g, g' g, g' g, g' g, |
  \repeat "percent" 3 {g' g, g' g, g' g, g' g, | }
  g'\< g, g' g, g' g, g' g, |
  g' g, g' g,\! g'->\ff^\markup \italic "Yesterday" g,-> \ottava 0 e,4\( | 
  \tempo "Swing"
  g2  a2 b4. cis8 b4 a4~ a8 fis8~ fis4 d4. e8 |
  fis4 g4. e8~ e4~ e8^\markup \italic "She Loves You" d8 e4 fis2 d4. b8~ b2  \)  
  \ottava 1
  \repeat "percent" 8 {g'''8 g g g g g g g |}
  
}

vln = \relative c'' {
  \global
  % Intro 
  \vln_intro 
  % Verse 1 et 2
  \vln_preverse
  \repeat "volta" 2 {
  \vln_verse
  }
  % Chorus
  \vln_chorus_i
  % Guitar solo
  \vln_guitar_solo \bar"||"
  % Chorus
  \vln_chorus_ii \bar"||"
  % Verse 3
  \vln_verse_ii
  % Chorus
  \vln_chorus_iii \bar"||"
  % Outro
  \vln_outro 
}

\book{
  \bookOutputSuffix "Violin"
  \header {
      title = \markup { \fontsize #3 \bold "All You Need Is Love"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Lennon/McCartney"}
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
          \vln
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}