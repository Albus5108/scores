\version "2.20.0"
%tmp
global = {
  \time 4/4
  \key g \major
  \tempo "Swing" 4=100
  \compressFullBarRests % compress rest bars
}

% ***** Trompette ***** 
dashPlus = "trill"
trp_ii_intro = \relative c' {
  s2. d8 e \bar"||" g4 g a a | d4. b8 g8 g b g | e4 a2 a4-+ \bar"||"
}

trp_ii_preverse = \relative c' {
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*3 \time 3/4 R2.
}

trp_ii_verse = \relative c' {
  \mark \markup \center-column { \box "Verse" }
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*3 \time 3/4 R2.
}

trp_ii_chorus_i = \relative c'' {
  \mark \markup \center-column { \box "Chorus I" }
  \time 4/4
  \repeat "percent" 2 {b4-- \p b8-! b8 cis4-- cis8-! cis8 | d4-- d8-! d8 d2 | }
  d2\( dis e fis g fis \time 2/4 g4\) r \bar"||"
}

trp_ii_guitar_solo = \relative c'' {
  \mark \markup \center-column { \box "Guitar Solo" }
  \time 4/4 g2 fis \time 3/4 e2 d8( e) \time 4/4 g2 fis \time 3/4 e2 d8( e) \time 4/4 a2 g2 | fis4 r r2 | R1 \time 3/4 b,8 c d4 d8 e |
}

trp_ii_chorus_ii = \relative c'' {
  \mark \markup \center-column { \box "Chorus II" }
  \time 4/4
  % zooooob
  g4 r r2 | r2 fis8\f f \tuplet 3/2 { e8 ees d~ } | d8 r r4 r2 | r2 fis8 f \tuplet 3/2 { e8 ees d~ } |
  d8 r r4 r2 | R1*2 \time 2/4 r2 
}

trp_ii_chorus_iii = \relative c'' {
  \mark \markup \center-column { \box "Chorus III" }
  \repeat "volta" 2 {
  \time 4/4
  R1 | r2 fis,8 f \tuplet 3/2 { e8 ees d~ } | d8 r r4 r2 | r2 fis8 f \tuplet 3/2 { e8 ees d~ } |
  g8 r b4-^\mf a-^ a-^ | g-^ g-^ g-^ g-^ | g-^ g-^ a-^ a-^ |
  } 
  \alternative {{ \time 2/4 g4 r | } { \time 2/4 b4 r4 | }}
}

trp_ii_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  R1*3 | 
  r2 r4 r8 \tiny g b[ g d' g, g'] \normalsize g,8 b g d' g, g' fis16 e d e d c b c b a g8 b g d g d |
  b'16 d c d b d c d b d c d g, b a b g b a b 
  R1 | r4 d,16( des) c b g'( f) e d r4 | R1*2 | r4 d16( des) c b g'( f) e d r4 |
  R1^\markup \italic "Yesterday" 
  R1*4
  r2^\markup \italic "She Loves You" r4 r8 \tiny g b[ g d' g, g'] \normalsize g,8 b g d' g, g' fis16 e d e d c b c b a g8 b g d g d |
  b'16 d c d b d c d b d c d g, b a b g b a b 
  R1 | r4 d,16( des) c b g'( f) e d r4 | R1*2 | r4 d16( des) c b g'( f) e d r4 |
  
}

trp_ii = \relative c'' {
  \global
  % Intro 
  \trp_ii_intro 
  % Verse 1 et 2
  \trp_ii_preverse
  \repeat "volta" 2 {
  \trp_ii_verse
  }
  % Chorus
  \trp_ii_chorus_i
  % Guitar solo
  \trp_ii_guitar_solo \bar"||"
  % Chorus
  \trp_ii_chorus_ii \bar"||"
  % Verse 3
  \trp_ii_verse
  % Chorus
  \trp_ii_chorus_iii \bar"||"
  % Outro
  \trp_ii_outro 
}

\book{
  \bookOutputSuffix "Trp-2-Bb"
  \header {
      title = \markup { \fontsize #3 \bold "All You Need Is Love"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Lennon/McCartney"}
        }
      }
      subtitle = ""
      instrument = "2nd Trumpet Bb"
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
          \set Staff.instrument="trumpet"
          \transpose bes c' { \trp_ii }
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}

