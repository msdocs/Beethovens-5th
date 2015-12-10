clear
notecreate = @(frq,dur) sin(2*pi* [0:dur]/8192 * (220*2.^((frq-1)/12)));
notename = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'};
'Z'== sin(2*pi*0*(0:0.000125:0.5));%pause
%l1 = {'G' 'G' 'G' 'E'};
song = { 'G' 'G' 'G' 'E'};
% =[l1 ,l2];
for k1 = 1:length(song)
    idx = strcmp(song(k1), notename);
    songidx(k1) = find(idx);
end    
dur = 0.3*9000;
songnote = [];
for k1 = 1:length(songidx)
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];
    
end
sound(songnote)

