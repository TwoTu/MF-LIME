function lapla = laplaPyramid(Img,level)
%分解成高斯金字塔
gau = cell(level,1);
N = 1;
gau{1} = Img;
h = fspecial('gaussian',5);
for N = 2:level
    temp = imfilter(gau{N-1},h,'conv','same','replicate');%高斯滤波
    gau{N} = temp(1:2:end,1:2:end,:);%下采样，隔行隔列采样
end

%由高斯金字塔做拉普拉斯金字塔
lapla = cell(level,1);
lapla{level} = gau{level};
h = fspecial('gaussian');
for i = level-1:-1:1
    t = imresize(gau{i+1},2,'bilinear'); %上采样，插值
    %t = imfilter(t,h,'conv','same','replicate');%高斯滤波
    t = t(1:size(gau{i},1),1:size(gau{i},2));%统一行列数
    lapla{i} =  gau{i} - t;
end