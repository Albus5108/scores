\version "2.20.0"

%{
*************************
*     				                *
*	 Definition des voix 	*
*     				                *
*************************
%}

% ***** Accords *****
accords = \chordmode { 
}

global = {
  \time 12/8
  %\key c \major
  \tempo 4. =110
  \compressFullBarRests % compress rest bars
}

% ***** Choir ***** 

\include "love-is-all_choir.ly"

% ***** Violons ***** 

\include "love-is-all_violin.ly"

% ***** Violoncelles ***** 



% ***** Trompette ***** 

\include "love-is-all_trumpet.ly"

% ***** Clarinette ***** 

\include "love-is-all_clarinette.ly"


% ***** Saxophone *****

\include "love-is-all_alto-sax.ly"

% ***** Trombone *****

\include "love-is-all_trombone.ly"

% ***** Bass Guitar *****

% \include "love-is-all_bass.ly"

% ***** Piano *****

\include "love-is-all_piano.ly"

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
      title = \markup { \fontsize #3 \bold "Love Is All"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Roger Glover"}
        }
      }
      subtitle = ""
      instrument = "Complete score"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      \new ChoirStaff <<
    \chords {
        \accords                
      }
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \transpose c aes, {\soprano} }
      \new Voice = "alto" { \voiceTwo \transpose c aes, {\alto} }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
%    \ new Lyrics \with {
%       \override VerticalAxisGroup #'staff-affinity = #CENTER
%     } \lyricsto "soprano" \verseTwo
%     \new Lyrics \with {
%       \override VerticalAxisGroup #'staff-affinity = #CENTER
%     } \lyricsto "soprano" \verseThree
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { T B }
    } <<
      %\clef bass
      \new Voice = "tenor" { \voiceOne \transpose c aes, {\tenor} }
      \new Voice = "bass" { \voiceTwo \transpose c aes, {\bass} }
    >>
  >>
%            \chords {
%                 \transposition bes
%                 \chrd
%             }
     \new StaffGroup = "StaffGroup_strings" <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Violin"
	  \set Staff.midiInstrument = #"violin"
	  \compressFullBarRests
	  \transpose c aes, {\vln}
     }
     % % Cello
%      \new Staff \relative c' {
% 	  \set Staff.instrumentName = #"Cello"
% 	  \set Staff.midiInstrument = #"cello"
% 	  \compressFullBarRests
% 	  \cello
%     }	
     >>
     \new StaffGroup = "StaffGroup_brass" <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Trumpet Bb"
	  \set Staff.midiInstrument = #"trumpet"
	  \compressFullBarRests
	  \transpose c aes, {\trp}
     }
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Clarinet Bb"
	  \set Staff.midiInstrument = #"clarinet"
	  \compressFullBarRests
	  \transpose c aes, {\clarnt}
     }
     
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Sax Alto Eb"
	  \set Staff.midiInstrument = #"alto sax"
	  \compressFullBarRests
	  %\transposition ees
	  \transpose c aes, {\alto_sax} %\transpose ees bes,  { \transpose c aes, {\alto_sax} }
     }
     
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Trombone Ut"
	  \set Staff.midiInstrument = #"trombone"
	  \compressFullBarRests
	  \transpose c aes, {\trb}
     }
      >>
      \new PianoStaff <<
        \new Staff = "up" {
          \set Staff.instrumentName = #"Piano"
          \set Staff.midiInstrument = #"harpsichord"
          %\context Voice = voiceA \trackAchannelA
          << 
            {\context Voice = voiceB \transpose c aes, {\trackAchannelB}}
            \\
            {\context Voice = voiceC \transpose c aes, {\trackAchannelBvoiceB}}
          >>
        }
        \new Staff = "down" {
          \set Staff.instrumentName = #"Piano"
          \set Staff.midiInstrument = #"harpsichord"
          \clef bass
          \context Voice = voiceA \transpose c aes, {\trackBchannelA}
          <<
            {\context Voice = voiceB \transpose c aes, {\trackBchannelB}}
            \\
            {\context Voice = voiceC \transpose c aes, {\trackBchannelBvoiceB}}
          >>
        }
      >>
   >>
   
    \layout { }
    \midi{ \tempo 4 = 100  }
  }
}
