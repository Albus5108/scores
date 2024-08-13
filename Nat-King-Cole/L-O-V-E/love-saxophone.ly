\version "2.24.1"

% ***** Saxophone *****

sax_intro = \relative c'' {
  R1*4 
}

sax_verse = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  R1*16
}

sax_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  R1*16
}

sax_trumpet_solo = \relative c'' {
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

sax_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  \key a \major
  r4. cis,8 ->\f r2 | R1*3 |
  r4. d8 -> r2 | R1*3 |
  
  r4. e8 -> r2 | R1 | r2 d4-> r4 | R1 |
  r4. dis8 -> r2 | R1 | e4->\sff r4 r2 | R1 |
}

sax_verse_iv = \relative c'' {
  \mark \markup \center-column { \box "Verse 4" }
  r4 a\ff a r4 | a4 r8 a8 r2 |
  r4 b b r4 | b4 r8 b8 r8 b8 b4 |
  r4 b b r4 | b4 r8 b8 r2 |
  r4 a a r4 | a4 r8 a8 r8 a8 a4 |
  
  r4 a-> a-> fis4 | eis4-> fis8 eis4-> fis8 eis4-> | % r4 a-> a-> a4 | a4-> a8 a4-> a8 a4-> |
  r4 a2.->\fp | a4->\ff a8 a4-> a8 a4-> |
  r4. a8->\sff~ a4 r4 | R1 |
  r2 a4 r4 | a4-> a8 a4-> a8 a4-> |
  r4. fis8->~ fis8 d8( \parenthesize cis4) | R1 |
  r4 a'4-> r8 a4-> r8 | a4-> r4 r2 |
  b,,4 b8 b cis cis d8 e-> | R1 |
  a'4^\markup \bold "Solo" e8 a g \parenthesize d cis g' | fis \parenthesize fis d fis f4 a8 f | e4 r4 b'8 b4 b8 |
  a4 r4 r4 cis->~ | cis1\fermata |
}

sax = \relative c'' {
  \global
  % Intro 
  \sax_intro \bar"||"
  % Verse 1 et 2
  \sax_verse \bar"||"
  \sax_verse_ii \bar"||"
  % Trumpet solo
  \sax_trumpet_solo \bar"||"
  \transpose cis des {
    % Verse 3
    \sax_verse_iii \bar"||"
    % Chorus
    \sax_verse_iv \bar"|."
  }
  
}

\book{
  \bookOutputSuffix "Sax-Eb"
  \header {
      title = \markup { \fontsize #3 \bold "L-O-V-E"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
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
          \transpose ees c' { \transpose g a {\sax} }
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}