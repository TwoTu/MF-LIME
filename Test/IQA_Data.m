clear;

addpath('Dataset','IQA');
str = 'Dataset\Fusion\';
for i = 1:1:16
    % 读入数据集的图片
    
    f = imread([str,num2str(i),'.jpg']);
    % 计算增强后的图片
    Dong = dong(f);
    Fu = multi_fusion(f);
    Guo = lime(f);
    Ying = ying(f);
    Ours = our(f);
    
    %将每张图片的指标存入数组中
    result1(i) = brisque(Dong);
    result2(i) = brisque(Fu);
    result3(i) = brisque(Guo);
    result4(i) = brisque(Ying);
    result5(i) = brisque(Ours);
    
    result6(i) = ceiq(Dong);
    result7(i) = ceiq(Fu);
    result8(i) = ceiq(Guo);
    result9(i) = ceiq(Ying);
    result10(i) = ceiq(Ours);
    
    result11(i) = eniqa(Dong);
    result12(i) = eniqa(Fu);
    result13(i) = eniqa(Guo);
    result14(i) = eniqa(Ying);
    result15(i) = eniqa(Ours);
    
    result16(i) = niqe(Dong);
    result17(i) = niqe(Fu);
    result18(i) = niqe(Guo);
    result19(i) = niqe(Ying);
    result20(i) = niqe(Ours);
    
    result21(i) = piqe(Dong);
    result22(i) = piqe(Fu);
    result23(i) = piqe(Guo);
    result24(i) = piqe(Ying);
    result25(i) = piqe(Ours);
    
end
 
%计算每个数组的平均值，存入数组
brisque_avg = [mean(result1),mean(result2),mean(result3),mean(result4),mean(result5)];
ceiq_avg = [mean(result6),mean(result7),mean(result8),mean(result9),mean(result10)];
eniqa_avg = [mean(result11),mean(result12),mean(result13),mean(result14),mean(result15)];
niqe_avg = [mean(result16),mean(result17),mean(result18),mean(result19),mean(result20)];
piqe_avg = [mean(result21),mean(result22),mean(result23),mean(result24),mean(result25)];

% 将数组写入文件中
mat2txt(brisque_avg,'.\IQA_Data\Fusion_brisque.txt');
mat2txt(ceiq_avg,'.\IQA_Data\Fusion_ceiq.txt');
mat2txt(eniqa_avg,'.\IQA_Data\Fusion_eniqa.txt');
mat2txt(niqe_avg,'.\IQA_Data\Fusion_niqe.txt');
mat2txt(piqe_avg,'.\IQA_Data\Fusion_piqe.txt');
 
% 把矩阵 matrix 保存成任意后缀的文件
% 转换成 .txt 举例：mat2txt( data, 'filename.txt');
function back = mat2txt(matrix,file_Name) 
fop = fopen( file_Name, 'wt' );
[M,N] = size(matrix);
for m = 1:M
    for n = 1:N
        fprintf( fop, ' %s', mat2str( matrix(m,n) ) );
        fprintf(fop, '\n' );
    end
    fprintf(fop, '\n' );
end
back = fclose( fop ) ;
end
