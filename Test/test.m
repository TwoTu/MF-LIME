close all;
clear;

img = imread('images\3.jpg');
% figure,imshow(img),title('原始图像');
% figure,imhist(img),title('原始图像直方图');
CEIQ = ceiq(img);
ENIQA = eniqa(img);
Brisque = brisque(img);

Dong = dong(img);
% figure,imhist(Dong),title('Dong等人结果直方图');
Dong_CEIQ = ceiq(Dong);
Dong_ENIQA = eniqa(Dong);
Dong_brisque = brisque(Dong);

Fu = multi_fusion(img);
figure,imshow(Fu),title("Fu等人的结果");
% figure,imhist(Fu),title('Fu等人结果直方图');
Fu_CEIQ = ceiq(Fu);
Fu_ENIQA = eniqa(Fu);
Fu_brisque = brisque(Fu);

Guo = lime(img);
% figure,imhist(Guo),title('Guo等人结果直方图');
Guo_CEIQ = ceiq(Guo);
Guo_ENIQA = eniqa(Guo);
Guo_brisque = brisque(Guo);

Ying = ying(img);
% figure,imhist(Ying),title('Ying等人结果直方图');
Ying_CEIQ = ceiq(Ying);
Ying_ENIQA = eniqa(Ying);
Ying_brisque = brisque(Ying);

ours = our(img);
% figure,imhist(ours),title('our结果直方图');
ours_CEIQ = ceiq(ours);
ours_ENIQA = eniqa(ours);
ours_brisque = brisque(ours);

% figure,imshow([Dong,Fu,Guo,Ying,ours]),
% title('Dong         Fu            Guo           Ying           Our');