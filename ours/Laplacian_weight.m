function WL = Laplacian_weight(Img)
%������˹�Աȶ�Ȩ��

%��ȡ��ͨ��
h = rgb2hsv(Img);
l = double(h(:,:,3));
%������˹�˲�
w = [0,1,0;1,-4,1;0,1,0];
WL = imfilter(l,w,'replicate');