\version "2.20.0"
% ***** Piano *****

pianoUpchannelA_intro = \relative c' {
  \partial 8 r8 | R1*3
}

pianoUpchannelA_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  % accordeon
  \time 2/4
  r2 
  \time 4/4
  e''16 b gis e16 e'16 b gis e16 e'16 c a e16 e'16 c a e16 
  e'16 b gis e16 e'16 b gis e16 e'16 c a e16 e'16 c a e16 
  e'16 b gis e16 e'16 b gis e16 e'16 c a e16 e'16 c a e16 
  e'16 b gis e16 e'16 b gis e16 c16 e16 a c e4 r8 e4. |
  r8. e16 a8 c16 e~ e e8 e16 d8 c16 a~ | a4 r4 r2 |
  r8. e16 a8 c16 e~ e e8 e16 d8 c |  a8 e16 e e4 |
  
  % chant
  R1*2
  
}

pianoUpchannelB_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  % accordeon
  s1 |
  s1 |
  s1 |
  s1 |
  s2 s8 c'4. |
  r8. e16 a8 c16 e~ e e8 e16 d8 c16 a~ | a4 r4 r2 |
  r8. e16 a8 c16 e~ e e8 e16 d8 c16 a~ | a4 r4 r2 |
  % chant
  R1*2
  
}

pianoUpchannelA_outro = \relative c'' {
  \mark \markup \center-column { \box "Outro" }
  
}

pianoUpchannelA = \relative c'' {
  \global
  % Intro 
  \pianoUpchannelA_intro 
  % Verse 1 et 2  
  \pianoUpchannelA_theme \bar"||"
  % Outro
  \pianoUpchannelA_outro \bar"|."
  
}

pianoUpchannelB = \relative c'' {
  \global
  % Intro 
  \pianoUpchannelA_intro 
  % Verse 1 et 2  
  \pianoUpchannelB_theme \bar"||"
  % Outro
  
}

\book{
  \bookOutputSuffix "Piano"
  \header {
      title = \markup { \fontsize #3 \bold "La Cumbia Del Mar Adentro"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words & Music by"} }
          \line{\center-align \fontsize #0 "Darío Restrepo"}
        }
      }
      subtitle = ""
      instrument = "Piano"
      % opus = "Op. 9"
      copyright= \markup { "Catalina Restrepo - Copyright 2024" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      \chords {
        \chrd
      }
      \new PianoStaff <<
       \new Staff = "up" {
         \context Voice = voiceA \pianoUpchannelA
          << 
            {\context Voice = voiceB \pianoUpchannelB}
%            \\
%            {\context Voice = voiceC \pianoUpchannelC}
          >>
       }
       \new Staff = "down" {
         \clef bass
         % \context Voice = voiceA \pianoDownchannelA
%          <<
%            {\context Voice = voiceB \pianoDownchannelB}
%            \\
%            {\context Voice = voiceC \pianoDownchannelC}
%          >>
       }
     >>
      
      
    >>    
    \midi{ \tempo 4 = 70  } 
    \layout {} 
  }
}