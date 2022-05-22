clear all

for n=-11:9
  [nf1_num nf1_den nf1_res] = ballsfg('f', n);
  [nf2_num nf2_den nf2_res] = ballsfg('f', -(n+2));  
  [ng1_num ng1_den ng1_res] = ballsfg('g', n);
  [ng2_num ng2_den ng2_res] = ballsfg('g', -(n+2)); 
  
  str=sprintf('n=%d, |f_num|=%d, |f_den|=%d, f=%f, |g_num|=%d, |g_den|=%d, g=%f', n, nf1_num, nf1_den, nf1_res, ng1_num, ng1_den, ng1_res);
  disp(str);

  %if mod(n,2) % n is odd
  %  f_prod = sign*nf1_res*nf2_res;
  %  g_prod = sign*ng1_res*ng2_res;
  %  str=sprintf('n=%d, f_prod=%d, g_prod=%d', n, f_prod, g_prod)    
  %end
end