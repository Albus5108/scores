\version "2.8.7"

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
accords = \chordmode { 
  ees1: | d:7 | f:m | bes:7 | f:m | bes2:7 bes2:aug7 | ees1: | bes:7 |
  ees: | d:7 | f:m | bes:7 | f:m | bes:7 | ees: | ees: |
  aes:m | aes:m | ees: | ees: | aes:m | aes:m | bes:7 | bes:7 |
  ees: | d:7 | f:m | bes:7 | f:m | bes:7 | ees: | ees: |

}

global = {
  \time 4/4
  \key g \major
  \tempo "Swing" 4=100
  \compressFullBarRests % compress rest bars
}

% ***** Violons ***** 

\include "all-you-need-is-love-violin.ly"

% ***** Violoncelles ***** 

\include "all-you-need-is-love-cello.ly"

% ***** Trompette ***** 

\include "all-you-need-is-love-trumpet.ly"
\include "all-you-need-is-love-trumpet-2.ly"

% ***** Saxophone *****

\include "all-you-need-is-love-saxophone.ly"

% ***** Trombone *****

\include "all-you-need-is-love-trombone.ly"


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
      title = \markup { \fontsize #3 \bold "All You Need Is Love"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Lennon/McCartney"}
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
%            \chords {
%                 \transposition bes
%                 \chrd
%             }
     \new StaffGroup = "StaffGroup_strings" <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Violin"
	  \set Staff.midiInstrument = #"violin"
	  \compressFullBarRests
	  \vln
     }
     % Cello
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Cello"
	  \set Staff.midiInstrument = #"cello"
	  \compressFullBarRests
	  \cello
     }	
     >>
     \new StaffGroup = "StaffGroup_brass" <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Trumpet Bb"
	  \set Staff.midiInstrument = #"trumpet"
	  \compressFullBarRests
	  \trp
     }
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Trumpet Bb"
	  \set Staff.midiInstrument = #"trumpet"
	  \compressFullBarRests
	  \trp_ii
     }
     
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Sax Alto Eb"
	  \set Staff.midiInstrument = #"alto sax"
	  \compressFullBarRests
	  %\transposition ees
	  \sax %\transpose ees bes,  { \sax }
     }
     
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Trombone Ut"
	  \set Staff.midiInstrument = #"trombone"
	  \compressFullBarRests
	  \trb
     }
     >>
   >>
   
    \layout { }
    \midi{ \tempo 4 = 100  }
  }
}
