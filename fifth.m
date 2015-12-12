clear
%Generate Notes For Bethoveen's 5th @ 440Hz 
notecreate = @(frq,dur) sin(2*pi* [0:dur]/8192 * (440*2.^((frq-1)/12)));
notename = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'};
rest = sin(2*pi*0*(0:0.000125:0.03));
%Generating Beethoven's 5th 
song = {'G' 'G' 'G' 'E' 'F' 'F' 'F' 'D' 'G' 'G' 'G' 'E' 'A' 'A'};
for k1 = 1:length(song)
    idx = strcmp(song(k1), notename);
    songidx(k1) = find(idx);    
end    
dur = 0.3*9000;
songnote = [];
for k1 = 1:length(songidx)
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];
end
%For Sound Debugging 
%sound(songnote)
%Writing Sound To .Wav File
wavwrite(songnote,'5th.wav')
%plot sound 
%Adding Gausian Noise 
noisySound = songnote + 0.01 * randn(length(songnote),1)
wavwrite(noisySound,'noise-5th.wav');
%plot withnoise 
%Filter Noise 
clear 
[f,fs] = wavread('noise-5th.wav');
audios=audioplayer(f,fs);
%Design a bandpass filter that filters out between 700 to 12000 Hz
n = 1;
beginFreq = 200 / (fs/2);
endFreq = 220 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
filterOut = filter(b, a, f);
wavwrite(filterOut, fs,'denoised.wav');