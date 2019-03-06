function tau_total = getTautotal(DN0,DN,d_d0,m)
[row,col] = size(DN);
DN0 = repmat(DN0,[row,col]);
tau_total = (log(DN0) - log(DN./d_d0))./m;
end