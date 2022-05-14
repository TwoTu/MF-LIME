function WL = Laplacian_weight(Img)
%拉普拉斯对比度权重

%提取亮通道
h = rgb2hsv(Img);
l = double(h(:,:,3));
%拉普拉斯滤波
w = [0,1,0;1,-4,1;0,1,0];
WL = imfilter(l,w,'replicate');