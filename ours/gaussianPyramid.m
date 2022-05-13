function g = gaussianPyramid(Img,level)
%��˹������
%������Img: ������ͼ��level:����������
g = cell(level,1);
N = 1;
g{N} = Img;
h = fspecial('gaussian',5);
for N = 2:level
    temp = imfilter(g{N-1},h,'conv','same','replicate');%��˹�˲�
    g{N} = temp(1:2:end,1:2:end,:);%�²��������и��в���
end