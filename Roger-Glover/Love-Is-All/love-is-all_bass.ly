\version "2.20.0"

global = {
  \time 12/8
  %\key c \major
  \tempo 4. =110
  \compressFullBarRests % compress rest bars
}

% ***** Bass Guitar *****
bass_intro = \relative c {
  \key d \major
  %R1. * 4
  b'4.-^\f a-^ gis-^ fis-^ | e'-^ d-^ cis-^ b-^ |
  a-^ g-^ fis-^ e-^ | d1. |
  \key c \major
}

bass_chorus = \relative c {
  \mark \markup \center-column { \box Chorus }
  a'4. a4 e8 a4 e8 a4 e8 | d4. d4 a8 d4 a8 d4 a8 |
  g4. g4 g8 d'4 g,8 d'4 g,8 |c4. c4 g8 c4 g8 c4 g'8 |
  
  a4. a4 e8 a4 e8 a4 e8 | d4. d4 a8 d4 a8 d4 a8 |
  g4. g4 g8 d'4 g,8 d'4 g,8 | c2.~ c4. r4. |
  %% Ecriture avec reprise
  % \repeat "volta" 2 {
%     a'4. a4 e8 a4 e8 a4 e8 | d4. d4 a8 d4 a8 d4 a8 |
%     g4. g4 g8 d'4 g,8 d'4 g,8 | 
%   }
%   \alternative {{ c4. c4 g8 c4 g8 c4 g'8 | } { c2.~ c4. r4 }}
}

bass_interlude = \relative c {
  \mark \markup \center-column { \box "Post-Ch." }
  \key d \major
  b4. a gis4 cis8 dis4. | e4. d cis4 fis8 gis4. |
  a4. g fis4 b8 cis4. | d2.~ d4. r |
  \key c \major
}

bass_verse = \relative c {
  \repeat "percent" 2 {
    c4. c d d | e e f g |
  }
  c,4. c d d | e e f f |
  \repeat "percent" 2 {
    g4.-^\f g4.-^ g4.-^ g4.-^
  }
  
}

bass_verse_i = \relative c {
  \mark \markup \center-column { \box "Verse 1" }
  \bass_verse
}

bass_verse_ii = \relative c {
  \mark \markup \center-column { \box "Verse 2" }
  \bass_verse
}

bass_waltz = \relative c {
  \time 3/4 
  \key a \major
  \mark \markup \center-column { \box "Waltz" }
  b2. | fis | e | b' | a | e' | d~ | d4 d cis |
  b2. | fis | e | b' | a | e' | d~ | d4 d cis |
  b2. | fis | e | b' | a | e' | d~ | d4 d cis |
  b2. | fis | e | b' | a | e' |
  \bar "||"
  \key c \major
  \time 12/8 g,4 g8 g4 g8 g4 g8~ g4. \bar "||"
}

bass_verse_iii = \relative c {
  \mark \markup \center-column { \box "Verse 3" }
  \bass_verse
  % ^\segno
}

bass_last_chorus = \relative c {
  \mark \markup \center-column { \box Chorus }
    %% Ecriture avec reprise
  \repeat "percent" 2 {
    a'4. a4 e8 a4 e8 a4 e8 | d4. d4 a8 d4 a8 d4 a8 |
    g4. g4 g8 d'4 g,8 d'4 g,8 | c4. c4 g8 c4 g8 c4 g'8 | 
  }
}

bass = \relative c {
  \global
  \clef bass
  % Intro
  \bass_intro \bar "||" 
  % Verse 1 et 2
  \bass_verse_i  \bar "||" 
  \bass_verse \bar "||" 
  % Chorus
  \bass_chorus \bar "||"
  % Post chorus
  \bass_interlude \bar "||"
  % Verse 3
  \bass_verse_ii
  % Chorus
  \bass_chorus \bar "||"
  \bass_waltz
  % Verse 4
  \bass_verse_iii
  % Chorus
  \repeat "volta" 2 {
  \bass_last_chorus
  }  
}

% \book{
%   \bookOutputSuffix "Bass-Guitar"
%   \header {
%       title = \markup { \fontsize #3 \bold "Love Is All"}
%       composer = \markup {
%         \column{
%           \line{\center-align \fontsize #-2 {"Words and Music by"} }
%           \line{\center-align \fontsize #0 "Roger Glover"}
%         }
%       }
%       subtitle = ""
%       instrument = "Bass Guitar"
%       % opus = "Op. 9"
%       copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
%       tagline=##f
%     }
%   \score {
%     <<
%       \chords {
%         %\accords                
%       }
%       \new StaffGroup <<
%         \new Staff \relative c {
%           \set Staff.instrument="trombone"
%           \bass % \transpose c aes, {\bass}
%         }
%       >>
%       
%       
%     >>    
%     \midi{ \tempo 4 = 100  } 
%     \layout {} 
%   }
% }