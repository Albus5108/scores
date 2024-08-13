\version "2.20.0"

global = {
  \time 12/8
  %\key c \major
  \tempo 4. =110
  \compressFullBarRests % compress rest bars
}

% ***** Alto saxophone *****
trp_intro = \relative c'' {
  \key d \major
  %R1. * 4
  b'4.-^\f a-^ gis-^ fis-^ | e-^ d-^ cis-^ b-^ |
  a'-^ g-^ fis-^ e-^ | d1. |
  \key c \major
}

trp_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  R1.*8
}

trp_interlude = \relative c'' {
  \mark \markup \center-column { \box "Post-Ch." }
  \key d \major
  b,2. b4 cis8 dis4. | e2. e4 fis8 gis4. |
  a2. a4 b8 cis4. | d2. r2.
  \key c \major
}

trp_verse = \relative c'' {
  R1. * 6 | g'4.-^\f g4.-^ g4.-^ g4.-^ | g4.-^ g4.-^ g4.-^ g4.-^
}

trp_verse_i = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  \trp_verse
}

trp_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  \trp_verse
}

trp_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  | R1. * 7 | r2. r4 c8\f e4 d8 |
  % ^\segno
}

trp_waltz = \relative c'' {
  \time 3/4 
  \key a \major
  \mark \markup \center-column { \box "Waltz" }
  \repeat "percent" 2 { r4 fis,-. fis-. | }
  \repeat "percent" 2 { r4 gis-. gis-. | }
  \repeat "percent" 2 { r4 g-. g-. | }
  \repeat "percent" 2 { r4 fis-. fis-. | }
  
  \repeat "percent" 2 { r4 fis-. fis-. | }
  \repeat "percent" 2 { r4 gis-. gis-. | }
  \repeat "percent" 2 { r4 g-. g-. | }
  \repeat "percent" 2 { r4 fis-. fis-. | }
  
  \repeat "percent" 2 { r4 fis-. fis-. | }
  \repeat "percent" 2 { r4 gis-. gis-. | }
  \repeat "percent" 2 { r4 g-. g-. | }
  \repeat "percent" 2 { r4 fis-. fis-. | }

  \repeat "percent" 2 { r4 fis-. fis-. | }
  \repeat "percent" 2 { r4 gis-. gis-. | }
  \repeat "percent" 2 { r4 g-. g-. | }
  \bar "||"
  \key c \major
  \time 12/8 b8->\f g-> b-> d-> b-> d-> g4.-> r4. \bar "||"
}

trp_last_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  c4.-- r4. r4 c8 e4 d8 | c4.-. r4. r4 c8 e4 d8 |
  r2. r4. d4. | c4.->^\markup \bold "Solo" r4. r4 c8 e4 d8 |
  c4.-- r4. r4 c8 e4 d8 | c4.-. r4. r4 c8 e4 d8 |
  b4. r4. e4.-> e4.-> | c4. r4. r4 c8 e4 d8 |

}

trp_solo = \relative c'' {
  \global
  r4.^\markup \bold "Solo" r8 c e g e g c g c 
  \repeat "volta" 2 {
    e2. r2. | r4 e16 e \tuplet 2/3 { e8 c } \tuplet 2/3 { e8 a, } \tuplet 2/3 { a8. e16 } |
    e2. r2. | r4. r8 c e g e g c g c | e2. r2. | r4 e16 e  e8 c e e8 c e e8 c c | c4 a16 a a4. g4 e8 d4. |
    r4. r8 c e g e g c g c |
  }
  
}

chrd_trp_solo = \chordmode {
  s1. |
  a1.:m | d: | g:7 | c: |
  a1.:m | d: | g:7 | c: |
}


trp = \relative c'' {
  \global
  \small
  % Intro
  \trp_intro \bar "||" 
  % Verse 1 et 2
  \trp_verse_i  \bar "||" 
  \trp_verse \bar "||" 
  % Chorus
  \trp_chorus \bar "||"
  % Post chorus
  \normalsize
  \trp_interlude \bar "||"
  % Verse 3
  \small
  \trp_verse_ii
  % Chorus
  \trp_chorus \bar "||"
  \normalsize
  \trp_waltz
  % Verse 4
  \trp_verse_iii
  % Chorus
  \repeat "volta" 2 {
  \trp_last_chorus
  }  
}

\book{
  \bookOutputSuffix "Trumpet-Bb"
  \header {
      title = \markup { \fontsize #3 \bold "Love Is All"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Roger Glover"}
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
          \transpose bes c' {\transpose c aes, {\trp}}
        }
      >>
    >> 
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
  \score {
    <<
      \chords {
        \transpose bes c' {\transpose c aes, {\chrd_trp_solo }}           
      }
      \new StaffGroup <<
        \new Staff \relative c' {
          \set Staff.instrument="trumpet"
          \transpose bes c' {\transpose c aes, {\trp_solo}}
        }
      >>
    >> 
  }
}