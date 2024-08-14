\version "2.8.7"

%  \paper {
%     #(define dump-extents #t)
%     indent = 10\mm
%     ragged-right = ##t
%  }

\header {
  title = "HUNG UP ON MY BABY"
  composer = "Isaac Hayes"
  tagline=##f
}

#(set-global-staff-size 17)
\paper {
  indent = 3.0\cm  % space for instrumentName
  short-indent = 1.5\cm  % space for shortInstrumentName
}

trickery = {
  % Here begins the trickery!
    \cadenzaOn
    \stopStaff
        \once \override TextScript.extra-offset = #'( 0 . -3.0 )
        \once \override TextScript.word-space = #1.5
        <>^\markup { \center-column { "D.S. al Coda"
          \line {
            \musicglyph #"scripts.coda"
            \musicglyph #"scripts.tenuto"
            \musicglyph #"scripts.coda"} } }

        % Increasing the unfold counter will expand the staff-free space
        \repeat unfold 1 {
          s1
          \bar ""
        }
        % Resume bar count and show staff lines again
    \startStaff
    \cadenzaOff
}

%{
***********************
*                     *
* Definition des voix *
*                     *
***********************
%}
ci = {
  \repeat "volta" 2 { gis8 fis r4 r8 cis e fis~ | fis b, r4 r8 cis e gis~ | gis4 fis8( e) fis e~e gis~ | gis4 r r2 |
  gis8 b b( gis) b( cis) gis4 fis8 e e( cis) fis( e) cis4 | r8 cis e fis~fis e cis( b) }
  \alternative {{ cis4 r4 r8 cis e gis } {cis,4 r4 r2 }} % {cis,4 r4 r4 gis16 b8 gis16 }
  
}

cii = {
  \repeat "volta" 2 { 
    \repeat "percent" 3 { gis8^"1st time tacet" fis r4 r8 cis e fis~ | fis b, r4 r8 cis e gis | } 
  }
  \alternative { { r1 | r2 r8 cis, e gis | } {gis8 fis r4 r8 cis e fis~ | fis b, r4 r2 |} }
}

backi = {
  \repeat "percent" 2 {r8 dis, dis8. dis16~ dis8 dis8 r4 | r4 e8. e16 r2 |}
  r8 dis dis8. dis16~ dis8 dis8 r4 | r4 e8. e16 r4 b'8 cis | e4 e cis8 b gis fis | e1~ | e2 fis8 e cis b \bar"||"
  cis4 r r2 | R1*2 | r2 gis''4 b 
}

backii = {
  \repeat "percent" 2 {r8 dis,, dis8. dis16~ dis8 dis8 r4 | r4 e8. e16 r2 |}
  r8 dis dis8. dis16~ dis8 dis8 r4 | r4 e8. e16 r4 r4 | a8 b r cis16 d e4 r8 fis16 gis | a1~ | a2 fis8 e cis b \bar"||"
  cis4 r r2 | R1*2 | r2 gis'4 b 
}

ri = {
  b2. gis8 cis~ | cis gis~ gis2 gis16 b8 gis16 |
}

% ***** Saxophone *****

saxMusic = \relative c'' {
      \clef G
      \key a \major
      \time 4/4
      R1*4 \bar"||"
      R1*4 \bar"||"
      \mark "Guitare"
      R1*16 \bar"||"
      R1*8 r1 \bar"||"
      R1*3 r2 r8 cis e gis~
      \mark "Cuivres"
      \ci \bar"||"
      \backi \bar"||"
      \mark "Solo"
      R1*8*2
      \mark \markup { \musicglyph #"scripts.segno" }
      \backii
      \mark \markup { \musicglyph #"scripts.coda" }
      \cii 
      
      \trickery
	
        \break
	% Show up, you clef and key!
	\once \override Staff.KeySignature.break-visibility = #end-of-line-invisible
	\once \override Staff.Clef.break-visibility = #end-of-line-invisible
	\once \override Score.RehearsalMark.extra-offset = #'( -5 . .5 )
	\once \override Score.RehearsalMark.font-size = #5
	\mark \markup { \musicglyph #"scripts.coda" }
	R1*3 
	\repeat "volta" 2 { r2 r4 r8 gis'~ | gis fis r4 r2 | r2 r8 cis e fis~ fis b, r4 r2 |
	r2 r8 cis e gis~ gis b r4 r2 | r2 r8 gis b cis~ cis b r4 r2 |} %\bar"|."
}

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
      % piece = "I. Introduction"
  }
  \score {
   <<
    <<
     \new Staff \relative c' {
	  \set Staff.instrumentName = #"Trumpet"
	  \set Staff.midiInstrument = #"trumpet"
	   \saxMusic
     }
     >>
     \new StaffGroup = "StaffGroup_strings" <<
             \new Staff = "Staff_Guitar" {
                  \set Staff.instrumentName = #"Saxophone"
                  \set Staff.midiInstrument = #"overdriven guitar"
                  \transpose ees bes {\saxMusic}
              }
     >>
   >>
    \layout { }
    \midi{ \tempo 4 = 180  }
  }
}

\book{
  \bookOutputSuffix "Sax-Eb"
  \header {
      %piece = "I. Introduction"
      %tagline=##f
  }
  \score {
    <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Saxophone Eb"
	  \set Staff.midiInstrument = #"guitar"
	  %\tempo 4=120
	  \compressFullBarRests
	  \transpose ees bes, {\saxMusic}
     }
   >>
    \layout { }
  }
}

\book{
  \bookOutputSuffix "Trp-Bb"
  \header {
      %piece = "I. Introduction"
      %tagline=##f
  }
  \score {
    <<
      \new Staff \relative c' {
	  \set Staff.instrumentName = #"Trompette Bb"
	  \set Staff.midiInstrument = #"guitar"
	  %\tempo 4=120
	  \compressFullBarRests
	  \saxMusic
     }
   >>
    \layout { }
  }
}