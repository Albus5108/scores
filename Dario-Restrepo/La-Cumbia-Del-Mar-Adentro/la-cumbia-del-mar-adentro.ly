\version "2.20.0"

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
chrd = \chordmode { 
  \partial 8 s8 | s1*3
  s2 e2:7 | a2:m e2:7 | a2:m e2:7 | a2:m e2:7 |
  a1*4:m
  a2:m g2 f: e:
  a2:m g2 f: e:

}

global = {
  \time 4/4
  \key a \minor
  \tempo 4=100
  %\compressFullBarRests % compress rest bars
}

% ***** Vocals ***** 

\include "la-cumbia-del-mar-adentro-vocals.ly"


% ***** Violoncelles ***** 

% \include "fior-di-latte-cello.ly"

% ***** Accordion ***** 

\include "la-cumbia-del-mar-adentro-accordion.ly"

% ***** Clarinet *****

\include "la-cumbia-del-mar-adentro-clarinet.ly"


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
      title = \markup { \fontsize #3 \bold "La Cumbia Del Mar Adentro"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words & Music by"} }
          \line{\center-align \fontsize #0 "Darío Restrepo"}
        }
      }
      subtitle = ""
      instrument = "Complete Score"
      % opus = "Op. 9"
      copyright= \markup { "Catalina Restrepo - Copyright 2024" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
           \chords {
                %\transposition bes
                \chrd
            }
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Vocals"
	  \set Staff.midiInstrument = #"voice oohs"
	  %\compressFullBarRests
	  \vocals
     }
     \new StaffGroup = "StaffGroup_strings" <<
      % \new Staff \relative c' {
% 	  \set Staff.instrumentName = #"Violin 1"
% 	  \set Staff.midiInstrument = #"violin"
% 	  \compressFullBarRests
% 	  \vln
%      }
%      % Cello
%      \new Staff \relative c' {
% 	  \set Staff.instrumentName = #"Cello"
% 	  \set Staff.midiInstrument = #"cello"
% 	  \compressFullBarRests
% 	  \cello
%      }	
     >>
     \new StaffGroup = "StaffGroup_brass" <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Accordion"
	  \set Staff.midiInstrument = #"accordion"
	  %\compressFullBarRests
	  \accordion
     }
     
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Clarinet Bb"
	  \set Staff.midiInstrument = #"clarinet"
	  %\compressFullBarRests
	  %\transposition ees
	  \clarinet %\transpose ees bes,  { \clarinet }
     }
     >>
   >>
   
    \layout {}
    \midi{ \tempo 4 = 100  }
  }
}