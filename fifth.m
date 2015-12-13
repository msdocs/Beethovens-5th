clear
%Generate Notes For Bethoveen's 5th @ 440Hz 
notecreate = @(frq,dur) sin(2*pi* [0:dur]/10000 * (220*2.^((frq-1)/12)));
notename = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'};
rest = sin(2*pi*0*(0:0.000125:0.03));
%Generating Beethoven's 5th 
song = {'G' 'G' 'G' 'D#' 'G' 'G' 'G' 'D#' 'F' 'F' 'F' 'D' 'G' 'G' 'G'};
%song={'G' 'G' 'G' 'D#'}
for k1 = 1:length(song)
    idx = strcmp(song(k1), notename);
    songidx(k1) = find(idx);    
end    
dur = 2000;
songnote = [];
for k1 = 1:length(songidx)
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];
end
k1
songnote
songidx
%For Sound Debugging 
%sound(songnote)
%Writing Sound To .Wav File
wavwrite(songnote,'5th.wav');
%plot sound 
%Graphing the signal in both frequency and time domains 
 
x = wavread('5th.wav');  %soundsc(x) 
N = length(songnote);               %number of samples 
fs = length(x);               %sampling rate 
ts = 1 / fs; 
 
tmax = (N-1)*ts; 
time = 0:ts:tmax;        %x-axis of the plot in the time domain 
figure(1)
plot(time,x);
xlabel('Time in Seconds (s)');
ylabel('Amplitude');
 
f = -fs/2:fs/(N-1):fs/2; %x-axis of the plot in the frequency domain 
z = fftshift(fft(x));    %Reverse Fourier Transform of the signal 
figure(2)
plot(f,abs(z));
xlabel('Frequency in Hertz (Hz)');
ylabel('Amplitude');

%Adding Gausian Noise 
noisySound = songnote + 0.05 * randn(length(songnote),1);
wavwrite(noisySound,'noise-5th.wav');
sound(noisySound)
% Gauss noise plot 
T = 1/fs;                 % Sample time 
L = length(noisySound);     % Length of signal 
t = (0:L-1)*T;            % Time vector 
figure(1);
plot(t,noisySound) 
title('Added Random Noise'); 
xlabel('Time in Seconds');    
ylabel('Amplitude'); 
                        
NFFT = 2^nextpow2(L);     % Next power of 2 from length of y 
z = fftshift(fft(x));     % Reverse fourier transform
f = -fs/2:fs/(N-1):fs/2;
figure(2);
plot(f,z)
title('Added Random Noise');
xlabel('Frequency in Hz');
ylabel('Amplitude');

%Filter Noise 
clear 
[f,fs] = wavread('noise-5th.wav');
audios=audioplayer(f,fs);
%Design a bandpass filter that filters out between 200 to 12000 Hz
n = 1;
beginFreq = 220 / (fs/2);
endFreq = 440 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
filterOut = filter(b, a, f);
wavwrite(filterOut, fs,'denoised.wav');
sound(filterOut, fs);
