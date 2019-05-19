l = 4;
Fs = 8000;
f0 = 1000;
f1 = 2000;
bitDur = 250/1000;
coder = 5;
header_rep = 5;

% [x, symbol] = trans(msgArr, f0, f1, Fs, bitDur, coder, header_rep);

% player = audioplayer(x, Fs);
% play(player);

record_len = ((l*4*coder) + (length(symbol)*header_rep)) * bitDur;
recorder = audiorecorder(Fs, 16, 1);
recordblocking(recorder, record_len); 

y = getaudiodata(recorder);
audiowrite('250_5_5_2323_sync.wav', y, Fs);

% [y, Fs] = audioread('250_5_5_2323.wav');

reconMsgArr = recv(y, l, f0, f1, Fs, bitDur, coder, symbol, header_rep);
