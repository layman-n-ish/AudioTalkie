symbol = [14, 15]; % E F
encoded_symbol = encode_msg(symbol);
encoded_symbol = reshape(encoded_symbol', 1, numel(encoded_symbol));

digits = 0:9;
temp = repelems(digits, [1:length(digits); 20 * ones(1, length(digits))]);
temp(2:2:end) = 0;

attr = repelems(digits, [1:length(digits); 2 * ones(1, length(digits))]);
attr(1:2:end) = 0;
attr = repmat(attr, 1, 10);

all_msgs = temp + attr; 
all_msgs = reshape(all_msgs', 1, numel(all_msgs));
enc_all_msgs = encode_msg(all_msgs);
enc_all_msgs = reshape(enc_all_msgs', 1, numel(enc_all_msgs));

self = encoded_symbol * encoded_symbol' 
corr = zeros(1, 100);
j = 1;
for i = 1:8:800, 
    corr(j) = enc_all_msgs(i:i+8-1) * encoded_symbol';
    j++;
endfor;

corr
self








        


