\version "2.18.0"

% \paper {
%   #(define dump-extents #t)
%   indent = 10\mm
%   ragged-right = ##t
% }

\header {
  title = \markup { \fontsize #3 \bold "Drive My Car"}
%   poet = \markup {
%     \column{
%       \line{\center-align \fontsize #-2 {"Words by"} }
%       \line{\center-align \fontsize #0 "Ringo"}
%     }
%   }
  composer = \markup {
    \column{
      \line{\center-align \fontsize #-2 {"Words and Music by"} }
      \line{\center-align \fontsize #0 "Lennon/McCartney"}
    }
  }
  subtitle = ""
  instrument = "Drums"
 % opus = "Op. 9"
 copyright= \markup { "Arthur Petit - Copyright 2022" \char ##x00A9 }
 tagline=##f
}

drumsIntro = \drummode {
R1 * 2 | r2 hightom16 snare sn tomh sn sn tomh8 \bar"||"
}

drumsVerse = \drummode {
  << {
      crashcymbal8^\markup"Verse" \repeat unfold 7 hihat8 | \repeat unfold 8 hihat8
      \repeat unfold 32 hh8
    } \\ {
      \repeat unfold 3 {bassdrum4 snare4 bd8 bd sn bd | bassdrum4 snare8 bd bd8 bd sn bd |}
    } >>
}

drumsVerseBreakI = \drummode {
  << {
      r8 sn sn r sn sn r4 | sn4 sn8 sn r4 sn8 r |
    } \\ {
      bd4 r8 bd8 r4 bd8 bd | r8 bd r4 bd8 bd r4 |
    } >>
    \bar"||"
}

drumsVerseBreakII = \drummode {
  << {
      r8 sn sn r sn sn r4 | sn4 r8 sn r8 sn sn8 r |
    } \\ {
      bd4 r8 bd8 r4 bd8 bd | r8 bd bd r bd8 r r4 |
    } >>
    \bar"||"
}

drumsVerseBreakIII = \drummode {
  << {
      r8 sn sn r sn sn r4 | sn4 sn sn r8 sn8 |
    } \\ {
      bd4 r8 bd8 r4 bd8 bd | r8 bd r4 r8 bd8 bd r |
    } >>
    \bar"||"
}

drumsChorus = \drummode {
  << {
      crashcymbal8^\markup"Chorus" \repeat unfold 7 hihat8 | \repeat unfold 8 hihat8
      \repeat unfold 32 hh8
    } \\ {
      \repeat unfold 3 {bassdrum4 snare4 bd8 bd sn bd | bd4 snare4 bd8 bd sn bd|}
    } >>
}

drumsChorusBreakI = \drummode {
  << {
      \repeat unfold 16 hh8
    } \\ {
      bassdrum4 snare4 bd8 bd sn bd | bassdrum4 snare8 bd bd8 bd sn bd |
    } >>
    \bar"||"
}

drumsChorusBreakII = \drummode {
  << {
      \repeat unfold 8 hh8 | rb16^\markup \tiny "(Tambourine)" \repeat unfold 15 rb16
    } \\ {
      bassdrum4 snare4 bd8 bd sn4 | bassdrum8 r r4 r2 |
    } >>
    \bar"||"
}

%{
**************************
* Mise en place des voix *
**************************
%}

\score {
    <<
      \new DrumStaff \with {
          drumStyleTable = #agostini-drums-style
        }
        \new DrumVoice {
          \drummode {
          \drumsIntro
          \drumsVerse
          \drumsVerseBreakI 
          \drumsChorus
          \drumsChorusBreakI
          \mark \markup {
            \tiny \raise #1
            \musicglyph "scripts.segno"
          }
          \drumsVerse
          \drumsVerseBreakII
          << {
            s1*5 | s2. s8 s^\markup {\small "to" \tiny \raise #1 \musicglyph "scripts.coda"}
             } \\ {
               \drumsChorus
          } >>
          \drumsChorusBreakII
          \drumsVerse
          \drumsVerseBreakIII
          \drumsChorus
          \drumsChorusBreakI
          \mark \markup {
            \italic "D.S. "
            \tiny \raise #1
            \musicglyph "scripts.segno"
          }
          }
        }         
    >>
    \midi{ \tempo 4 = 110 } 
    \layout {} 
}