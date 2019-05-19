function [modMsg, symbol] = trans(msgArr, f0, f1, Fs, bitDur, coder, rep)

    l = length(msgArr);
    t = 0:(1/Fs):bitDur-(1/Fs);
    x_0 = sin(2*pi*f0*t);
    x_1 = sin(2*pi*f1*t);

    encodedMsg = encode_msg(msgArr);
    
    flatEncMsg = reshape(encodedMsg', numel(encodedMsg), 1);
   
    bitstream = repelems(flatEncMsg, [1:length(flatEncMsg); coder*ones(1, length(flatEncMsg))]);

    [bitstream_w_header, symbol] = add_header(bitstream, rep);

    modMsg = (bitstream_w_header' * x_1) + (~bitstream_w_header' * x_0);
    modMsg = reshape(modMsg', numel(modMsg), 1);

end
