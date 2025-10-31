\version "2.18.2"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

\paper {
  #(set-paper-size "letter")
%  paper-height = 11\in
%  paper-width = 8.5\in
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Tout En Sifflotant"
composer = #"-Arthur Petit"
meter = #" (Med. Swing)"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
            \override #'(offset . 7)
            \override #'(thickness . 6)
            \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  title = \realBookTitle
  tagline = \markup { \fontsize #1 (Bass) } %tagline = ##f
}

theNotes = \relative c {
  \set Staff.midiInstrument = "acoustic bass"
  \key ees \major
  \clef bass
  %\showStartRepeatBar \bar "[|:"
  %\repeat "volta" 2 {
    ees4 d c bes |
    ees bes c d |
    ees bes' g f | c' aes g f %\break
    ees d c bes |
    a bes c bes' |
    ces aes g f | ees bes c bes' %\break
    ees, bes' c g  | 
    ees4 des c aes' | f ees aes c    
  %}
  %\alternative {
  %  {
      \time 2/4 ces4 g %\break
      \time 4/4 bes4 aes f4 ees |
      des ces bes fes' |
      ees d c g' 
      f g aes d, \break
      \bar "||"
  %    \bar ":|]" \break
  %  }
  ees4 f g bes | ees d c bes |
  g aes bes ees | c aes g bes | %\break  
  aes g f ees | g bes, b d |
  aes' g ges f | ees f g ees | %\break  
  bes d c g' | ces, d aes' g |
  f ees d c |
  %  {
       \time 2/4 ces g' %\break
      \time 4/4 f d ees d c g' bes, f'
      ees d c g' | e,8 aes( bes) f'( ees4) d | \break \bar "||"
  %    \bar ":|]"
  %  }
  %}
  
  %%% Trumpet Solo
  ees4 g c b | bes a aes d, | ees f g c, | f c' bes aes | %\break 
  f ees d c | a ees' aes, bes | ces g' aes f | %\break 
  ees d c bes' | ees, g c ees, | des' bes g fes | f c' ees g, | 
  \time 2/4 aes ces | %\break 
  \time 4/4 ees, g bes aes g f ges fes | ees d c ees f c' bes d, \break \bar "||"
  
  %% Last Verse
  bes' aes g f | ees ees'  c d, | ees bes ees g | aes c, bes' aes | %\break 
  f ees d bes' | a a ees bes | ces g' aes bes | ees, g c, bes' | ees, g c ees, |
  des' ces c gis | f ees d g | aes aes ees g c g aes f g f aes, f' g bes f c' bes d, | 
  ees8. g,16~ g4 aes a | bes8 c d ees r4 r8 g8~ g1\fermata \bar "|."
}

theChords = \chordmode {
  %\repeat "volta" 2 {
    e2:maj7 cis2:m7 | e2:maj cis2:m7 | e2:maj gis2:aug | fis2:m fis2:m7 |
    fis2:m fis2:m7 | ais:m5-7 a:maj7 | a:m7 fis:m5-7 | e2:maj cis2:m7 |
    e2:maj cis2:m7 | e2:7 cis2:5+7 | fis2:m fis2:m7 | 
  %}
  %\alternative {
  %  {
      \time 2/4 a2:m7+ | \time 4/4
      e2:maj7 b2:m7 | e2:7 g:7 | fis2:m7 cis2:m7 | fis2:m7 b:7 |
  %  }
  %% Repeating 
  e2:maj7 cis2:m7 | e2:maj cis2:m7 | e2:maj gis2:aug | fis2:m fis2:m7 |
  fis2:m fis2:m7 | ais:m5-7 a:maj7 | a:m7 fis:m5-7 | e2:maj cis2:m7 |
  e2:maj cis2:m7 | e2:7 cis2:5+7 | fis2:m fis2:m7 | 
  %  {
      \time 2/4 a:m7+ | \time 4/4 
      e2:maj7 cis2:m7 | fis2:m7 b:7 | e2:maj7 cis2:m7 | fis2:m7 b:7 |
  %  }
  %}
  
  %% SOLO TRompette
    e2:maj7 cis2:m7 | e2:maj cis2:m7 | e2:maj gis2:aug | fis2:m fis2:m7 |
    fis2:m fis2:m7 | ais:m5-7 a:maj7 | a:m7 fis:m5-7 | e2:maj cis2:m7 |
    e2:maj cis2:m7 | e2:7 cis2:5+7 | fis2:m fis2:m7 | 
      \time 2/4 a2:m7+ | \time 4/4
      e2:maj7 b2:m7 | e2:7 g:7 | fis2:m7 cis2:m7 | fis2:m7 b:7 |
  %% Dernier couplet
  e2:maj7 cis2:m7 | e2:maj cis2:m7 | e2:maj gis2:aug | fis2:m fis2:m7 |
  fis2:m fis2:m7 | ais:m5-7 a:maj7 | a:m7 fis:m5-7 | e2:maj cis2:m7 |
  e2:maj cis2:m7 | e2:7 cis2:5+7 | fis2:m fis2:m7 | 
      \time 2/4 a:m7+ | \time 4/4 
      e2:maj7 cis2:m7 | fis2:m7 b:7 | e2:maj7 cis2:m7 | fis2:m7 b:7 |
}

theWords = \lyricmode {
  %Tout en siff -- lo -- tant
  % Tout en re -- gre -- ttant
}

\score {
  <<
%    \new ChordNames \transpose e f {\theChords}
%    \new Voice = soloist \transpose e f {\theNotes}
     \new ChordNames \transpose e ees {\theChords}
     \new Voice = soloist \theNotes %\transpose ees ees {\theNotes}
%    \new Lyrics \lyricsto soloist \theWords
  >>
  \layout {
    %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
    %\override Score.KeySignature #'break-visibility = #'#(#f #f #f)  % make only the first time signature visible
    %\override Score.SystemStartBar #'collapse-height = #1  % allow single-staff system bars
  }
  \midi {
    \tempo 4 = 88
  }
}
