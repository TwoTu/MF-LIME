close all;
clear;

addpath('ours','IQA');

Img = imread('.\images\3.jpg');
% figure,imshow(Img),title('ԭʼͼ��');
figure,subplot(221),imshow(Img),title("ԭʼͼ��");


fusion = our(Img);
subplot(224),imshow(fusion),title("�������ͼ��");
% figure,imshow(fusion),title('�������ͼ��');

%ͼ����������
% Brisque = brisque(fusion);   %ԽСԽ��
% CEIQ = ceiq(fusion);         %Խ��Խ��
% ENIQA = eniqa(fusion);       %ԽСԽ��





