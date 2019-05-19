function [x_w_header, encoded_symbol] = add_header(x, rep)
    
    symbol = [14, 15]; % E F
    encoded_symbol = encode_msg(symbol);
    encoded_symbol = reshape(encoded_symbol', 1, numel(encoded_symbol));
    header = repmat(encoded_symbol, 1, rep);

    x_w_header = [header, x];

endfunction;