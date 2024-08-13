\version "2.20.0"

intro_piano = \relative c'{
  R1 \bar "||" R1  \bar "||" \time 2/4 R2 \bar "||" \time 4/4 R1 * 4 | \bar "||"
  R1 \bar "||" \time 2/4 R2 \bar "||" \time 4/4 R1 * 3
}

global = {
  \time 12/8
  %\key c \major
  \tempo 4. =110
  \compressFullBarRests % compress rest bars
}

% ***** Alto saxophone *****
alto_sax_intro = \relative c'' {
  \key d \major
  %R1. * 4
  b'4.-^\f a-^ gis-^ fis-^ | e-^ d-^ cis-^ b-^ |
  a'-^ g-^ fis-^ e-^ | d1. |
  \key c \major
}

alto_sax_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  R1.*8
}

alto_sax_interlude = \relative c'' {
  \mark \markup \center-column { \box "Post-Ch." }
  \key d \major
   r4 b8\mf~ b4 dis8~ dis4 fis8~ fis4 b8~ | b4 cis8~ cis4 d8~ d4 cis8 b4. |
   a2. g4 fis8 e4. | d2. r2. |
   \key c \major
}

alto_sax_verse = \relative c'' {
  R1. * 6 | d'4.-^\f d4.-^ d4.-^ d4.-^ | d4.-^ d4.-^ d4.-^ d4.-^
}

alto_sax_verse_i = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  \alto_sax_verse
}

alto_sax_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  \alto_sax_verse
}

alto_sax_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  | R1. * 7 | r2. r4 c'8\f e4 d8 |
  % ^\segno
}

alto_sax_waltz = \relative c'' {
  \time 3/4 
  \key a \major
  \mark \markup \center-column { \box "Waltz" }
  R2. | r4 e'-.\mp fis-. | gis2 r4 |  gis,4-. a-. b-. | cis2.~ | cis2 r4 | r4 fis4-. a-. | d,2. |
  R2. | dis4-. e4-. fis-. | gis2 r4 |  gis,4-. a-. b-. | cis2.~ | cis2 r4 | r4 fis4-. a-. | d,2. |
  R2. | dis4-. e-. fis-. | gis2 r4 |  gis,4-. a-. b-. | cis2.~ | cis2 r4 | r4 fis4-. a-. | d,2. |
  R2. | dis4-. e-. fis-. | gis2 r4 |  gis,4-. a-. b-. | cis2.~ | cis2 r4 |
  \bar "||"
  \key c \major
  \time 12/8 f!8->\f d-> d-> f-> d-> f-> g4.-> r4. \bar "||"
}

alto_sax_last_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  c'4.-- r4. r4 c8 e4 d8 | c4.-. r4. r4 c8 e4 d8 |
  r2. r4. d4. | c4.-> r4. r4 c8 e4 d8 |
  c4.-- r4. r4 c8 e4 d8 | c4.-. r4. r4 c8 e4 d8 |
  b4. r4. e4.-> e4.-> | c4. r4. r4 c8 e4 d8 |
}



alto_sax = \relative c'' {
  \global
  \small
  % Intro
  \alto_sax_intro \bar "||" 
  % Verse 1 et 2
  \alto_sax_verse_i  \bar "||" 
  \alto_sax_verse \bar "||" 
  % Chorus
  \alto_sax_chorus \bar "||"
  % Post chorus
  \normalsize
  \alto_sax_interlude \bar "||"
  % Verse 3
  \small
  \alto_sax_verse_ii
  % Chorus
  \alto_sax_chorus \bar "||"
  \normalsize
  \alto_sax_waltz
  % Verse 4
  \alto_sax_verse_iii
  % Chorus
  \repeat "volta" 2 {
  \alto_sax_last_chorus
  }  
}

\book{
  \bookOutputSuffix "Sax-Eb"
  \header {
      title = \markup { \fontsize #3 \bold "Love Is All"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Roger Glover"}
        }
      }
      subtitle = ""
      instrument = "Alto Saxophone Eb"
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
          \transpose ees c {\transpose c aes, {\alto_sax}}
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}