function reconMsgArr = recv(y, l, f0, f1, Fs, bitDur, coder)

t = 0:(1/Fs):bitDur-(1/Fs);
x_0 = sin(2*pi*f0*t);
x_1 = sin(2*pi*f1*t);

recon_y = reshape(y, bitDur*Fs, l*4*coder)';
y_demod_0 = recon_y * x_0';
y_demod_1 = recon_y * x_1';

y_demod = (y_demod_1 > y_demod_0);
des = reshape(y_demod, coder, l*4)';

bitc = mode(des, 2); 

reconMsgArr = reshape(bitc, 4, l)'
%reconMsgArr = bi2de(msg)