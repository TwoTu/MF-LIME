function fusion = our(Img)

%对图像进行锐化
input1 = sharp(Img);

%对图像进行亮度调整
input2 = lumina_adjust(Img);

%锐化和gamma变换后的图像的三个权重
w = Laplacian_weight(input1);
ws = saliency_detection(input1);
wsa = Saturation_weight(input1);
w2 = Laplacian_weight(input2);
ws2 = saliency_detection(input2);
wsa2 = Saturation_weight(input2);
%将两组权重分别进行归一化
weight1 = (w+ws+wsa+0.1)./(w+ws+wsa+w2+ws2+wsa2+0.2);
weight2 = (w2+ws2+wsa2+0.1)./(w+ws+wsa+w2+ws2+wsa2+0.2);

%将归一化权重图分解成高斯金字塔，将锐化和gamma变换后的图像分解成拉普拉斯金字塔
n = 10;
g1 = gaussianPyramid(weight1,n);
g2 = gaussianPyramid(weight2,n);
l1 = laplaPyramid(input1,n);
l2 = laplaPyramid(input2,n);

%将权重高斯金字塔和拉普拉斯金字塔进行融合成新的金字塔
r = cell(n,1);
for i = 1:n
    r{i} = g1{i}.*im2double(l1{i}) + g2{i}.*im2double(l2{i});
end
%将新的金字塔进行融合
for i = n:-1:2
    t = imresize(r{i},2,'bilinear'); %插值
    t = t(1:size(r{i-1},1),1:size(r{i-1},2));%对行列数进行统一
    r{i-1} = t + r{i-1}; 
end
fusion = r{1};

%将处理完成的图像转换成原图像格式
c = class(Img);
switch c
case 'uint8'
   fusion = im2uint8(fusion);
case 'uint16'
   fusion = im2uint16(fusion);
case 'double'
   fusion = im2double(fusion);
otherwise
   error('图像处理工具箱不支持的数据类型');
end

figure,imshow(fusion),title('our的方法处理的结果');

end



