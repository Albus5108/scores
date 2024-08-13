\version "2.20.0"

global = {
  \time 12/8
  %\key c \major
  \tempo 4. =110
  \compressFullBarRests % compress rest bars
}

% ***** Violin *****
vln_interlude = \relative c'' {
  \key d \major
  R1. * 4 \bar "||"
  \key c \major
}

vln_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  e2.^~ e4. d4 a8( | a1.) | e'2.~ e4. d4 c8( | c1.) |
  e2.~ e4. d4 a8( | a1.) | r4. e'4 d8 e4 c8 d4. | c2.~ c4. r 
}

vln_verse_i = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  e2.( d | e a,) | e'2.( d | e c) |
  e2.( d | e a,) | R1. * 2 \bar "||"
  % ^\segno
}

vln_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  | R1. * 8
  % ^\segno
}

vln_waltz = \relative c'' {
  \time 3/4 
  \key a \major
  \mark \markup \center-column { \box "Waltz" }
  \tuplet 3/2 { b'8->^\markup \bold "Solo"( c b ) } \tuplet 3/2 { bes->( ces bes) } \tuplet 3/2 { a->( bes a) } |
  \tuplet 3/2 { aes8->( a aes ) } \tuplet 3/2 { g->( aes g) } \tuplet 3/2 { fis->( g fis) } |
  e2 ~ \tuplet 3/2 { e4 e8 } |
  e4 fis4~ \tuplet 3/2 { fis4 e8 } |
  cis2. |
  \tuplet 3/2 { cis8->( d cis ) } \tuplet 3/2 { c->( cis c) } { b16->( cis b a) } |
  d2 d16( cis d e) |
  fis2. |
  r8 c cis d dis e | f fis g gis a ais |
  b2 ~ \tuplet 3/2 { b4 b8 } |
  b4 cis4~ \tuplet 3/2 { cis4 b8 } |
  a2 ~ \tuplet 3/2 { a4 a8 } |
  \tuplet 3/2 { a8->( b a ) } \tuplet 3/2 { g->( a g) } { fis16->( g fis e) } |
  d2.~ | d2.\glissando |
  b'4. cis8 d4 | cis2\mordent b4 |
  e2 d4 | cis2\mordent b4 |
  a4. b8\glissando cis4 | b2\mordent a4 | 
  fis2.~ | fis |
  fis16->\( ( a fis e) d( fis e d) fis->( a fis e) |
  fis->( a fis e) fis->( a fis e) fis->( a fis e) \) |
  gis->\( ( b gis e) gis->( b gis e) gis->( b gis e) |
  gis->( b gis e) gis->( b gis e) gis->( b gis e) \)
  a->\( ( cis a e) a->( cis a e) a->( cis a e) \)
  a4-> a16( g fis e) a->( g fis e) |  
  
  \bar "||"
  \key c \major
  \time 12/8 d2.~ d4 r8 r4. \bar "||"
}

vln_last_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  r1.^\markup {\bold "Solo ad lib." "1x Tacet" } | R1.* 3 | 
  e2.\glissando a4 g8 fis4 e8 | fis4 g8 fis4 e8 d4 des8 c4 a8 |
  b2. r2. | R1. |
}



vln = \relative c'' {
  \global
  \small
  % Intro
  \vln_interlude 
  % Verse 1 et 2
  R1. * 8  \bar "||" R1. * 8 \bar "||" 
  % Chorus
  \vln_chorus \bar "||"
  % Post chorus
  \mark \markup \center-column { \box "Post-Ch." }
  \vln_interlude
  % Verse 3
  \vln_verse_i
  % Chorus
  \vln_chorus \bar "||"
  \normalsize
  \vln_waltz
  % Verse 4
  \vln_verse_ii
  % Chorus
  \repeat "volta" 2 {
  \vln_last_chorus
  }  
}

\book{
  \bookOutputSuffix "Violin"
  \header {
      title = \markup { \fontsize #3 \bold "Love Is All"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Roger Glover"}
        }
      }
      subtitle = ""
      instrument = "Violin"
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
          \set Staff.instrument="violin"
          \transpose c aes, {\vln}
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}