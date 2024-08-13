\version "2.24.1"

global = {
  \time 4/4
  \key g \major
  \tempo "Swing" 4=130
  \compressEmptyMeasures %\compressFullBarRests % compress rest bars
}

chrds_verse_a = \chordmode {
  \repeat "percent" 2 {g1: } | a:m7 | d:7 | 
  \repeat "percent" 2 {d1:7} | \repeat "percent" 2 {g1: }
  \repeat "percent" 2 {g1:7 } | \repeat "percent" 2 {c1: } 
  \repeat "percent" 2 {a1:7 } | \repeat "percent" 2 {d1:7}
}

chrds_verse_b = \chordmode {
  \repeat "percent" 2 {g1: } | a:m7 | d:7 | 
  \repeat "percent" 2 {d1:7} | \repeat "percent" 2 {g1: }
  \repeat "percent" 2 {g1:7 } | c: | cis:dim |
  g1: | a2:m7 d:7 | g1: |%  g1: | // bes2:m7 ees:7 |
}

chrd = \chordmode {
  % Intro 
  \repeat "percent" 2 {g1: } \repeat "percent" 2 {g1: }  \bar"||"
  % Verse 1 et 2
  \mark \markup \center-column { \box "Verse 1" }
  \chrds_verse_a \bar"||"
  \mark \markup \center-column { \box "Verse 2" }
  \chrds_verse_b | bes2:m7 ees:7 | \bar"||"
  % Trumpet solo
  \mark \markup \center-column { \box "Trumpet Solo" }
  \transpose g aes {
    \chrds_verse_b  | ais2:m7 dis:7 | \bar"||"
  }  
  \transpose g a {
    % Verse 3
    \mark \markup \center-column { \box "Verse 3" }
    \chrds_verse_a \bar"||"
    \mark \markup \center-column { \box "Verse 4" }
    \chrds_verse_b | e1:5+.9+.7 | \bar"||"
     %g1: | a2:m7 d:7 | g1: | e1:5+.9+.7 |
     a1:m7 | d:7 | g1: | e1:5+.9+.7 |
     a1:m7 | d:7 | g2: d2:m/f | c2:/e c2:m/ees | g:/d d2:7/fis | g2: r4 g4:6.9~ | g1:6.9\fermata \bar"|."
  }
}

% ***** Trombone *****

trb_intro = \relative c' {
  R1*4 
}

trb_verse = \relative c' {
  \mark \markup \center-column { \box "Verse 1" }
  R1*16
}

trb_verse_ii = \relative c' {
  \mark \markup \center-column { \box "Verse 2" }
  R1*16
}

trb_trumpet_solo = \relative c' {
  \mark \markup \center-column { \box "Trumpet Solo" }
  \key aes \major
  r4 aes,-^\mf aes-^ r4 | aes4-^ r8 aes8 r8 aes8 aes4-^ |
  r4 bes-^ bes-^ r4 | ees,4-^ r8 ees8 r8 ees8 ees4-^ |
  r4 bes'-^ bes-^ r4 | ees,4-^ r8 ees8 r8 ees8 ees4-^ |
  r4 aes-^ aes-^ r4 | aes4-^ r8 aes8 r8 aes8 aes4-^ |
  
  r4 aes-^ aes-^ r4 | aes4-^ r8 aes8 r8 bes8 c4-^ |
  r4 des-^ des-^ r4 | d4-^ r8 d8 r8 d8 d4-^ |
  r4 ees2.-- | r4 ees4.-- ees,8 ees4-> |
  aes4-> r4 r4 aes | a4 r4 r2 |
}

trb_verse_iii = \relative c' {
  \mark \markup \center-column { \box "Verse 3" }
  \key a \major
  r4. a,8 ->\f r2 | R1*3 |
  r4. e'8 -> r2 | R1*3 |
  
  r4. e8 -> r2 | R1 | r2 d4-> r4 | R1 |
  r4. b8 -> r2 | R1 | gis'4->\sff r4 r2 | R1 |
}

trb_verse_iv = \relative c' {
  \mark \markup \center-column { \box "Verse 4" }
  r4 cis\ff cis r4 | cis4 r8 cis8 r2 |
  r4 d d r4 | d4 r8 d8 r8 d8 d4 |
  r4 d d r4 | d4 r8 d8 r2 |
  r4 cis cis r4 | cis4 r8 cis8 r8 cis8 cis4 |
  
  r4 g'-> e-> cis4 | cis4-> cis8 cis4-> cis8 cis4-> | % r4 a-> a-> a4 | a4-> a8 a4-> a8 a4-> |
  r4 d,2.->\fp | c'4->\ff c8 c4-> c8 c4-> |
  r4. cis8->\sff~ cis4 r4 | R1 |
  r2 cis4 r4 | cisis4-> cisis8 cisis4-> cisis8 cisis4-> |
  r4. fis8->~ fis8 d8( \parenthesize cis4) | R1 |
  r4  a,4-> a4-> r8 a8 | a4-> r4 r2 |
  b4 b8 b cis cis d8 e-> | R1 |
  a,4 r4 g'4 r| a4 a8 fis r a r a~ | a g4 e8 gis8 gis4 gis8 |
  a4 r4 r4 cis->~ | cis1\fermata |
}

trb = \relative c'' {
  \clef bass
  \global
  % Intro 
  \trb_intro \bar"||"
  % Verse 1 et 2
  \trb_verse \bar"||"
  \trb_verse_ii \bar"||"
  % Trumpet solo
  \trb_trumpet_solo \bar"||"
  %\transpose cis des {
    % Verse 3
    \trb_verse_iii \bar"||"
    % Chorus
    \trb_verse_iv \bar"|."
  %}
  
}

\book{
  \bookOutputSuffix "Trb-Ut"
  \header {
      title = \markup { \fontsize #3 \bold "L-O-V-E"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
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
        \transpose g a {\chrd}              
      }
      \new StaffGroup <<
        \new Staff \relative c' {
          \set Staff.instrument="trombone"
          \transpose g a {\trb}
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}