\version "2.18.0"

% \paper {
%   #(define dump-extents #t)
%   indent = 10\mm
%   ragged-right = ##t
% }

\header {
  title = \markup { \fontsize #3 \bold "A Whiter Shade Of Pale"}
%   poet = \markup {
%     \column{
%       \line{\center-align \fontsize #-2 {"Words by"} }
%       \line{\center-align \fontsize #0 "Ringo"}
%     }
%   }
  composer = \markup {
    \column{
      \line{\center-align \fontsize #-2 {"Words and Music by"} }
      \line{\center-align \fontsize #0 "Procol Harum"}
    }
  }
  subtitle = ""
  instrument = "Drums"
 % opus = "Op. 9"
 copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
 tagline=##f
}

drumsCellHigh = \drummode {
  \repeat unfold 8 hh8
}

drumsCellLow = \drummode {
  bassdrum4 snare8 bd8 bd4 sn8 bd
}

drumsIntro = \drummode {
  << {
    \drumsCellHigh
    \repeat unfold 6 hh8 \tuplet 6/4 {hh16 r sn tomh tomh tomh }
    crashcymbal8 \repeat unfold 7 hh8
    \repeat unfold 8 hh8
    crashcymbal8 \repeat unfold 7 hh8
    \drumsCellHigh
    \drumsCellHigh
    % break
    \repeat unfold 4 hh8 hh8 \tuplet 6/4 {hh16 toml sn } \tuplet 6/4 {sn16 tomh tomh toml toml toml }
     } \\ {
    \drumsCellLow
    bassdrum4 snare8 bd8 bd2
    bassdrum4 snare8 bd8 bd4 sn8 bd
    bassdrum4 snare8 bd8 bd sn8 sn <bd sn> 
    bassdrum4 snare8 bd8 bd4 sn8 bd
    bassdrum4 snare8 bd8 bd4 sn4
    \drumsCellLow
    % break
    bassdrum4 snare8 bd8 bd2 
  } >>
  \bar"||"
}

drumsVerse = \drummode {
  << {
      crashcymbal8^\markup"Verse" \repeat unfold 7 hihat8 |
      \drumsCellHigh
      \drumsCellHigh
      \repeat unfold 6 hh8 \tuplet 6/4 {sn16 tomh sn sn toml toml }
      % I was feeling kind of seesick
      crashcymbal8 \repeat unfold 7 hihat8 |
      \drumsCellHigh
      \drumsCellHigh
      \repeat unfold 4 hh8 \tuplet 6/4 {hh16 sn sn sn sn sn } \tuplet 6/4 {sn sn tomh tomh toml toml }
      % The room was
      crashcymbal8 \repeat unfold 7 hihat8 |
      \drumsCellHigh
      \drumsCellHigh % crashcymbal8 \repeat unfold 7 hihat8 |
      \repeat unfold 4 hh8 \tuplet 6/4 {hh8 sn16 sn sn sn } \tuplet 6/4 {tomh tomh tomh toml toml toml }
      % when we call out
      crashcymbal8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh hh hh |
      \repeat unfold 4 hh8 \tuplet 3/2 {hh4 hh hh }
    } \\ {
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd8 bd sn4
      % I was feeling kind of seesick
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd8 bd sn4
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 sn bd2
      % The room was
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd8 sn sn8 sn
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd2
      % when we call out
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn4
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd \tuplet 3/2 {<bd sn>4 <bd sn>4 <bd sn>4 }
    } >>
    \bar"||"
}

drumsChorus = \drummode {
  << {
      crashcymbal8^\markup"Chorus" hh cymr \repeat unfold 3 hihat8 \tuplet 6/4 {sn16 tomh tomh toml toml toml } |
      hh8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh \tuplet 6/4 {toml16 toml sn sn sn sn }
      crashcymbal8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr cymr \tuplet 6/4 {hh8 sn16 sn sn sn} \tuplet 6/4 { tomh16 tomh tomh toml toml toml} |
    } \\ {
      bassdrum4 snare8 bd bd2
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd2
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 sn bd2
    } >>
}

drumsIntroII = \drummode {
  % On en est la !!!!!!!!!!!!!!
  << {
    crashcymbal8^\markup"Interlude" \repeat unfold 7 hihat8 |
    \drumsCellHigh
    \drumsCellHigh
    \drumsCellHigh
    % G
    \drumsCellHigh
    \drumsCellHigh
    hh8 hh8 cymr hh hh hh cymr hh |
    % break
    hh8 hh8 cymr hh \tuplet 6/4 {cymr16 tomh sn sn tomh tomh } \tuplet 6/4 {tomh16 tomh sn sn toml toml }
     } \\ {
    \drumsCellLow
    \drumsCellLow
    \drumsCellLow
    sn4 snare8 bd8 bd4 sn4
    \drumsCellLow
    bd4 snare8 bd8 bd4 sn4
    \drumsCellLow
    % break
    bassdrum4 snare8 sn8 bd2 
  } >>
  \bar"||"
}

drumsVerseII = \drummode {
  << {
      crashcymbal8^\markup"Verse" \repeat unfold 7 hihat8 |
      \drumsCellHigh
      \drumsCellHigh
      \repeat unfold 8 hh8
      % But I Wandered through my playing cards
      hh8 \repeat unfold 7 hihat8 |
      \drumsCellHigh
      \drumsCellHigh
      hh8 hh8 cymr cymr \tuplet 6/4 {hh8 sn16 sn sn sn} \tuplet 6/4 { tomh16 tomh tomh toml toml toml} | 
      % The room was
      crashcymbal8 \repeat unfold 7 hihat8 |
      \drumsCellHigh
      \drumsCellHigh % crashcymbal8 \repeat unfold 7 hihat8 |
      \repeat unfold 6 hh8 cymr cymr
      % when we call out
      crashcymbal8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh hh hh |
      hh8 \tuplet 6/4 {sn16 sn sn } sn4 \tuplet 3/2 {hh4 hh hh }
    } \\ {
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn4
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd sn sn sn
      % But I Wandered through my playing cards
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd8 bd sn4
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 sn bd2
      % The room was
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn4
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd8 bd bd bd
      % when we call out
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn4
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum2 \tuplet 3/2 {<bd sn>4 <bd sn>4 <bd sn>4 }
    } >>
    \bar"||"
}

drumsChorusII = \drummode {
  << {
      crashcymbal8^\markup"Chorus" hh cymr \repeat unfold 3 hihat8 \tuplet 6/4 {hh16 r sn tomh tomh tomh }
      crashcymbal8 hh8 cymr hh hh8 \tuplet 6/4 {hh8 sn16 } \tuplet 6/4 {sn16 tomh tomh toml toml toml }
      crashcymbal8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh cymr cymr cymr
      crashcymbal8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr hh hh hh cymr hh |
      hh8 hh8 cymr cymr \tuplet 6/4 {hh8 sn16 sn sn sn} \tuplet 6/4 { tomh16 tomh tomh toml toml toml} |
    } \\ {
      bassdrum4 snare8 bd bd2
      bassdrum4 snare8 bd bd2
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd8 sn sn sn
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 bd bd4 sn4
      bassdrum4 snare8 bd bd4 sn8 bd
      bassdrum4 snare8 sn bd2
    } >>
}

drumsIntroIII = \drummode {
  % On en est la !!!!!!!!!!!!!!
  << {
    crashcymbal8^\markup"Interlude" hh8 cymr hh hh hh cymr hh |
    hh8 hh8 cymr hh hh hh cymr hh |
    hh8 hh8 cymr hh hh hh cymr hh |
    hh8 hh8 cymr cymr \tuplet 6/4 {r8 sn16 sn sn sn} \tuplet 6/4 { tomh16 tomh tomh toml toml toml} |
    % G
    crashcymbal8 hh8 cymr hh hh hh cymr hh |
    \drumsCellHigh
    hh8 hh8 cymr hh hh hh cymr hh |
    % break
    hh8 \tuplet 6/4 {sn16 sn sn } sn4 \tuplet 3/2 {hh4 hh hh }
     } \\ {
    \drumsCellLow
    \drumsCellLow
    \drumsCellLow
    bd 4 snare8 sn8 s2
    \drumsCellLow
    bd4 snare8 bd8 bd4 sn8 bd
    \drumsCellLow
    % break
    bassdrum2 \tuplet 3/2 {<bd sn>4 <bd sn>4 <bd sn>4 }
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
          \mark \markup {
            \tiny \raise #1
            \musicglyph "scripts.segno"
          }
          \drumsChorus
          \drumsIntroII
          \drumsVerseII
          \drumsChorusII
          \drumsIntroIII
          \mark \markup {
            \italic "D.S. "
            \tiny \raise #1
            \musicglyph "scripts.segno"
          }
          
         %^\markup {\small "to" \tiny \raise #1 \musicglyph "scripts.coda"}
          
          }
        }         
    >>
    \midi{ \tempo 4 = 110 } 
    \layout {} 
}