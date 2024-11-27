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
chrd = \chordmode { 
  \repeat "percent" 10 {f1:9}
  f1: | f:/e | d:m7 | d:m7/c | bes:maj7 | a:m | 
  d1:m7/c | g2:m7/c c:7 |
  
  f1: | f:/e | d:m7 | d:m7/c | bes:maj7 | a:m | 
  d1:m7/c | b1:m7-5 | bes:m6 | f1:/a
  g1:m7 | f1:/a | g1:m7 | c:5 |
  
  % Outro
  \repeat "percent" 8 {g1:m7 | f1:/c |}

}

global = {
  \time 4/4
  \key f \major
  \tempo 4=70
  \compressFullBarRests % compress rest bars
}

% ***** Violons ***** 

\include "fior-di-latte-violin-1-flat.ly"
\include "fior-di-latte-violin-2-flat.ly"
\include "fior-di-latte-violin-3-flat.ly"
\include "fior-di-latte-violin-4-flat.ly"

% ***** Violoncelles ***** 

% \include "fior-di-latte-cello.ly"

% ***** Trompette ***** 

% \include "fior-di-latte-trumpet.ly"

% ***** Saxophone *****

% \include "fior-di-latte-saxophone.ly"


%{
**************************
*                        *
* Mise en place des voix *
*                        *
**************************
%}


\book{
  \bookOutputSuffix "Violins"
  \header {
      title = \markup { \fontsize #3 \bold "Fior Di Latte"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Music by"} }
          \line{\center-align \fontsize #0 "Alpagone"}
        }
      }
      subtitle = ""
      instrument = "Violins"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2024" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
           \chords {
                \chrd
            }
     \new StaffGroup = "StaffGroup_strings" <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Violin 1"
	  \set Staff.midiInstrument = #"violin"
	  \compressFullBarRests
	  \vln
     }
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Violin 2"
	  \set Staff.midiInstrument = #"violin"
	  \compressFullBarRests
	  \vln_ii
     }
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Violin 3"
	  \set Staff.midiInstrument = #"violin"
	  \compressFullBarRests
	  \vln_iii
     }
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Violin 4"
	  \set Staff.midiInstrument = #"violin"
	  \compressFullBarRests
	  \vln_iv
     }
     
     >>
   >>
    \layout {}
    \midi{ \tempo 4 = 70  }
  }
}
