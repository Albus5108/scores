\version "2.24.1"

% ***** Trompette ***** 

trp_intro = \relative c'' {
  R1*4 
}

trp_verse = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  R1*16
}

trp_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  R1*14 | r4 d,8^\markup \bold "Solo" dis e g e g | aes4 g8 g f f ees4 |
}

trp_trumpet_solo = \relative c'' {
  \mark \markup \center-column { \box "Trumpet Solo" }
  \key aes \major
  aes2 r4 r8 g | g4 f e f | aes2~ aes8 f aes16 bes8. | g2 r4 r8 ees |
  g4-- r2 r8 f | f4 ees d8 ees f ges | g2 r8 bes \tuplet 3/2 { ges8 bes f~ } | f2 r8 \grace ees'16 f8 ees8 \grace b16 c8 |
  bes8 c \tuplet 3/2 { aes8 bes aes~ } aes4 r8 \grace a16 bes8 | \grace a16 bes4 r8 aes g aes bes b | \grace b16 c4. bes8 bes4. aes8 | aes4 g f g |
  aes4-- r2 g4 | g4. f8 g8 \grace a16 bes4. | aes4 ees8 e f aes f aes | beses4 fes8 ees eeses fes eeses fes |
}

trp_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  \key a \major
  \grace c,16 cis2 r2 | R1 |
  r4 r8 cis d4 e8 d | e4 d8 e \parenthesize bis8 cis e4 | d4 r r2 | R1 |
  r4 \grace d16 ees8 d~ d4 \grace d16 ees8 d~ | d4 \grace d16 ees8 d~ d4 bis8 cis~ cis4 r4 r r8 a'8 |
  r4 r8 fis a4 a | a8 fis4. r2 | r4 r8 a r8 fis a8 a | a8 eis4. r4 r8 a | 
  r4 a8 a a4-. a8 ais | b4-> r4 r2 | R1 | 
}

trp_verse_iv = \relative c'' {
  \mark \markup \center-column { \box "Verse 4" }
  R1 | r4 r8 a8 bis cis bis cis | a fis~ fis4 r2 | r4 r8 cis'8 d \parenthesize cis d cis | d8 e-> r4 r2 | 
  \grace bis16 cis8 a e bis cis e bis cis | a4 a'4 r2 | r4 \grace gis16 a8 a \grace bis16 cis8 e fis a | a a r4 r2 |
  a2. gis,4 | a4 r a8 a4 a8 | r2 r8 \grace gis a4 a8~ | a4 r r r8 \grace gis a8~ | a4 r4 r2 |
  r2 e4 fis | a8 fis4 fis8 r8 a a a | \grace bis16 cis8 a4. fis4 r4 |
  r8 cis'4 cis8~ cis4 d8 dis | e4. fis8 r2 | r8 \grace gis8 a4 \grace gis8 a4 \grace gis8 a4 a8 | a4 bis, a r |
  a'4 bis, a a'~ | a4. a8 g4 r | a4 a8 fis r a r a~ | a g4 e8 bis cis r b | bis4-. b8 a r4 e'->~ | e1\fermata |
}

trp = \relative c'' {
  \global
  % Intro 
  \trp_intro \bar"||"
  % Verse 1 et 2
  \trp_verse \bar"||"
  \trp_verse_ii \bar"||"
  % Trumpet solo
  \trp_trumpet_solo \bar"||"
  
  \transpose gis aes {
    % Verse 3
    \trp_verse_iii \bar"||"
    % Verse 4
    \trp_verse_iv \bar"|."
  }
  
}

\book{
  \bookOutputSuffix "Trp-1-Bb"
  \header {
      title = \markup { \fontsize #3 \bold "L-O-V-E"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
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
          \transpose bes c' {\transpose g a { \trp }}
          %\trp 
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}

