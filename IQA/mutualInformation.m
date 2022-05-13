function [D,F,L]=mutualInformation(A)
%% The code might look a little redundant but it works fairly well
R=A(:,:,1); 
G=A(:,:,2); 
B=A(:,:,3); 
HR=entropy(R);
HG=entropy(G);
HB=entropy(B);

R = double(R);
G = double(G);
B = double(B);

mn = prod(size(R));     
p = getCounts(R(:),G(:))./mn;
en = sum(p.*log2(p));
HRG = -en;  
D = HR+HG-HRG;  

p = getCounts(R(:),B(:))./mn;
en = sum(p.*log2(p));
HRB = -en;  
F = HR+HB-HRB;  

p = getCounts(G(:),B(:))./mn;
en = sum(p.*log2(p));
HGB = -en;  
L = HG+HB-HGB;  
end
