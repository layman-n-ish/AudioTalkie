function x_recv = remove_header(x_recv_w_header, symbol, rep)

    for i = 1:rep,
        corr = x_recv_w_header(((i-1)*8)+1:((i-1)*8)+8) * symbol';
        if (corr < 6)
            x_recv = x_recv_w_header(((i-1)*8)+1:end);
            break;
        endif;
    endfor;

endfunction;