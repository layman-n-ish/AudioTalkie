function modMsg = trans(msgArr, f0, f1, Fs, bitDur, coder)

    l = length(msgArr);
    t = 0:(1/Fs):bitDur-(1/Fs);
    x_0 = sin(2*pi*f0*t);
    x_1 = sin(2*pi*f1*t);

    encodedMsg = zeros(l, 4);
    for i = 1:length(msgArr),
        for j = 1:4,
            encodedMsg(i, j) = mod(msgArr(i), 2);
            msgArr(i) = floor(msgArr(i)/2); 
        end
    end
    
    encodedMsg = fliplr(encodedMsg);
    flatEncMsg = reshape(encodedMsg', numel(encodedMsg), 1);
   
    bitstream = repelems(flatEncMsg, [1:length(flatEncMsg); coder*ones(1, length(flatEncMsg))])';

    modMsg = (bitstream * x_1) + (~bitstream * x_0);
    modMsg = reshape(modMsg', numel(modMsg), 1);

end
