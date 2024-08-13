\version "2.20.0"

global = {
  \time 12/8
  %\key c \major
  \tempo 4. =110
  \compressFullBarRests % compress rest bars
}

% ***** Piano *****
piano_intro = \relative c'' {
  \key d \major
  %R1. * 4
  b'4.-^\f a-^ gis-^ fis-^ | e-^ d-^ cis-^ b-^ |
  a'-^ g-^ fis-^ e-^ | d1. |
  \key c \major
}

piano_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  %% Ecriture avec reprises
  % \repeat "percent" 2 {
%     <e, a c e>4. <e a c e> <e a c e> <e a c e> |
%     <d fis a d fis>4. <d fis a d fis> <d fis a d fis> <d fis a d fis> |
%     <g, d' g b f'>4. <g d' g b f'> <g d' g b f'> <g d' g b f'> |
%     <c e g c e >4. <c e g c e > <c e g c e > <c e g c e > |
%   }
  <e, a c e>4. <e a c e> <e a c e> <e a c e> |
  <d fis a d fis>4. <d fis a d fis> <d fis a d fis> <d fis a d fis> |
  <g, d' g b f'>4. <g d' g b f'> <g d' g b f'> <g d' g b f'> |
  <c e g c e >4. <c e g c e > <c e g c e > <c e g c e > |
  
  <e a c e>4. <e a c e> <e a c e> <e a c e> |
  <d fis a d fis>4. <d fis a d fis> <d fis a d fis> <d fis a d fis> |
  <g, d' g b f'>4. <g d' g b f'> <g d' g b f'> <g d' g b f'> |
  <c e g c e >2.~ <c e g c e >4. r4. |
}

piano_interlude = \relative c'' {
  \mark \markup \center-column { \box "Post-Ch." }
  \key d \major
  <dis, a' b fis' >4.\mf < dis a' b fis' > < dis a' b fis'> < dis a' b fis'> |
  < b e gis d' e >4. < b e gis d' e > < b e gis d' e > < b e gis d' e> |
  < a' cis e >4. < e a cis g' > < e a cis fis > < e a cis e > | 
  < a, d a' fis' >2.~ < a d a' fis' >4. r4. |
  \key c \major
}

piano_verse = \relative c'' {
  \repeat "percent" 3 {
    <c, e g c e >4. <c e g c e > <b d g b g' > <b d g b g' > |
    <c e g c e >4. <c e g c e > < c f a c f > <c f a c f > |
  }
  \repeat "percent" 2 {
    <d g b d g>4.-^\f <d g b d g>-^ <d g b d g>-^ <d g b d g>-^ | 
  }
}

piano_verse_i = \relative c'' {
  \mark \markup \center-column { \box "Verse 1" }
  \piano_verse
}

piano_verse_ii = \relative c'' {
  \mark \markup \center-column { \box "Verse 2" }
  \piano_verse
}

piano_waltz = \relative c'' {
  \time 3/4 
  \key a \major
  \mark \markup \center-column { \box "Waltz" }
  \repeat "percent" 2 { r4\mp <b, fis' b dis fis>-. <b fis' b dis fis>-. | }
  \repeat "percent" 2 { r4 <b e gis b d e>-. <b e gis b d e>-. | }
  \repeat "percent" 2 { r4 <a e' a cis g'>-. <a e' a cis g'>-. | }
  \repeat "percent" 2 { r4 <d a' d fis>-. <d a' d fis>-. | }
  
  \repeat "percent" 2 { r4 <b fis' b dis fis>-. <b fis' b dis fis>-. | }
  \repeat "percent" 2 { r4 <b e gis b d e>-. <b e gis b d e>-. | }
  \repeat "percent" 2 { r4 <a e' a cis g'>-. <a e' a cis g'>-. | }
  \repeat "percent" 2 { r4 <d a' d fis>-. <d a' d fis>-. | }
  
  \repeat "percent" 2 { r4 <b fis' b dis fis>-. <b fis' b dis fis>-. | }
  \repeat "percent" 2 { r4 <b e gis b d e>-. <b e gis b d e>-. | }
  \repeat "percent" 2 { r4 <a e' a cis g'>-. <a e' a cis g'>-. | }
  \repeat "percent" 2 { r4 <d a' d fis>-. <d a' d fis>-. | }
  
  \repeat "percent" 2 { r4 <b fis' b dis fis>-. <b fis' b dis fis>-. | }
  \repeat "percent" 2 { r4 <b e gis b d e>-. <b e gis b d e>-. | }
  \repeat "percent" 2 { r4 <a e' a cis g'>-. <a e' a cis g'>-. | }
  \bar "||"
  \key c \major
  \time 12/8 <g d' g>4\f <g d' g>8 <g d' g>4 <g d' g>8 <g d' g>4 <g d' g b f'>8~ <g d' g b f'>4. \bar "||"
}

