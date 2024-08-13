\version "2.20.0"
% ***** Trombone *****

trb_intro = \relative c {
  s2. d8\f c \bar"||" b4 b d d | g4. d8 b8 b d b | c8 a d2 r4 \bar"||"
}

trb_preverse = \relative c {
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*3 \time 3/4 R2.
}

trb_verse = \relative c {
  \mark \markup \center-column { \box "Verse" }
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*2 d4\f^"1x tacet" d c c  \time 3/4 b8 c d4 d8 e |
}

trb_chorus_i = \relative c {
  \mark \markup \center-column { \box "Chorus I" }
  \time 4/4
  g'4\mp r8 g a4 r8 a | d,4 r8 d   d'8\mf des \tuplet 3/2 { cis8 c b~ } | b8\mp r8 r8 g a4 r8 a | d,4 r8 d  d'8\mf des \tuplet 3/2 { cis8 c b~ } |
  <g b>8\mp~ g4. fis2 | e d | c d | \time 2/4 g4 r \bar"||"
}

trb_guitar_solo = \relative c {
  \mark \markup \center-column { \box "Guitar Solo" }
  \time 4/4 g'2 fis \time 3/4 e2 d8( e) \time 4/4 g2 fis \time 3/4 e2 d8( e) \time 4/4 a2 g | fis4 r r2 | R1 \time 3/4 b,8 c d4 d8 e |
}

trb_chorus_ii = \relative c {
  \mark \markup \center-column { \box "Chorus II" }
  \time 4/4
  g'4 r r2 | r2 fis8\f f \tuplet 3/2 { e8 ees d~ } | d8 r r4 r2 | r2 fis8 f \tuplet 3/2 { e8 ees d~ } |
  d8 r r4 r2 | R1*2 \time 2/4 r2 
}

trb_verse_ii = \relative c {
  \mark \markup \center-column { \box "Verse" }
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*3 \time 3/4 R2.
}

trb_chorus_iii = \relative c {
  \mark \markup \center-column { \box "Chorus III" }
  \repeat "volta" 2 {
  \time 4/4
  r4 d'8\f d d d4 d8~ | d8 r r4 fis8 f \tuplet 3/2 { e8 ees d~ } | d8 r d8 d d d4 d8~ | d8 r r4 fis8\ff_"2nd time" f \tuplet 3/2 { e8 ees d~ } |
  d8 r b4-^\mf a-^ a-^ | g-^ g-^ g-^ g-^ g-^ g-^ a-^ a-^ 
  } 
  \alternative {{ \time 2/4 g4 r | } { \time 2/4 g4 r4 }}
}

trb_outro = \relative c {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  r8 b c cis d8 e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g 
  b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d 
  e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, 
  c cis d d e fis g4 r4^\markup \italic "Yesterday" e4\( | g4. a8~  a4 b4~ | b8 cis8 b4 a4. fis8~ | fis4 d4. e8 fis4 |
  g4. e8~ e4 e4~ | e8^\markup \italic "She Loves You" d8 e4 fis4. d8~ | d4 b2. \) 
  R1*8
  % r8 b c cis d8 e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g
  % b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g b, c cis d e fis g
}

trb = \relative c {
  \global
  \clef bass
  % Intro 
  \trb_intro 
  % Verse 1 et 2
  \trb_preverse
  \repeat "volta" 2 {
  \trb_verse
  }
  % Chorus
  \trb_chorus_i
  % Guitar solo
  \trb_guitar_solo \bar"||"
  % Chorus
  \trb_chorus_ii \bar"||"
  % Verse 3
  \trb_verse_ii
  % Chorus
  \trb_chorus_iii \bar"||"
  % Outro
  \trb_outro 
  
}


\book{
  \bookOutputSuffix "Trb-Ut"
  \header {
      title = \markup { \fontsize #3 \bold "All You Need Is Love"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Lennon/McCartney"}
        }
      }
      subtitle = ""
      instrument = "Trombone Ut"
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
          \set Staff.instrument="trombone"
          \trb
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}