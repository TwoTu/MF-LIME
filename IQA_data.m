clear;

addpath('ours','IQA');
str = '.\VV\';
for i = 1:1:22
   
    f = imread([str,num2str(i),'.jpg']);
    out = our(f);
    result1(i) = brisque(out);
    result2(i) = ceiq(out);
    result3(i) = eniqa(out);
    result4(i) = niqe(out);
    result5(i) = piqe(out);
end
 
avg_brisq = mean(result1);
avg_ceiq = mean(result2);
avg_eniqa = mean(result3);
avg_niqe = mean(result4);
avg_piqe = mean(result5);

% data = [avg_brisq,avg_ceiq,avg_eniqa,avg_niqe,avg_piqe];

% mat2txt(result,'.\data\our_eniqa.txt')
% % 把矩阵 matrix 保存成任意后缀的文件
% % 转换成 .txt 举例：mat2txt( data, 'filename.txt');
%  
% function back = mat2txt(matrix,file_Name) 
% fop = fopen( file_Name, 'wt' );
% [M,N] = size(matrix);
% for m = 1:M
%     for n = 1:N
%         fprintf( fop, ' %s', mat2str( matrix(m,n) ) );
%         fprintf(fop, '\n' );
%     end
%     fprintf(fop, '\n' );
% end
% back = fclose( fop ) ;
% end
