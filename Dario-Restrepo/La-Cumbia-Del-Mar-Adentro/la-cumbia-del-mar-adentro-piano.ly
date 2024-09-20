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
  e'16 b gis e16 e'16 b gis e16 c16 e16 a c e4 r8 <a, c e>4. |
  \ottava 1
  r8. <e e'>16 <a a'>8 <c c'>16 <e e'>~ q q8 q16 <d d'>8 <c c'>16 <a a'>~ | q4 r4 r2 |
  r8. <e e'>16 <a a'>8 <c c'>16 <e e'>~ q q8 q16 <d d'>8 <c c'>16 <a a'>~ | q8 <e a e'>16 q q4 |
  \ottava 0
  
  % chant
  <a,, c e>8. q16 q8. <g b d>16~ q16 q8 q16 q4 | <f a c>8. q16~ q8. <e gis b>16~ q4 r4
  <a c e>8. q16~ q16 q q8 r16 <g b d>8 q16 q4 | 
  }
  \alternative{
    {
    <f a c>8. q16 q q8. <e gis b>4 r4
  } {
    <f a c>8. q16 q q8. <e gis b>4 r4
  }
  }
  %clarinet
  r8 <c' e a>8 r4 r8 q8 r4 | r8 <b e>8 r8 q8 r8 <c e a>8 r8 q8 |
  r8 <c e a>8 r8 q r8 q8 r8 q | r8 <b e>8 r8 q8 r8 <c e a>8 r8 q8 |
  
  r8 <b e>8 r8 q8 r8 <e a>8 r8 q8 | r8 <b e>8 r8 q8 r8 <e a>8 r8 q8 |
  r8 <b e>8 r8 q8 r8 <e a>8 r8 q8 | r8 <b e>8 r8 q8 r8 <e a>8 r8 q8 |
  
  \bar"||"
  % Percussions
  R1*4
  \time 3/4 r2.
  \time 4/4 
  R1*4
  \time 2/4
  r2 
  }
}

pianoUpchannelA = \relative c'' {
  \global
  % Intro 
  \pianoUpchannelA_intro 
  % Theme
  \pianoUpchannelA_theme \bar"|."
  
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
  
  \mark \markup \small "Fine" 
  \bar"||"
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
%          << 
%            {\context Voice = voiceB \pianoUpchannelB}
%            \\
%            {\context Voice = voiceC \pianoUpchannelC}
%          >>
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
    \midi{ \tempo 4 = 95  } 
    \layout {} 
  }
}