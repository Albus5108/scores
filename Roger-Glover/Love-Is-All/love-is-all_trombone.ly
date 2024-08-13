\version "2.20.0"

global = {
  \time 12/8
  %\key c \major
  \tempo 4. =110
  \compressFullBarRests % compress rest bars
}

% ***** Alto saxophone *****
trb_intro = \relative c {
  \key d \major
  %R1. * 4
  b'4.-^\f a-^ gis-^ fis-^ | e'-^ d-^ cis-^ b-^ |
  a-^ g-^ fis-^ e-^ | d1. |
  \key c \major
}

trb_chorus = \relative c {
  \mark \markup \center-column { \box Chorus }
  R1.*8
}

trb_interlude = \relative c {
  \mark \markup \center-column { \box "Post-Ch." }
  \key d \major
   r4 b8\mf~ b4 dis8~ dis4 fis8~ fis4 b8~ | b4 cis8~ cis4 d8~ d4 cis8 b4. |
   a2. g4 fis8 e4. | d2. r2. |
   \key c \major
}

trb_verse = \relative c {
  R1. * 6 | g'4.-^\f g4.-^ g4.-^ g4.-^ | g4.-^ g4.-^ g4.-^ g4.-^
}

trb_verse_i = \relative c {
  \mark \markup \center-column { \box "Verse 1" }
  \trb_verse
}

trb_verse_ii = \relative c {
  \mark \markup \center-column { \box "Verse 2" }
  \trb_verse
}

trb_waltz = \relative c {
  \time 3/4 
  \key a \major
  \mark \markup \center-column { \box "Waltz" }
  R2. | r4 e-.\mp fis-. | gis2 r4 |  gis,4-. a-. b-. | cis2.~ | cis2 r4 | r4 fis4-. a-. | d,2. |
  R2. | dis4-. e4-. fis-. | gis2 r4 |  gis,4-. a-. b-. | cis2.~ | cis2 r4 | r4 fis4-. a-. | d,2. |
  R2. | dis4-. e-. fis-. | gis2 r4 |  gis,4-. a-. b-. | cis2.~ | cis2 r4 | r4 fis4-. a-. | d,2. |
  R2. | dis4-. e-. fis-. | gis2 r4 |  gis,4-. a-. b-. | cis2.~ | cis2 r4 |
  \bar "||"
  \key c \major
  \time 12/8 g'2.\f~ g4. r4. \bar "||"
}

trb_verse_iii = \relative c {
  \mark \markup \center-column { \box "Verse 3" }
  | R1. * 6 | g'1.~\f  | g4. r4. g4 a8 c4-. d8-. |
  % ^\segno
}

trb_last_chorus = \relative c {
  \mark \markup \center-column { \box Chorus }
  a'4.-- r4. r4 a8 c4-. d8-. | a4.-. r4. r4 a8 c4-. d8-. |
  g,2.-- r4 g8 b4-. d8-. | g,4.-> r4. r4 a8 c4-. e8-. |
  a,4.-- r4. r4 a8 c4-. d8-. | a4.-. r4. r4 a8 c4-. d8-. |
  g,2.-- r4 g8 b4-. d8-. | g,4.-> r4. r4 a8 c4-. e8-. |
}



trb = \relative c {
  \global
  \clef bass
  \small
  % Intro
  \trb_intro \bar "||" 
  % Verse 1 et 2
  \trb_verse_i  \bar "||" 
  \trb_verse \bar "||" 
  % Chorus
  \trb_chorus \bar "||"
  % Post chorus
  \normalsize
  \trb_interlude \bar "||"
  % Verse 3
  \small
  \trb_verse_ii
  % Chorus
  \trb_chorus \bar "||"
  \normalsize
  \trb_waltz
  % Verse 4
  \trb_verse_iii
  % Chorus
  \repeat "volta" 2 {
  \trb_last_chorus
  }  
}

\book{
  \bookOutputSuffix "Trombone"
  \header {
      title = \markup { \fontsize #3 \bold "Love Is All"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Roger Glover"}
        }
      }
      subtitle = ""
      instrument = "Trombone"
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
        \new Staff \relative c {
          \set Staff.instrument="trombone"
          \transpose c aes, {\trb}
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}