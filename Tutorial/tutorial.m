clear; % remove all variables from current work space
% generate 1 s of music notes a, b, c#, d e f#, sampled at 8KHz.
a=sin(2*pi*440*(0:0.000125:1.0)); 
b=sin(2*pi*493.88*(0:0.000125:1.0)); 
cs=sin(2*pi*554.37*(0:0.000125:1.0)); d=sin(2*pi*587.33*(0:0.000125:1.0)); 
e=sin(2*pi*659.26*(0:0.000125:1.0)); fs=sin(2*pi*739.99*(0:0.000125:1.0));
%generate 3 lines of music by composing the notes together
line1=[a,a,e,e,fs,fs,e,e];
line2=[d,d,cs,cs,b,b,a,a];
line3=[e,e,d,d,cs,cs,b,b]; 
song=[line1,line2,line3,line3,line1,line2]; % generate the song
wavwrite(song,'twinkle-twinkle.wav'); % output the final music notes as a wave form