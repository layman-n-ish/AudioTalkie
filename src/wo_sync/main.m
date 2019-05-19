msgArr = [2 3 2 3];
Fs = 8000;
f0 = 1000;
f1 = 2000;
bitDur = 250/1000;
coder = 5;
record_len = length(msgArr) * 4 * coder * bitDur;
t = 0:(1/Fs):bitDur-(1/Fs);

% x = trans(msgArr, f0, f1, Fs, bitDur, coder);

% player = audioplayer(x, Fs);
% play(player);

% recorder = audiorecorder(Fs, 16, 1);
% recordblocking(recorder, record_len); 

% y = getaudiodata(recorder);
% audiowrite('500_5_2323.wav', y, Fs);

[y, Fs] = audioread('250_5_2323.wav');

reconMsgArr = recv(y, length(msgArr), f0, f1, Fs, bitDur, coder);
