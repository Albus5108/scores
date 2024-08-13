\version "2.20.0"

global = {
  \time 12/8
  %\key c \major
  \tempo 4. =110
  \compressFullBarRests % compress rest bars
}

% ***** Alto saxophone *****
clarnt_intro = \relative c'' {
  \key d \major
  %R1. * 4
  b4.-^\f a-^ gis-^ fis-^ | e-^ d-^ cis-^ b-^ |
  a'-^ g-^ fis-^ e-^ | d1. |
  \key c \major
}

clarnt_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  R1.*8
}

clarnt_interlude = \relative c'' {
  \mark \markup \center-column { \box "Post-Ch." }
  \key d \major
  b,2. b4 cis8 dis4. | e2. e4 fis8 gis4. |
  a2. a4 b8 cis4. | d2. r2.
  \key c \major
}

clarnt_verse = \relative c'' {
  R1. * 6 | g'4.-^\f g4.-^ g4.-^ g4.-^ | g4.-^ g4.-^ g4.-^ g4.-^
}

clarnt_verse_i = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  \clarnt_verse
}

clarnt_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  \clarnt_verse
}

clarnt_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  | R1. * 7 | r2. r4 c8\f e4 d8 |
  % ^\segno
}

clarnt_waltz = \relative c'' {
  \time 3/4 
  \key a \major
  \mark \markup \center-column { \box "Waltz" }
  \repeat "percent" 2 { r4 dis,-. dis-. | }
  \repeat "percent" 2 { r4 d-. d-. | }
  \repeat "percent" 2 { r4 cis-. cis-. | }
  \repeat "percent" 2 { r4 d-. d-. | }
  
  \repeat "percent" 2 { r4 dis-. dis-. | }
  \repeat "percent" 2 { r4 d-. d-. | }
  \repeat "percent" 2 { r4 cis-. cis-. | }
  \repeat "percent" 2 { r4 d-. d-. | }
  
  \repeat "percent" 2 { r4 dis-. dis-. | }
  \repeat "percent" 2 { r4 d-. d-. | }
  \repeat "percent" 2 { r4 cis-. cis-. | }
  \repeat "percent" 2 { r4 d-. d-. | }

  \repeat "percent" 2 { r4 dis-. dis-. | }
  \repeat "percent" 2 { r4 d-. d-. | }
  \repeat "percent" 2 { r4 cis-. cis-. | }
  \bar "||"
  \key c \major
  \time 12/8 d8->\f d-> d-> g-> g-> g-> g4.-> r4. \bar "||"
}

clarnt_last_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  c4.-- r4. r4 c8 e4 d8 | c4.-. r4. r4 c8 e4 d8 |
  r2. r4. d4. | c4.->^\markup \bold "Solo" r4. r4 c8 e4 d8 |
  c4.-- r4. r4 c8 e4 d8 | c4.-. r4. r4 c8 e4 d8 |
  b4. r4. e4.-> e4.-> | c4. r4. r4 c8 e4 d8 |

}

clarnt = \relative c'' {
  \global
  \small
  % Intro
  \clarnt_intro \bar "||" 
  % Verse 1 et 2
  \clarnt_verse_i  \bar "||" 
  \clarnt_verse \bar "||" 
  % Chorus
  \clarnt_chorus \bar "||"
  % Post chorus
  \normalsize
  \clarnt_interlude \bar "||"
  % Verse 3
  \small
  \clarnt_verse_ii
  % Chorus
  \clarnt_chorus \bar "||"
  \normalsize
  \clarnt_waltz
  % Verse 4
  \clarnt_verse_iii
  % Chorus
  \repeat "volta" 2 {
  \clarnt_last_chorus
  }  
}

\book{
  \bookOutputSuffix "Clarinet-Bb"
  \header {
      title = \markup { \fontsize #3 \bold "Love Is All"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Roger Glover"}
        }
      }
      subtitle = ""
      instrument = "Clarinet Bb"
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
          \set Staff.instrument="clarinet"
          \transpose bes c' {\transpose c aes, {\clarnt}}
        }
      >>
    >> 
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}