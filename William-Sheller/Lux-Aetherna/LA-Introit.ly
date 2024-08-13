%{
Ce canevas illustre l’utilisation de contextes StaffGroup pour regrouper les instruments selon leur famille,
imbriqués dans un GrandStaff, ainsi que le recours à la fonction \transpose pour les instruments transpositeurs. Dans tous les identificateurs, la musique est stockée en ut. Les notes peuvent tout aussi bien être saisies en ut ou dans la tonalité particulière de l’instrument avant d’être transposées puis affectées à une variable. 
%}
\version "2.18.2"

\header {
  title = "LUX AETHERNA"
  subtitle="INTROIT"
  composer = "William Sheller"
  
  %meter = \tempo 4=80
  tagline=##f
  %arranger = "Arr. Arthur Petit All Star"
}

#(set-global-staff-size 17)
\paper {
  indent = 3.0\cm  % space for instrumentName
  short-indent = 1.5\cm  % space for shortInstrumentName
}

fluteMusic = \relative c'' { \key g \major 
                            \partial 2 r2 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 r1 | r1 \bar"||"	% Choeurs de l'Apocalypse
                            r1  | r1  | r1  | r1  | r1  | r1  | r2 r4 r8 fis8 |
                            e8 e~e e d d~d d |c c~c c b b~b b | a a~a a g g~g g| b2 g | fis1 | r4 r8 b a a~a a | g g~g g fis fis~fis fis \bar"||"
                            e4 r4 r2 \repeat unfold 12 r1 
                            \repeat "volta" 2 { \time 6/4 r1. \time 4/4 r1 \time 3/4 r2. \time 4/4 r1 }
}
% Pitches were written on a manuscript for Clarinet in Bb
% are transposed to concert pitch.
clarinetMusic = \transpose c' bes
\relative c' { \key g \major 
                            \partial 2 r2 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 r1 | r4 a8 b <a c> <b d> <c e> d \bar"||"	% Choeurs de l'Apocalypse
                            r1  | r1  | r4 b c d  | r1  | r1  | r1  | r2 r4 r8 a'8 |
                            g8 g~g g fis fis~fis fis |e e~e e d d~d d |c c~c c b b~b b | fis'2 e | d1 | r4 r8 g fis fis~fis fis | e e~e e d d~d d \bar"||"
                            b4 r4 r2 \repeat unfold 10 r1 | dis2\< e2 | fis1\!
                            \repeat "volta" 2 { \time 6/4 e1. \time 4/4 c2 d2 \time 3/4 b4 a8 b c d \time 4/4 e1 }
}
trumpetMusic = \transpose c' bes \relative c'' { \key g \major 
                            \partial 2 r2 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 r1 | r1 \bar"||"	% Choeurs de l'Apocalypse
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 |
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            r1 | r2. c4 | cis2. cis4 | c2. c4 | c2. c4 | bes2. bes4 | b2. b4 | bes2. bes4 | bes2. bes4 | c1 | b1\<~ | b1~ | b1\! 
                            \repeat "volta" 2 { \time 6/4 e,1. \time 4/4 c2 d2 \time 3/4 b4 a8 b c d \time 4/4 e1 }
}
% Key signature is often omitted for horns
hornMusic = \transpose c' f
\relative c' { 
                            \partial 2 r2 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 a8 b c d a' b c d~ | d1 \bar"||"	% Choeurs de l'Apocalypse
                            r1 | r1 | r4 b, c d  | r1  | r1  | r1  | r1 |
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            \repeat unfold 11 r1 | fis2\< g | a1\!
                            \repeat "volta" 2 { \time 6/4 e1. \time 4/4 e2 fis2 \time 3/4 b4 a8 b c d \time 4/4 e1 }
}
percussionMusic = \drummode  { \clef percussion
                            \partial 2 r2 | r1 | r1 | r1 | r1 |r1 | 
                                << {
                                      \repeat unfold 8 hh8 \bar"||"
                                      \time 6/4 \repeat unfold 12 hh8 \time 4/4 \repeat unfold 8 hh8 \time 3/4 hh8 hhho r16 r8 hho16 r4 |
                                      \time 6/4 crashcymbal8 \repeat unfold 11 hh8 \time 4/4 \repeat unfold 8 hh8 \time 3/4  hh8 hh hho4 r4 |
                                      \time 4/4 crashcymbal8 \repeat unfold 7 hh8 | hh8 hh hho8. hho16~hho4 r8 hho \bar"||" % Choeurs de l'Apocalypse
                                      cymc8 \repeat unfold 7 hh8 | \repeat unfold 6 { \repeat unfold 8 hh8 }
                                      \repeat unfold 7 { \repeat unfold 8 hh8 }
                                      \repeat unfold 13 { \repeat unfold 8 hh8 } 
                                      \repeat "volta" 2 {\time 6/4 \repeat unfold 12 hh8 \time 4/4 \repeat unfold 8 hh8 \time 3/4 \repeat unfold 6 hh8 \time 4/4 cymc \repeat unfold 7 hh8  }
                                } \\ {
                                        bd4 sn4 bd4 sn4 
                                        \time 6/4 bd4 sn4 bd4 sn4 bd sn \time 4/4 bd sn bd sn \time 3/4 bd8 sn sn16 sn8. sn16 sn sn8
                                        \time 6/4 bd4 sn4 bd8 bd sn4 bd sn \time 4/4 bd sn bd sn \time 3/4 bd8 bd sn4 sn16 sn8.
                                        \time 4/4 bd4 sn4 bd8 bd sn4 | bd sn bd16 sn16 sn16 sn16:32~sn8 sn8   \bar"||" % Choeurs de l'Apocalypse
                                        \repeat unfold 7 { bd4 sn4 bd4 sn4 } 
                                        bd4 sn4 bd8 bd8 sn16 bd8 bd16 | bd4 sn4 r16 bd8 bd16 sn16 bd8 bd16 | bd4 sn4 r8 bd sn4 | bd4 sn4 bd8 bd8 sn16 bd8 bd16 | bd4 sn4 r8 bd sn8 sn8 | bd4 sn4 bd8 bd sn8 bd8 | bd4 sn4 bd8 bd sn8 bd8 |
                                        \repeat unfold 13 { bd4 sn4 bd8 bd sn8 bd8 } 
                                        \repeat "volta" 2 { \time 6/4 bd4 sn4 bd8 bd sn8 bd bd4 sn \time 4/4 bd8 bd sn4 bd8 bd sn4 \time 3/4 bd8 bd sn8 bd bd4 \time 4/4 bd4 sn bd sn  }
                                } >>
}
sopranoMusic = \relative c'' { \key g \major 
                            \partial 2 r2 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||" % Theme
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 r1 | r1 \bar"||"	% Choeurs de l'Apocalypse
                            r8 b16 a b8 a4 g4 a8~  | a g4 fis8  a g b4 | a1  | fis4. g8 fis4. g8  | g2( fis2)  | b2 a4 a  | a2 b |
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            g4 fis b d | c2. c4 | cis2. cis4 | a2. a4 | a2. a4 | bes2( d4) d4 | d4 c b d | bes2. bes4 | c2. c4 | ees2 ees4 ees | b2\< b4 b | b1~  | b1\! 
                            \repeat "volta" 2 { \time 6/4 r1. \time 4/4 r1 \time 3/4 r2. \time 4/4 r1 }
}
sopranoLyrics = \lyricmode {  }
altoIMusic = \relative c' { \key g \major 
                            \partial 2 r2 | f1 | f1 | g1 | c1 | f,1 | fis1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 r1 | r1 \bar"||"	% Choeurs de l'Apocalypse
                            r8 b16 a b8 a4 g4 a8~  | a g4 fis8  a g b4 | a1  | fis4. g8 fis4. g8  | g2( fis2)  | b2 a4 a  | a2 b |
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            e,4 d fis a | g2. g4 | a2. a4 | f2. f4 | fis2. fis4 | bes2. bes4 | g2. g4 |  g2. g4 |  g2. g4 | c2 c4 c | g2\< g4 g | fis2 g2 | a1\! 
                            \repeat "volta" 2 { \time 6/4 r1. \time 4/4 r1 \time 3/4 r2. \time 4/4 r1 }
}
altoIIMusic = \relative c' { \key g \major 
                            \partial 2 r2 | des1 | des1 | e1 | aes1 | c,1 | d1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 r1 | r1 \bar"||"	% Choeurs de l'Apocalypse
                            r8 e16 d e8 d4 c4 d8~  | d c4 b8  d c e4 | d1  | dis4. dis8 dis4. dis8  | e2( d2)  | d2 c4 c  | d2 d |
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"  
                            e4 d d d | e2. e4 | e2. e4 | ees2. ees4 | d2. d4 | d2. d4 | d2. d4 | ees2. ees4 | e2. e4 | a2 a4 a | d,2\< d4 d | dis2 e2 | fis1\! 
                            \repeat "volta" 2 { \time 6/4 r1. \time 4/4 r1 \time 3/4 r2. \time 4/4 r1 }
}
altoILyrics =  \lyricmode {Ah -- ah -- ah -- ah -- ah -- ah }
altoIILyrics = \altoILyrics
tenorMusic = \relative c { \clef "treble_8" \key g \major 
                            \partial 2 r2 | aes1 | bes1 | c1 | ees1 | a,1 | b1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 r1 | r1 \bar"||"	% Choeurs de l'Apocalypse
                            r8 e16 d e8 d4 c4 d8~  | d c4 b8  d c e4 | d1  | dis4. dis8 dis4. dis8  | e2( d2)  | d2 c4 c  | d2 d |
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"  
                            e4 d b d | c2. c4 | cis2. cis4 | c2. c4 | d2. d4 | bes2. bes4 | b2. b4 | bes2. bes4 | c2. c4 | f2 f4 f | d2\< d4 d | b1~ | b\! 
                             \repeat "volta" 2 { \time 6/4 r1. \time 4/4 r1 \time 3/4 r2. \time 4/4 r1 }
}
tenorLyrics = \altoILyrics
violinIMusic = \relative c'' { \key g \major 
                            \partial 2 r2 | r1 | r1 | r1 | c1 | r1 | r1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 r1 | r1 \bar"||"	% Choeurs de l'Apocalypse
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 |
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            r1 | c2. c4 | cis2. cis4 | a2. a4 | a2. a4 | bes2( d4) d4 | d4 c b d |g,2( bes) | c2. c4 | c1 | r1 | b2\<( b | b1\!) 
                           \repeat "volta" 2 { \time 6/4 e4 d8 e g b, d e g,4 d'8 e \time 4/4 e,4 d'8 e fis,4 d'8 e \time 3/4 e d g fis e fis \time 4/4 e1 }
}
violinIIMusic = \relative c' { \key g \major 
                            \partial 2 f2~| f1 | f1 | g1 | aes1 | f1 | fis1 \bar"||"
                            \time 6/4 e4 d8 e g b, d e g,4 d'8 e \time 4/4 e,4 d'8 e fis,4 d'8 e \time 3/4 e d g fis e fis |
                            \time 6/4 e4 d8 e g b, d e g,4 d'8 e \time 4/4 e,4 d'8 e fis,4 d'8 e \time 3/4 e d g fis e fis |
                            \time 4/4 e1~ | e1 \bar"||"	% Choeurs de l'Apocalypse    
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 |
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            r1 | g2. g4 | a2. a4 | f2. f4 | fis2. fis4 | bes2. bes4 | g2. g4 |  g2. g4 |  g2. g4 | a1 | r1 | fis2\<( g | a1\!) 
                            \repeat "volta" 2 { \time 6/4 e4 d8 e g b, d e g,4 d'8 e \time 4/4 e,4 d'8 e fis,4 d'8 e \time 3/4 e d g fis e fis \time 4/4 e1 }
}
violaMusic = \relative c { \clef alto \key g \major 
                            \partial 2 r2 | des1 | des1 | e1 | ees1 | c1 | d1 \bar"||"
                            \time 6/4 e4 d8 e g b, d e g,4 d'8 e \time 4/4 e,4 d'8 e fis,4 d'8 e \time 3/4 e d g fis e fis |
                            \time 6/4 e4 d8 e g b, d e g,4 d'8 e \time 4/4 e,4 d'8 e fis,4 d'8 e \time 3/4 e d g fis e fis |
                            \time 4/4 r1 | r4 a8 b <a c> <b d> <c e> d \bar"||"	% Choeurs de l'Apocalypse
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 |
                            r1 | r1 | r1 | r1 | r1 | r1 | r1  \bar"||"
                            r1 | e2. e4 | e2. e4 | ees2. ees4 | d2. d4 | d2. d4 | d2. d4 | ees2. ees4 | e2. e4 | f1 | r1 | dis2\<( e | fis1\!) |
                            \repeat "volta" 2 { \time 6/4 e4 d8 e g b, d e g,4 d'8 e \time 4/4 e,4 d'8 e fis,4 d'8 e \time 3/4 e d g fis e fis \time 4/4 e1 }
}
celloMusic = \relative c { \clef bass \key g \major 
                            \partial 2 r2 | des1 | des1 | e1 | ees1 | c1 | d1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 4/4 r1 | r1 \bar"||"	% Choeurs de l'Apocalypse
                            r1 | r1 | r4 b c d | dis1 | e2 d | r1 | r1 | 
                            \repeat unfold 7 r1  \bar"||"
                            r1 | c2. bes4 | a2. g4 | f2 f'4 ees | d2. c4 | bes2. aes4 | g2 g'4 f | ees2. des4 | c2. c4 | f1 | g2. g4 | b1\<~ | b1\! 
                            \repeat "volta" 2 { \time 6/4 e4 d8 e g b, d e g,4 d'8 e \time 4/4 e,4 d'8 e fis,4 d'8 e \time 3/4 e d g fis e fis \time 4/4 e1 }
}
guitarMusic= \relative c' { \key g \major 
                            \partial 2 r2 | r1 | r1 | r1 | r1 | r1 | r1 \bar"||"
                            \time 6/4 r1. \time 4/4 r1 \time 3/4 r2.
                            \time 6/4 e4^\markup{Delay pedal} d8 e g\glissando b, d\glissando e g,4 d'8 e \time 4/4 e,4 d'8 e fis,4 d'8 e \time 3/4 g fis e fis e4 |
                            \time 4/4 \hideNotes  c4\glissando  \unHideNotes g''4  r2 \bar"|" r1 \bar"||"	% Choeurs de l'Apocalypse
                            r1 | r1 | r1 | r1 | r1 | r1 | r1 |
                            r1 | r2 r8 b16 ais b4 | g'8\glissando <c,, e> <c e> <d fis> <g b>4 r4 | r2 r16 g fis8 g4 | r16 <d fis> <cis f>8 <d fis>8 c16 d r16 <d fis> <cis f>8 <d fis>8 c16 d\glissando | g4 r4 r2 | r1  \bar"||"  
                            \repeat unfold 13 r1 
                            \repeat "volta" 2 { \time 6/4 r1. \time 4/4 r1 \time 3/4 r2. \time 4/4 e4~ e16 d b r16 a g a g~ g4 }
}
bassMusic = \relative c, { \clef "bass_8" \key g \major 
                            \partial 2 r2 | R1*2 | c1 | ees1 | f1 | b8. fis16 a16 b8 fis16 a16 b8 fis d b16 \bar"||"
                            \time 6/4 e4~ e8. b16 d16 e8 b16~ b a8 b16 e,2 \time 4/4 r16 c' g c~ c g c8 r8.  a16 d4 \time 3/4 b4 a8 b c d |
                            \time 6/4 e8. b16 e16 e r b r b e e r b d e g,4 e' \time 4/4 r16 c g c~ c g c8 r8.  a16 d4 \time 3/4 b4 a8 b c d |
                            \time 4/4 e1~ | e1 \bar"||"	% Choeurs de l'Apocalypse
                            e,8. b'16 e8. b16 e,8 b'16 e~ e b d e |e,8. b'16 e8. b16 e,8 b'16 e~ e b d e | d4 b c d | dis1 | b4 r16 e8 g16 a8 b~ b16 g d b | a4 a8. e'16 a a a, a r a8 a16 | b4 e16 fis a b r fis d b r d( fis8) |
                            e4 e8. b16 d e d b~b a8 b16 | \repeat percent 6 { e,4 e'8. b16 d e d b~b a8 b16 } 
                            R1*13 
                            \repeat "volta" 2 { \time 6/4 e4~ e8. b16 d16 e8 b16~ b a8 b16 e,2 \time 4/4 r16 c' g c~ c g c8 r8.  a16 d4 \time 3/4 b4 a8 b c d \time 4/4 e2 r16 d e g~ g a8 b16 }
                            
}

\book{
  \bookOutputSuffix "Conducteur"
\score {
  <<
    \new StaffGroup = "StaffGroup_woodwinds" <<
      \new Staff = "Staff_flute" {
        \set Staff.instrumentName = #"Flute"
        \set Staff.midiInstrument = #"flute"

        \fluteMusic
      }
      \new Staff = "Staff_clarinet" {
        \set Staff.instrumentName = \markup { \concat { "Clarinet in B" \flat } }
        \set Staff.midiInstrument = #"clarinet"
        % Declare that written Middle C in the music
        %  to follow sounds a concert B flat, for
        %  output using sounded pitches such as MIDI.
        % \transposition bes
        % Print music for a B-flat clarinet
        \transpose bes c' \clarinetMusic
      }
    >>
    \new StaffGroup = "StaffGroup_brass" <<
      \new Staff = "Staff_hornI" {
        \set Staff.instrumentName = #"Horn in F"
        \set Staff.midiInstrument = #"french horn"        
        %\transposition f
        \transpose f c' \hornMusic
      }
      \new Staff = "Staff_trumpet" {
        \set Staff.instrumentName = \markup { \concat { "Trumpet in B" \flat } }
        \set Staff.midiInstrument = #"trumpet"
        %\transposition bes
        \transpose bes c' \trumpetMusic
      }
    >>
    \new DrumStaff = "Drums" <<
      \set DrumStaff.instrumentName = #"Drums"
      %\set DrumStaff.midiInstrument = #"drums"
      \percussionMusic
    >>
    \new ChoirStaff = "ChoirStaff_choir" <<
      \new Staff = "Staff_soprano" {
        \set Staff.instrumentName = #"Soprano"
        \set Staff.midiInstrument = #"choir aahs"
        \new Voice = "soprano"
        \sopranoMusic
      }
      \new Lyrics \lyricsto "soprano" { \sopranoLyrics }
      \new GrandStaff = "GrandStaff_altos"
      \with { \accepts Lyrics } <<
        \new Staff = "Staff_altoI"  {
          \set Staff.instrumentName = #"Alto I"
          \set Staff.midiInstrument = #"choir aahs"
          \new Voice = "altoI"
          \altoIMusic
        }
        \new Lyrics \lyricsto "altoI" { \altoILyrics }
        \new Staff = "Staff_altoII" {
          \set Staff.instrumentName = #"Alto II"
          \set Staff.midiInstrument = #"choir aahs"
          \new Voice = "altoII"
          \altoIIMusic
        }
        \new Lyrics \lyricsto "altoII" { \altoIILyrics }
      >>
      \new Staff = "Staff_tenor" {
        \set Staff.instrumentName = #"Tenor"
        \set Staff.midiInstrument = #"choir aahs"
        \new Voice = "tenor"
        \tenorMusic
      }
      \new Lyrics \lyricsto "tenor" { \tenorLyrics }
    >>
    \new StaffGroup = "StaffGroup_strings" <<
      \new GrandStaff = "GrandStaff_violins" <<
        \new Staff = "Staff_violinI" {
          \set Staff.instrumentName = #"Violin I"
          \set Staff.midiInstrument = #"violin"
          \violinIMusic
        }
        \new Staff = "Staff_violinII" {
          \set Staff.instrumentName = #"Violin II"
          \set Staff.midiInstrument = #"violin"
          \violinIIMusic
        }
      >>
      \new Staff = "Staff_viola" {
        \set Staff.instrumentName = #"Viola"
        \set Staff.midiInstrument = #"viola"
        \violaMusic
      }
      \new Staff = "Staff_cello" {
        \set Staff.instrumentName = #"Cello"
        \set Staff.midiInstrument = #"cello"
        %\violaMusic	
        \celloMusic
      }
      \new Staff = "Staff_Guitar" {
        \set Staff.instrumentName = #"Guitar"
        \set Staff.midiInstrument = #"overdriven guitar"
        \guitarMusic
      }      
      \new Staff = "Staff_bass" {
        \set Staff.instrumentName = #"Bass Guitar"
        \set Staff.midiInstrument = #"electric bass (pick)"
        \bassMusic
      }
    >>
  >>
  \layout { }
  \midi{
%           \context {
%                 \Score
%                 midiChannelMapping = #'instrument % affecte les mêmes instruments à un même canal MIDI
%            }
           \tempo 4 = 80
   }
  }
}


\book{
  \bookOutputSuffix "Bass-Guitar"
    \score{
          \header {
           instrument = "Bass Guitar"
           piece = "I. INTROIT"
          }
          \new Staff = "Staff_bass" {
         \set Staff.instrumentName = #"Bass Guitar"
          \compressFullBarRests
          \bassMusic
      }
    }
}