piano_verse_iii = \relative c'' {
  \mark \markup \center-column { \box "Verse 3" }
  \piano_verse
  % ^\segno
}

piano_last_chorus = \relative c'' {
  \mark \markup \center-column { \box Chorus }
  \repeat "percent" 2 {
    <e, a c e>4. <e a c e> <e a c e> <e a c e> |
    <d fis a d fis>4. <d fis a d fis> <d fis a d fis> <d fis a d fis> |
    <g, d' g b f'>4. <g d' g b f'> <g d' g b f'> <g d' g b f'> |
    <c e g c e >4. <c e g c e > <c e g c e > <c e g c e > |
  }
}



piano = \relative c'' {
  \voiceOne
  \global
  % Intro
  \piano_intro \bar "||" 
  % Verse 1 et 2
  \piano_verse_i  \bar "||" 
  \piano_verse \bar "||" 
  % Chorus
  \piano_chorus \bar "||"
  % Post chorus
  \normalsize
  \piano_interlude \bar "||"
  % Verse 3
  \piano_verse_ii
  % Chorus
  \piano_chorus \bar "||"
  \piano_waltz
  % Verse 4
  \piano_verse_iii
  % Chorus
  \repeat "volta" 2 {
  \piano_last_chorus
  }  
}

%trackAchannelA = \relative{}
trackAchannelB = \piano
trackAchannelBvoiceB = \relative c'' {
  \voiceTwo
  \global
  < a b fis' >4. < a b fis' > < dis, a' b > < dis a' b > |
  < b e gis >4. < b e gis > < b e gis > < b e gis > |
  < a' cis e >4. < e a cis > < e a cis > < e a cis > | 
  < a, d a' fis' >1.
}

\include "love-is-all_bass.ly"

trackBchannelA = \bass
trackBchannelB = \relative{}
trackBchannelBvoiceB = \relative{}

\book{
  \bookOutputSuffix "Piano"
  \header {
      title = \markup { \fontsize #3 \bold "Love Is All"}
      composer = \markup {
        \column{
          \line{\center-align \fontsize #-2 {"Words and Music by"} }
          \line{\center-align \fontsize #0 "Roger Glover"}
        }
      }
      subtitle = ""
      instrument = "Piano"
      % opus = "Op. 9"
      copyright= \markup { "Arthur Petit - Copyright 2023" \char ##x00A9 }
      tagline=##f
    }
  \score {
    <<
      \chords {
        %\accords                
      }
      \new PianoStaff <<
        \new Staff = "up" {
          %\context Voice = voiceA \transpose c aes, {\trackAchannelA}
          << 
            {\context Voice = voiceB \transpose c aes, {\trackAchannelB}}
            \\
            {\context Voice = voiceC \transpose c aes, {\trackAchannelBvoiceB}}
          >>
        }
        \new Staff = "down" {
          \clef bass
          \context Voice = voiceA \transpose c aes, {\trackBchannelA}
          <<
            {\context Voice = voiceB \transpose c aes, {\trackBchannelB}}
            \\
            {\context Voice = voiceC \transpose c aes, {\trackBchannelBvoiceB}}
          >>
        }
      >>
% \new PianoStaff <<
%         \new Staff = "up" {
%           %\context Voice = voiceA \trackAchannelA
%           << 
%             {\context Voice = voiceB \trackAchannelB}
%             \\
%             {\context Voice = voiceC \trackAchannelBvoiceB}
%           >>
%         }
%         \new Staff = "down" {
%           \clef bass
%           \context Voice = voiceA \trackBchannelA
%           <<
%             {\context Voice = voiceB \trackBchannelB}
%             \\
%             {\context Voice = voiceC \trackBchannelBvoiceB}
%           >>
%         }
%       >>
      
    >>
    \midi{ \tempo 4 = 100  } 
    \layout {} 
  }
}