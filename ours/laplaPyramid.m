function lapla = laplaPyramid(Img,level)
%�ֽ�ɸ�˹������
gau = cell(level,1);
N = 1;
gau{1} = Img;
h = fspecial('gaussian',5);
for N = 2:level
    temp = imfilter(gau{N-1},h,'conv','same','replicate');%��˹�˲�
    gau{N} = temp(1:2:end,1:2:end,:);%�²��������и��в���
end

%�ɸ�˹��������������˹������
lapla = cell(level,1);
lapla{level} = gau{level};
h = fspecial('gaussian');
for i = level-1:-1:1
    t = imresize(gau{i+1},2,'bilinear'); %�ϲ�������ֵ
    %t = imfilter(t,h,'conv','same','replicate');%��˹�˲�
    t = t(1:size(gau{i},1),1:size(gau{i},2));%ͳһ������
    lapla{i} =  gau{i} - t;
end