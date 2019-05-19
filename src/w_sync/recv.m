function reconMsgArr = recv(y_w_offset, l, f0, f1, Fs, bitDur, coder, symbol, rep)

t = 0:(1/Fs):bitDur-(1/Fs);
x_0 = sin(2*pi*f0*t);
x_1 = sin(2*pi*f1*t);
mod_symbol = (symbol' * x_1) + (~symbol' * x_0);
mod_symbol = reshape(mod_symbol', 1, numel(mod_symbol));

[y, offset] = sync_recv_bits(y_w_offset', mod_symbol);
offset

extra = zeros(1, (Fs*bitDur*ceil(size(y)(2)/(Fs*bitDur)))-size(y)(2));

y = [extra, y];
y = reshape(y, Fs*bitDur, ceil(size(y)(2)/(Fs*bitDur)));
 
recon_y = reshape(y', bitDur*Fs, (l*4*coder) + (length(symbol)*rep))';
y_demod_0 = recon_y * x_0';
y_demod_1 = recon_y * x_1';

y_demod = (y_demod_1 > y_demod_0)
y_wo_header = remove_header(y_demod, symbol, rep)
des = reshape(y_wo_header, coder, l*4)';

bitc = mode(des, 2); 

reconMsgArr = reshape(bitc, 4, l)'
%reconMsgArr = bi2de(msg)