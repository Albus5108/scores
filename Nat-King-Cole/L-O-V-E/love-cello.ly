\version "2.24.1" % \version "2.20.0"
% global = {
%   \time 4/4
%   \key g \major
%   \tempo "Swing" 4=130
%   \compressEmptyMeasures % \compressFullBarRests % compress rest bars
% }
% ***** Cello *****

cello_intro = \relative c'' {
  R1*4 
}

cello_verse = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  R1*16
}

cello_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  b,1~( | b | c~ | c~ | c~ | c | b~ | b) |
  f'~( | f | e | bes | b! | c) | b2( d | cis1) |
}

cello_trumpet_solo = \relative c'' {
  \mark \markup \center-column { \box "Trumpet Solo" }
  \key aes \major
  \clef 	G
  c1~\p( | c | des~ | des | c~ | c2 b | bes1 | aes) |
  c1\mf( | ees2 c | ees2 des | b2 d | ees1 | aes,2 bes | c1) | e2~ e8 r8 r4 |
  
}

cello_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  \key a \major
  cis,1( | a2 cis | cis1 | b) | e1( | e2 e | e1 | cis) |
  a'1( | g2 g | g1 | fis1) | dis1( | fis) | b,4->\f r4 r2 | r1
}

cello_verse_iv = \relative c'' {
  \mark \markup \center-column { \box "Verse 4" }
  cis1~\mf( | cis | d~ | d~ | d~ | d | cis | a) |
  cis1( | fis2 cis | d1 | dis2 b | cis1 | d2 b | a1 | ais1 )| 
  d( | d2 cis | a1 | ais1) |
  d( | d2 cis | a2 g | fis f) |
  r1 | r2 r4 fis'!->~ | fis1\fermata |
}

cello = \relative c'' {
  \clef tenor
  \global
  % Intro 
  \cello_intro \bar"||"
  % Verse 1 et 2
  \cello_verse \bar"||"
  \cello_verse_ii \bar"||"
  % Trumpet solo
  \cello_trumpet_solo \bar"||"
  % Verse 3
  \cello_verse_iii \bar"||"
  % Chorus
  \cello_verse_iv \bar"|."
}


\book{
  \bookOutputSuffix "Cello"
  \header {
      title = \markup { \fontsize #3 \bold "L-O-V-E"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
        }
      }
      subtitle = ""
      instrument = "Cello"
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
          \set Staff.instrument="cello"
          \transpose g a {\cello}
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}

% \include "love-violin.ly"
% 
% chrds_verse_a = \chordmode {
%   \repeat "percent" 2 {g1: } | a:m7 | d:7 | 
%   \repeat "percent" 2 {d1:7} | \repeat "percent" 2 {g1: }
%   \repeat "percent" 2 {g1:7 } | \repeat "percent" 2 {c1: } 
%   \repeat "percent" 2 {a1:7 } | \repeat "percent" 2 {d1:7}
% }
% 
% chrds_verse_b = \chordmode {
%   \repeat "percent" 2 {g1: } | a:m7 | d:7 | 
%   \repeat "percent" 2 {d1:7} | \repeat "percent" 2 {g1: }
%   \repeat "percent" 2 {g1:7 } | c: | cis:dim |
%   g1: | a2:m7 d:7 | g1: |%  g1: | // bes2:m7 ees:7 |
% }
% 
% chrd = \chordmode {
%   % Intro 
%   \repeat "percent" 2 {g1: } \repeat "percent" 2 {g1: }  \bar"||"
%   % Verse 1 et 2
%   \mark \markup \center-column { \box "Verse 1" }
%   \chrds_verse_a \bar"||"
%   \mark \markup \center-column { \box "Verse 2" }
%   \chrds_verse_b | bes2:m7 ees:7 | \bar"||"
%   % Trumpet solo
%   \mark \markup \center-column { \box "Trumpet Solo" }
%   \transpose g aes {
%     \chrds_verse_b  | ais2:m7 dis:7 | \bar"||"
%   }  
%   \transpose g a {
%     % Verse 3
%     \mark \markup \center-column { \box "Verse 3" }
%     \chrds_verse_a \bar"||"
%     \mark \markup \center-column { \box "Verse 4" }
%     \chrds_verse_b | e1:5+.9+.7 | \bar"||"
%      %g1: | a2:m7 d:7 | g1: | e1:5+.9+.7 |
%      a1:m7 | d:7 | g1: | e1:5+.9+.7 |
%      a1:m7 | d:7 | g2: d2:m/f | c2:/e c2:m/ees | g:/d d2:7/fis | g2: r4 g4:6.9~ | g1:6.9\fermata \bar"|."
%   }
% }
% 
% \book{
%   \bookOutputSuffix "Conducteur"
%   \header {
%       title = \markup { \fontsize #3 \bold "L-O-V-E"}
%       composer = \markup {
%         \column{
%           \line{\center-align \fontsize #-2 {"Words and Music by"} }
%           \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
%         }
%       }
%       subtitle = ""
%       instrument = "Complete Score"
%       % opus = "Op. 9"
%       copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
%       tagline=##f
%     }
%   \score {
%     <<
%       \chords {
%         \chrd
%       }
%      \new StaffGroup = "StaffGroup_strings" <<
%       \new Staff \relative c' {
% 	  \set Staff.instrumentName = #"Violin"
% 	  \set Staff.midiInstrument = #"violin"
% 	  \vln % \transpose g a {\vln}
%      }
%      % Cello
%      \new Staff \relative c' {
% 	  \set Staff.instrumentName = #"Cello"
% 	  \set Staff.midiInstrument = #"cello"
% 	  \cello % \transpose g a {\cello}
%      }	
%      >>
%    >>
%    
%     \layout { }
%     \midi{ \tempo 4 = 180  }
%   }
% }