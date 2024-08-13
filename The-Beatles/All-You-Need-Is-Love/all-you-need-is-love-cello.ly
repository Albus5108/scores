\version "2.20.0"

% ***** Trombone *****

cello_intro = \relative c {
  s1 \bar"||" R1*3 \bar"||"
}

cello_preverse = \relative c'' {
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 a2 g | fis2 e | d c \time 3/4 b8 c d4 d8 e |
}

cello_verse = \relative c'' {
  \mark \markup \center-column { \box "Verse" }
  \time 4/4 g4^"1st time only" r4 r2 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 a2 g | fis2 e | d8^"play both times" d d4 c8 c c4 \time 3/4 b8 c d4 d8 e |
}

cello_chorus_i = \relative c'' {
  \mark \markup \center-column { \box "Chorus I" }
  \time 4/4
  R1*4 |
  g2\mp fis2 | e d | c d | \time 2/4 g,4 r \bar"||"
}

cello_guitar_solo = \relative c'' {
  \mark \markup \center-column { \box "Guitar Solo" }
  \time 4/4 g2 fis \time 3/4 e2 r4 \time 4/4 g2 fis \time 3/4 e2 r4 
  \time 4/4 a2 g4. d8 | d4 d4 \tempo "Straight" d8. d16 d8 d | d16 d d d d d d d c c c c c c c c 
  \time 3/4 \tempo "Swing" b8 c d4 d8 e |
}

cello_chorus_ii = \relative c'' {
  \mark \markup \center-column { \box "Chorus II" }
  \time 4/4
  g4 r r2 | R1*3
  g2\mp fis2 | e d | c d | \time 2/4 r2 
}

cello_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse" }
  \time 4/4 b,2\( d2 \time 3/4 e8 d e2~ \time 4/4 e1 \time 3/4 e8 b e2\) \time 4/4 a,1\p\( e'1\) | R1 | \time 3/4 R2.
}

cello_chorus_iii = \relative c'' {
  \mark \markup \center-column { \box "Chorus III" }
  \repeat "volta" 2 {
  \time 4/4
  g2\mp a | d, r | 
  g2 a | d, r |
  g2 fis2 | e d | c d |
  } 
  \alternative {{ \time 2/4 g4 d8 e | } { \time 2/4 g4 r4 }}
}

cello_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  r8 b, c cis d8 e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis 
  \tempo "Straight" d e fis g 
  b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d 
  e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, 
  c cis d d e fis g4 r4^\markup \italic "Yesterday" e4\( | \tempo "Swing" g4. a8~  a4 b4~ | b8 cis8 b4 a4. fis8~ | fis4 d4. e8 fis4 |
  g4. e8~ e4 e4~ | e8^\markup \italic "She Loves You" d8 e4 fis4. d8~ | d4 b2. \)
  r8 b c cis d8 e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g
  b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g
}

cello = \relative c {
  \global
  \clef tenor
  % Intro 
  \cello_intro 
  % Verse 1 et 2
  \cello_preverse
  \repeat "volta" 2 {
  \cello_verse
  }
  % Chorus
  \cello_chorus_i
  % Guitar solo
  \cello_guitar_solo \bar"||"
  % Chorus
  \cello_chorus_ii \bar"||"
  % Verse 3
  \cello_verse_ii
  % Chorus
  \cello_chorus_iii \bar"||"
  % Outro
  \cello_outro 
  
}


\book{
  \bookOutputSuffix "Cello"
  \header {
      title = \markup { \fontsize #3 \bold "All You Need Is Love"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Lennon/McCartney"}
        }
      }
      subtitle = ""
      instrument = "Cello"
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
          \set Staff.instrument="cello"
          \cello
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}