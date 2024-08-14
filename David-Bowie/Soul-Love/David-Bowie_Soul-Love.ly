\version "2.8.7"

%  \paper {
%     #(define dump-extents #t)
%     indent = 10\mm
%     ragged-right = ##t
%  }

\header {
  title = "SOUL LOVE"
  composer = "David Bowie"
  tagline=##f
}

#(set-global-staff-size 17)
\paper {
  indent = 3.0\cm  % space for instrumentName
  short-indent = 1.5\cm  % space for shortInstrumentName
}

%{
***********************
*                     *
* Definition des voix *
*                     *
***********************
%}
backi = {
  \repeat unfold 2 {\time 4/4 r1 \time 3/4 a2. }
  \time 4/4 r1 | a2. r4 |
  a2( gis4 r4 | a2 gis4 r4) |
}

backii = {
  \clef G
  \key d \major
  \time 4/4 r8 a a4 a16 a8 a16 r e fis16 a \time 3/4 r8 a a4 a16 a8 gis16 
  \time 4/4 r8 fis fis4 fis16 fis8 fis16 r a, cis fis \time 3/4 r8 fis fis4 fis16 fis8 e16 
  \time 4/4 r8 d d4 d16 d8 d16 r a b d | r8 d d4 d16 d8 d16 r e fis gis |
  r8 a a4 gis16 gis8 gis16 r gis8 gis16 | r8 a a4 gis16 gis8 gis16~ gis4 
}

backii_alt = {
  \clef G
  \key d \major
  \time 4/4 r8 a a4 a16 a8 a16 r e fis16 a \time 3/4 r8 a a4 a16 a8 gis16 
  \time 4/4 r8 fis fis4 a16 a8 a16 r a, cis fis \time 3/4 r8 a a4 a16 a8 e16 
  \time 4/4 r8 d d4 d16 d8 d16 r a b d | r8 d d4 d16 d8 d16 r gis a b |
  r8 cis cis4 b16 b8 b16 r b8 b16 | r8 cis cis4 e16 e8 e16~ e4 
}

chorus = {
  \time 4/4 r2 r4 cis( | fis,2.) r4 | r2 r4 cis'( | fis,2.) r4 |
  a2 gis | g fis | f e | e( cis4 d) 
}

solo =  {
  \clef G
  \key d \major
  \time 4/4 b'8. a16~ a8 gis e8. cis16~ cis4 \time 3/4 \tuplet 3/2 { b'8 a b } cis8 b a gis 
  \time 4/4 a8. gis16~ gis8 fis gis8. fis16~ fis4 \time 3/4 fis16 a a8 b8 a16 cis~ cis e e cis
  \time 4/4 fis8. e16~ e8 a, fis'8. e16~ e4 \time 3/4 r16 e8 cis16 e2\trill
  \time 4/4 e,8 fis a,4 d16 cis b cis~ cis4 \tuplet 3/2 { fis8 e cis cis' b a fis' e cis } e4
}

% ***** Saxophone *****

saxMusic = \relative c'' {
      \clef G
      \key d \major
      \time 4/4
      \partial 1 {
        s1 \bar"||"
	R1*2 \bar"||" 
	R1*2 \bar"||"
	% Couplet 
	\backi \bar"||"
	<< {
	  \backii_alt
	} \\ {
	  \relative c'' { \backii }
	} >>
	% Chorus
	\bar"||" \chorus \bar"||"
	% Solo
	\mark "Solo"
	\solo
	\transpose c d { \relative c'' {
	  << {
	  \backii_alt
	} \\ {
	  \relative c'' { \backii }
	} >>
	  \bar"||" \chorus
	  % Solo Guitare + Lalalala
	  \mark "Solo Guitare"
	  \repeat "volta" 2 { \relative c'' { \backii } }
	}}
      }
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
	  \transpose ees bes {\saxMusic}
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