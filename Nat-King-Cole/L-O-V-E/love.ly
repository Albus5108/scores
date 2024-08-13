\version "2.24.1" % \version "2.19.55"

% \paper {
%   #(define dump-extents #t)
%   indent = 10\mm
%   ragged-right = ##t
% }

%{
*************************
*     				                *
*	 Definition des voix 	*
*     				                *
*************************
%}

% ***** Accords *****

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

global = {
  \time 4/4
  \key g \major
  \tempo "Swing" 4=130
  \compressEmptyMeasures % \compressFullBarRests % compress rest bars
}

% ***** Vocal ***** 

\include "love-vocal.ly"

% ***** Violons ***** 

\include "love-violin.ly"

% ***** Violoncelles ***** 

\include "love-cello.ly"

% ***** Trompette ***** 

\include "love-trumpet.ly"
%\include "love-trumpet-2.ly"

% ***** Saxophone *****

\include "love-saxophone.ly"

% ***** Trombone *****

\include "love-trombone.ly"

% ***** Jazz Guitar *****

\include "love-jazz-guitar.ly"

%{
**************************
*                        *
* Mise en place des voix *
*                        *
**************************
%}

\book{
  \bookOutputSuffix "Conducteur"
  \header {
      title = \markup { \fontsize #3 \bold "L-O-V-E"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
        }
      }
      subtitle = ""
      instrument = "Complete Score"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      \chords {
        \transpose g a {\chrd}
      }
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Vocal"
	  \set Staff.midiInstrument = #"electric piano 1"
	  \transpose g a {\vcl}
     }
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"J. Guitar"
	  \set Staff.instrument="electric guitar (jazz)"
	  \transpose g a {\gtr}
     }
     \new StaffGroup = "StaffGroup_strings" <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Violin"
	  \set Staff.midiInstrument = #"violin"
	  \transpose g a {\vln}
     }
     % Cello
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Cello"
	  \set Staff.midiInstrument = #"cello"
	  \transpose g a {\cello}
     }	
     >>
     \new StaffGroup = "StaffGroup_brass" <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Trumpet Bb"
	  \set Staff.midiInstrument = #"trumpet"
	  \transpose g a {\trp}
     }
     % \new Staff \relative c' {
% 	  \set Staff.instrumentName = #"Trumpet Bb"
% 	  \set Staff.midiInstrument = #"trumpet"
% 	  \compressFullBarRests
% 	  \trp_ii
%      }
     
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Sax Alto Eb"
	  \set Staff.midiInstrument = #"alto sax"
	  %\transposition ees
	  \transpose g a {\sax} %\transpose ees bes,  { \transpose g a {\sax} }
     }
     
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Trombone Ut"
	  \set Staff.midiInstrument = #"trombone"
	  \transpose g a {\trb}
     }
     >>
   >>
   
    \layout { }
    \midi{ \tempo 4 = 180  }
  }
}


\book{
  \bookOutputSuffix "Chord-Grid"
  \paper {
  %indent = 0
  ragged-right = ##f
  %annotate-spacing = ##t
  
  %% Forcing into 1 single page
  %system-system-spacing = #'((basic-distance . 0.1) (padding . 0))
  %ragged-last-bottom = ##f
  %ragged-bottom = ##f
  
  %system-count = #9
  
  %page-count = #1
  }
  \header {
      title = \markup { \fontsize #3 \bold "L-O-V-E"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Bert Kaempfert, Milt Gabler"}
        }
      }
      subtitle = ""
      instrument = "Chord Grid"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
      tagline=##f
    }
    \score {
      <<
        \new ChordGrid \with { \magnifyStaff #(magstep -1) } \chordmode { \transpose g a {\chrd} }
      >>
      
      \layout {
%         \context {
%           \Score
%           \override SpacingSpanner.common-shortest-duration = \musicLength 2
%         }
      }
    }
  
}
