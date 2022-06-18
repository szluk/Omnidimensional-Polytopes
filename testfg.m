clear all

% display fn and gn
for n=-11:9
  [nf1_num nf1_den nf1_res] = ballsfg(n, 'f');
  [nf2_num nf2_den nf2_res] = ballsfg(-(n+2), 'f');  
  [ng1_num ng1_den ng1_res] = ballsfg(n, 'g');
  [ng2_num ng2_den ng2_res] = ballsfg(-(n+2), 'g'); 
  
  str=sprintf('n=%d, |f_num|=%d, |f_den|=%d, f=%f, |g_num|=%d, |g_den|=%d, g=%f', n, nf1_num, nf1_den, nf1_res, ng1_num, ng1_den, ng1_res);
  disp(str);
end

return

% check products in even dimensions
for n=-9:2:9
  %if mod(n,2) % n is odd
    [nf1_num nf1_den nf1_res] = ballsfg(n, 'f');
    [nf2_num nf2_den nf2_res] = ballsfg(-(n+2), 'f');  
    [ng1_num ng1_den ng1_res] = ballsfg(n, 'g');
    [ng2_num ng2_den ng2_res] = ballsfg(-(n+2), 'g'); 

    f_prod = nf1_res*nf2_res;
    g_prod = ng1_res*ng2_res;
    str=sprintf('n=%d, f_prod=%d, g_prod=%d', n, f_prod, g_prod);
    disp(str);    
end

% check fn/gn=2n in positive and negative odd dimensions
for n=-10:10
  [nn dn fn] = ballsfg(n, 'f');
  [nn dn gn] = ballsfg(n, 'g');    

  go = true;
  if n<0 & ~mod(n,2) % n is negative and even
    go = false;
  end

  if go
    fg=fn/gn;
    n2=2^n;
    str=sprintf('n=%d, fn/gn=%d, 2^n=%d', n, fg, n2);
    disp(str);    
  end
end
