\version "2.20.0"
% ***** Piano *****

pianoUpchannelA_intro = \relative c' {
  \partial 8 r8 | R1*3
}

pianoUpchannelA_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  \repeat "segno" 2 {
  \repeat "volta" 2 {
  % accordeon
  e''16 b gis e16 e'16 b gis e16 e'16 c a e16 e'16 c a e16 
  e'16 b gis e16 e'16 b gis e16 e'16 c a e16 e'16 c a e16 
  e'16 b gis e16 e'16 b gis e16 e'16 c a e16 e'16 c a e16 
  e'16 b gis e16 e'16 b gis e16 c16 e16 a c e4 r8 e4. |
  \ottava 1
  r8. e16 a8 c16 e~ e e8 e16 d8 c16 a~ | a4 r4 r2 |
  r8. e16 a8 c16 e~ e e8 e16 d8 c |  a8 e16 e e4 |
  \ottava 0
  
  % chant
  e,8. e16 e8. d16~ d16 d8 d16 d4 | c8. c16~ c8. b16~ b4 r4
  e8. e16~ e16 e e8 r16 d8 d16 d4 | 
  }
  \alternative{
    {
    c8. c16 c c8. b4 r4
  } {
    c8. c16 c c8. b4 r4
  }
  }
  %clarinet
  r8 a8 r4 r8 a8 r4 | r8 e8 r8 e8 r8 a8 r8 a8 |
  r8 a8 r8 a r8 a8 r8 a | r8 e8 r8 e8 r8 a8 r8 a8 |
  
  r8 e8 r8 e8 r8 a8 r8 a8 | r8 e8 r8 e8 r8 a8 r8 a8 |
  r8 e8 r8 e8 r8 a8 r8 a8 | r8 e8 r8 e8 r8 a8 r8 a8 |
  
  % Percussions
  R1*4
  \time 3/4 r2.
  \time 4/4 
  R1*4
  \time 2/4
  r2 
  }
}

pianoUpchannelB_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  \repeat "volta" 2 {
  % accordeon
  s1 |
  s1 |
  s1 |
  s1 |
  s2 s8 c'4. |
  r8. e16 a8 c16 e~ e e8 e16 d8 c16 a~ | a4 r4 r2 |
  r8. e16 a8 c16 e~ e e8 e16 d8 c16 a~ | a4 r4 r2 |
  % chant
  s1*4
  }
  \alternative{
    {
    s1
  } {
    s1
  }
  }
  %clarinet
}

% pianoUpchannelA_outro = \relative c'' {
%   \mark \markup \center-column { \box "Outro" }
%   
% }

pianoUpchannelA = \relative c'' {
  \global
  % Intro 
  \pianoUpchannelA_intro 
  % Verse 1 et 2  
  \pianoUpchannelA_theme \bar"|."
  % Outro
  %\pianoUpchannelA_outro \bar"|."
  
}

pianoUpchannelB = \relative c'' {
  %\global
  % Intro 
  %\pianoUpchannelA_intro 
  % Verse 1 et 2  
  %\pianoUpchannelB_theme \bar"||"
  % Outro
  
}

% Down - left hand
pianoDownchannelA_intro = \relative c' {
  \partial 8 r8 | R1*3
}

pianoDownchannelA_theme = \relative c' {
  \mark \markup \center-column { \box "Theme" }
  \repeat "segno" 2 {
  \repeat "volta" 2 {
  % accordeon
  b4 e a, a | b4 e a, a | b4 e a, a | b4 e a, a |
  b4 e a, a | b4 e a, a | b4 e a, a | b4 e a, a |
  
  
  % chant
  a4 a g g | f f e e | a4 a g g | 
  }
  \alternative{
    {
    f f e e | 
  } {
    f f e e | 
  }
  }
  %clarinet
  a4 a8 e a4 e4 | b' b a a | e a a a | e a a a |
  
  e a a a | e a a a |
  e b' a a | e a a a |
  
  % Percussions
  a a a a | a a e a |
  a a e a | a a e a |
  \time 3/4 a a e 
  \time 4/4 
  a a a e |
  a a4 a8 b e,4 
  a a4 a8 b e,4 
  a a a e 
  \time 2/4
  a a
  }
}

pianoDownchannelA = \relative c {
  \global
  % Intro 
  \pianoDownchannelA_intro 
  % Verse 1 et 2  
  \pianoDownchannelA_theme \bar"|."
  
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
         \context Voice = voiceA \pianoDownchannelA
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