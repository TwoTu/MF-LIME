function LOE = loe(I,Ie)
% Naturalness Preserved Enhancement Algorithm for Non-Uniform Illumination Images 
% ##@article{wang2013naturalness,
% ##  title={Naturalness preserved enhancement algorithm for non-uniform illumination images},
% ##  author={Wang, Shuhang and Zheng, Jin and Hu, Hai-Miao and Li, Bo},
% ##  journal={IEEE Transactions on Image Processing},
% ##  volume={22},
% ##  number={9},
% ##  pages={3538--3548},
% ##  year={2013},
% ##  publisher={IEEE}
% ##} 

[N, M, n] = size (I);
 
L = max(I,[],3);
Le = max(Ie,[],3);

r = 50 / min (M,N);
Md = round(M*r);
Nd = round(N*r);
Ld =imresize(L,[Nd Md]);
Led =imresize(Le,[Nd Md]);
 
RD = zeros (Nd,Md);
size (RD);
 
for y = 1:Md
    for x = 1:Nd
 
        E = xor((Ld(x,y)>=Ld(:,:)),(Led(x,y)>=Led(:,:)));
        RD(x,y) = sum(E(:));
 
    end
end

LOE = sum(RD(:))/(Md*Nd);
 
end