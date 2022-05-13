close all;
clear;

addpath('ours','IQA');

Img = imread('.\images\3.jpg');
% figure,imshow(Img),title('原始图像');
figure,subplot(221),imshow(Img),title("原始图像");


fusion = our(Img);
subplot(224),imshow(fusion),title("最终输出图像");
% figure,imshow(fusion),title('最终输出图像');

%图像质量评价
% Brisque = brisque(fusion);   %越小越好
% CEIQ = ceiq(fusion);         %越大越好
% ENIQA = eniqa(fusion);       %越小越好





