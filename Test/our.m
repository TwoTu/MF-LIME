function fusion = our(Img)

%��ͼ�������
input1 = sharp(Img);

%��ͼ��������ȵ���
input2 = lumina_adjust(Img);

%�񻯺�gamma�任���ͼ�������Ȩ��
w = Laplacian_weight(input1);
ws = saliency_detection(input1);
wsa = Saturation_weight(input1);
w2 = Laplacian_weight(input2);
ws2 = saliency_detection(input2);
wsa2 = Saturation_weight(input2);
%������Ȩ�طֱ���й�һ��
weight1 = (w+ws+wsa+0.1)./(w+ws+wsa+w2+ws2+wsa2+0.2);
weight2 = (w2+ws2+wsa2+0.1)./(w+ws+wsa+w2+ws2+wsa2+0.2);

%����һ��Ȩ��ͼ�ֽ�ɸ�˹�����������񻯺�gamma�任���ͼ��ֽ��������˹������
n = 10;
g1 = gaussianPyramid(weight1,n);
g2 = gaussianPyramid(weight2,n);
l1 = laplaPyramid(input1,n);
l2 = laplaPyramid(input2,n);

%��Ȩ�ظ�˹��������������˹�����������ںϳ��µĽ�����
r = cell(n,1);
for i = 1:n
    r{i} = g1{i}.*im2double(l1{i}) + g2{i}.*im2double(l2{i});
end
%���µĽ����������ں�
for i = n:-1:2
    t = imresize(r{i},2,'bilinear'); %��ֵ
    t = t(1:size(r{i-1},1),1:size(r{i-1},2));%������������ͳһ
    r{i-1} = t + r{i-1}; 
end
fusion = r{1};

%��������ɵ�ͼ��ת����ԭͼ���ʽ
c = class(Img);
switch c
case 'uint8'
   fusion = im2uint8(fusion);
case 'uint16'
   fusion = im2uint16(fusion);
case 'double'
   fusion = im2double(fusion);
otherwise
   error('ͼ�������䲻֧�ֵ���������');
end

figure,imshow(fusion),title('our�ķ�������Ľ��');

end



