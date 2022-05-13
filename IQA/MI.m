function [D]=MI(A,B)
HA=entropy(im2double(A));
HB=entropy(im2double(B));
    
a = double(A(:));
b = double(B(:));
p = getCounts(a,b)./prod(size(A));
en = sum(p.*log2(p));
HAB = -en;  
D = HA+HB-HAB;  
end
