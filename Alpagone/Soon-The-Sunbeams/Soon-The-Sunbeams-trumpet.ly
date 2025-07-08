\version "2.20.0"

global = {
  \time 4/4
  \key cis \minor
  \tempo 4=119
  %\compressFullBarRests % compress rest bars
}

% ***** Trompette ***** 
trp_theme = \relative c' {
  \mark \markup \center-column { \box "Chorus" }
  \time 4/4
  r4. cis'16 dis e-> e-> dis8 cis-. b16 gis->~ | gis4 r8. e16 fis->\( gis fis8~ fis8\) e16 b'->~ b8 gis g16->\( fis e\) e->~ e8 cis-. r4 |
  r8 b16 cis e-> e-> cis8 fis-> cis16 gis'->~ gis8 e-. | r4 r8 gis16-> fis16~ fis4 r8 e16 b'->~ b8 a a b16 gis->~ gis g\( fis e\) fis\( e\) cis e~ |
  e2 r2 | r2 r4 r8 cis16\( dis | e\) gis\( fis8\) dis'8-> b16 cis->~ cis8\glissando gis cis16->\( b gis\) fis->~ fis8 fis16\( e\) fis-> gis8. r4 r8 b,16 cis  |
  e-> e-> cis8 r4 r2 | r8. dis'16~ dis e8 fis16 dis4. dis16-- b-- dis-- b-- b-- gis-- b-- gis-- gis-- e-- gis-- e-- e-- cis-- r8 dis | 
  dis'8.-> b16-- b-- gis-- b-- cis--~ cis8 cis16 e->~ | e8 cis r8 cis16 fis->~ fis8 cis r8 cis16 gis'->~ gis8 g16\( e\) fis-> e cis e->~ e8 fis-. r2 |
}

trp_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  \time 4/4
  R1*8 | R1*8 \bar"||" R1*8 | r1\fermata 
}

trp = \relative c'' {
  \global
  % Verse 1 et 2  
  \trp_theme \bar"||"
  % Outro
  %\trp_outro \bar"|."
  
}

\book{
  \bookOutputSuffix "Trp-1-Bb"
  \header {
      title = \markup { \fontsize #3 \bold "Soon The Sunbeams"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Music by"} }
          \line{\center-align \fontsize #0 "Alpagone"}
        }
      }
      subtitle = ""
      instrument = "Trumpet Bb"
      % opus = "Op. 9"
      % copyright= \markup { "Arthur Petit - Copyright 2024" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      %\chords {
      %  \transposition ees
        %\transpose bes c' { \chrd }
      %}
      \new StaffGroup <<
        \new Staff \relative c' {
          \set Staff.instrument="trumpet"
          \trp %\transpose bes c' { \trp }
        }
      >>
      
      
    >>    
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}

