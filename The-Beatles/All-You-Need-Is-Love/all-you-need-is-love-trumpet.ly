\version "2.20.0"

% ***** Trompette ***** 
dashPlus = "trill"
trp_intro = \relative c' {
  s2. d8 e \bar"||" g4 g a a | d4. b8 g8 g b g | e4 c'2 a4-+ \bar"||"
}

trp_preverse = \relative c' {
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*3 \time 3/4 R2.
}

trp_verse = \relative c' {
  \mark \markup \center-column { \box "Verse" }
  \time 4/4 R1 \time 3/4 R2. \time 4/4 R1 \time 3/4 R2. \time 4/4 R1*3 \time 3/4 R2.
}

trp_chorus_i = \relative c'' {
  \mark \markup \center-column { \box "Chorus I" }
  \time 4/4
  \repeat "percent" 2 {b4-- \p b8-! b8 cis4-- cis8-! cis8 | d4-- d8-! d8 d2 | }
  d2\( dis e fis g fis \time 2/4 g4\) r \bar"||"
}

trp_guitar_solo = \relative c'' {
  \mark \markup \center-column { \box "Guitar Solo" }
  \time 4/4 b1~ \time 3/4 b2 d,8( e) \time 4/4 b'1~ \time 3/4 b2 d,8( e) \time 4/4 c'1~ | c4 r r2 | R1 \time 3/4 b,8 c d4 d8 e |
}

trp_chorus_ii = \relative c'' {
  \mark \markup \center-column { \box "Chorus II" }
  \time 4/4
  % zooooob
  g4 r r2 | r2 fis8\f f \tuplet 3/2 { e8 ees d~ } | d8 r r4 r2 | r2 fis8 f \tuplet 3/2 { e8 ees d~ } |
  d8 r r4 r2 | R1*2 \time 2/4 r2 
}

trp_chorus_iii = \relative c'' {
  \mark \markup \center-column { \box "Chorus III" }
  \repeat "volta" 2 {
  \time 4/4
  R1 | r2 fis,8 f \tuplet 3/2 { e8 ees d~ } | d8 r r4 r2 | r2 d'8^"2nd time" cis \tuplet 3/2 { c8 b g~ } |
  g8 r b4-^\mf a-^ a-^ | g-^ g-^ g-^ g-^ | g-^ g-^ a-^ a-^ |
  } 
  \alternative {{ \time 2/4 g4 r | } { \time 2/4 b4 r4 | }}
}

trp_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  R1*3 | 
  r2 r4 r8 g b g d' g, g' fis16 e d e d c b c b a g8 b d b g' d |
  b16 d c d b d c d b d c d g, b a b g b a b g b a b e, g fis g e g fis g
  b, d c b a4 r2 | r4 b'16( bes) a g b( bes) a g r4 | R1*2 | r4 b16( bes) a g b( bes) a g r4 |
  R1*5^\markup \italic "Yesterday"
  %R1*4
  r2^\markup \italic "She Loves You" r4 r8 g b g d' g, g' fis16 e d e d c b c b a g8 b d b g' d |
  b16 d c d b d c d b d c d g, b a b g b a b g b a b d, g fis g d g fis g
  b, d c b a4 r2 | r4 b'16( bes) a g b( bes) a g r4 | R1*2 | r4 b16( bes) a g b( bes) a g r4 |
  
}

trp = \relative c'' {
  \global
  % Intro 
  \trp_intro 
  % Verse 1 et 2
  \trp_preverse
  \repeat "volta" 2 {
  \trp_verse
  }
  % Chorus
  \trp_chorus_i
  % Guitar solo
  \trp_guitar_solo \bar"||"
  % Chorus
  \trp_chorus_ii \bar"||"
  % Verse 3
  \trp_verse
  % Chorus
  \trp_chorus_iii \bar"||"
  % Outro
  \trp_outro 
}

\book{
  \bookOutputSuffix "Trp-1-Bb"
  \header {
      title = \markup { \fontsize #3 \bold "All You Need Is Love"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Lennon/McCartney"}
        }
      }
      subtitle = ""
      instrument = "Trumpet Bb"
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
          \transpose bes c' { \trp }
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}

