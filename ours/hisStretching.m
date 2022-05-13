function [ result ] = hisStretching( im )
%直方图拉伸（归一化）
im=im2double(im);
[M,N,~] = size(im);

r=im(:,:,1);
g=im(:,:,2);
b=im(:,:,3);

maxR=zeros(1,1);
maxG=zeros(1,1);
maxB=zeros(1,1);
minR=ones(1,1);
minG=ones(1,1);
minB=ones(1,1);

for i=1:M
    for j=1:N
        if(r(i,j) < minR(1,1))
            minR(1,1) = r(i,j);
        else
            maxR(1,1) = r(i,j);
        end
        
        if(g(i,j) < minG(1,1))
            minG(1,1) = g(i,j);
        else
            maxG(1,1) = g(i,j);
        end
        
        if(b(i,j)<minB(1,1))
            minB(1,1)=b(i,j);
        else
            maxB(1,1)=b(i,j);
        end
    end
end



for i=1:M
    for j=1:N
        r(i,j)=(r(i,j)-minR(1,1))/(maxR(1,1)-minR(1,1));
        g(i,j)=(g(i,j)-minG(1,1))/(maxG(1,1)-minG(1,1));
        b(i,j)=(b(i,j)-minB(1,1))/(maxB(1,1)-minB(1,1));
    end
end

result = cat(3, r, g, b);
end

