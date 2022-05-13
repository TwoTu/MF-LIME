function g = gaussianPyramid(Img,level)
%高斯金字塔
%参数：Img: 待处理图像，level:金字塔层数
g = cell(level,1);
N = 1;
g{N} = Img;
h = fspecial('gaussian',5);
for N = 2:level
    temp = imfilter(g{N-1},h,'conv','same','replicate');%高斯滤波
    g{N} = temp(1:2:end,1:2:end,:);%下采样，隔行隔列采样
end