function [y, offset] = sync_recv_bits(y_w_offset, mod_symbol)

    l = length(mod_symbol);
    corr = zeros(1, l);

    for i = 1:l;
        corr(i) = y_w_offset(i:l+i-1) * mod_symbol';
    endfor;

    [x, ix] = max(corr);

    offset = ix;
    y = y_w_offset(offset:end);

endfunction;