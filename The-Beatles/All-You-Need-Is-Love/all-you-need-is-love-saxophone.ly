\version "2.20.0"
% ***** Saxophone *****

sax_intro = \relative c' {
  s2. d8 e \bar"||" d4 d fis fis | b4. g8 d8 d g d | c4 fis2 a8 a \bar"||"
}

sax_preverse = \relative c' {
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*3 \time 3/4 R2.
}

sax_verse = \relative c' {
  \mark \markup \center-column { \box "Verse" }
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*3 \time 3/4 R2.
}

sax_chorus_i = \relative c'' {
  \mark \markup \center-column { \box "Chorus I" }
  \time 4/4
  r1 | r2 fis8 f \tuplet 3/2 { e8 ees d~ } | d8 r r4 r2 | r2 fis8 f \tuplet 3/2 { e8 ees d~ } |
  d8 r r4 r2 | R1*2 \time 2/4 r2 \bar"||"
}

sax_guitar_solo = \relative c'' {
  \mark \markup \center-column { \box "Guitar Solo" }
  \time 4/4 g2 fis \time 3/4 e2 d8( e) \time 4/4 g2 fis \time 3/4 e2 d8( e) \time 4/4 a2 g | fis4 r r2 | R1 \time 3/4 b,8 c d4 d8 e |
}

sax_chorus_ii = \relative c'' {
  \mark \markup \center-column { \box "Chorus II" }
  \time 4/4
  g4 r r2 | r2 d'8\f des \tuplet 3/2 { cis8 c b~ } | b8 r r4 r2 | r2 d8 des \tuplet 3/2 { cis8 c b~ } |
  b8 r r4 r2 | R1*2 \time 2/4 r2 
}

sax_chorus_iii = \relative c'' {
  \mark \markup \center-column { \box "Chorus III" }
  \repeat "volta" 2 {
  \time 4/4
  R1 | r2 d8 des \tuplet 3/2 { cis8 c b~ } | b8 r r4 r2 | r2 d8 des \tuplet 3/2 { cis8 c b~ } |
  b8 r b4-^\mf a-^ a-^ | g-^ g-^ g-^ g-^ | g-^ g-^ a-^ a-^ |
  } 
  \alternative {{ \time 2/4 g4 r | } { \time 2/4 b4 r4 | }}
}

sax_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  R1*8 | 
  g,16^\markup \italic "In The Mood - Glenn Miller" b d g~ g g8 g g8 g16 fis g d b  |
  d des c b d( des) c b g'( f) e d r4
  R1 
  g,16 b d g~ g g8 g g8 g16 fis g d b |
  d des c b d( des) c b g'( f) e d r4 r2 
  r4^\markup \italic "Yesterday" e4\( | g2  a2 b4. cis8 b4 a4~ a8 fis8~ fis4 d4. e8 |
  fis4 g4. e8~ e4~ e8^\markup \italic "She Loves You" d8 e4 fis2 d4. b8~ b2  \) 
  R1*3
  g16 b d g~ g g8 g g8 g16 fis g d b 
  d des c b d( des) c b g'( f) e d r4
  R1 
  g,16 b d g~ g g8 g g8 g16 fis g d b |
  d des c b d( des) c b g'( f) e d r4
}

sax = \relative c'' {
  \global
  % Intro 
  \sax_intro 
  % Verse 1 et 2
  \sax_preverse
  \repeat "volta" 2 {
  \sax_verse
  }
  % Chorus
  \sax_chorus_i
  % Guitar solo
  \sax_guitar_solo \bar"||"
  % Chorus
  \sax_chorus_ii \bar"||"
  % Verse 3
  \sax_verse
  % Chorus
  \sax_chorus_iii \bar"||"
  % Outro
  \sax_outro 
  
}

\book{
  \bookOutputSuffix "Sax-Eb"
  \header {
      title = \markup { \fontsize #3 \bold "All You Need Is Love"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Lennon/McCartney"}
        }
      }
      subtitle = ""
      instrument = "Saxophone Eb"
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
          \set Staff.instrument="alto sax"
          \transposition ees
          \transpose ees c' { \sax }
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}