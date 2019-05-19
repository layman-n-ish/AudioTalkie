function encoded_x = encode_msg(x)

    l = length(x);

    encoded_x = zeros(l, 4);
    for i = 1:length(x),
        for j = 1:4,
            encoded_x(i, j) = mod(x(i), 2);
            x(i) = floor(x(i)/2); 
        end;
    end;

    encoded_x = fliplr(encoded_x);

endfunction;