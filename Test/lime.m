function [I, T_ini,T_ref] = lime(L,para,post)
% A wrapper of LIME
% LIME: A Method for Low-light IMage Enhancement
%
% INPUTS
% para: parameter
% post: true if do post-processing (denoise)
% OUTPUTS
% I - result image
% -------------------------------------------------------------------------
% @article{guo2016lime,
%   title={LIME: A Method for Low-light IMage Enhancement},
%   author={Guo, Xiaojie},
%   journal={arXiv preprint arXiv:1605.05034},
%   year={2016}
% }
% -------------------------------------------------------------------------
%
% Zhenqiang Ying
% 2016-11-02

if nargin == 0
   I = imload(uigetimagefile); 
   [J, T_ini,T_ref] = lime(I);
   T = repmat(T_ref, [1 1 3]);
   ezFig I J I./(T.^0.6) I./(T.^0.8) T_ini T_ref
   clear I;
   return;
end

% Require LIME

if nargin < 2
    para.lambda = 0.15;
    para.sigma = 2;
    para.gamma = 0.8;
    if nargin < 3
       post = false; 
    end
end

if ~isfloat(L), Im = im2double(L); end

[I, T_ini,T_ref] = LIME(Im,para);

%将处理完成的图像转换成原图像格式
c = class(L);
switch c
case 'uint8'
   I = im2uint8(I);
case 'uint16'
   I = im2uint16(I);
case 'double'
   I = im2double(I);
otherwise
   error('图像处理工具箱不支持的数据类型');
end
figure;imshow(I);title('Guo等人的结果');

%% Post Processing
if post
    %addpath(genpath('+existingMethods\+LIME\BM3D'));
    %import filter.BM3D.*
    
    YUV = rgb2ycbcr(I);
    Y = YUV(:,:,1);
    
    Y_d = BM3D(Y);
    
    I_d = ycbcr2rgb(cat(3,Y_d,YUV(:,:,2:3)));
    I_f = (I).*repmat(T_ref,[1,1,3])+I_d.*repmat(1-T_ref,[1,1,3]);
    
%     figure(5);imshow(I_d);title('Denoised ');
%     figure(6);imshow(I_f);title('Recomposed');
    I = I_f;
end

end


%% DEMO
% clc;close all;clear all;addpath(genpath('./'));
% %%
% filename = '1.bmp';
% L = (im2double(imread(filename)));
% 
% post = true;
% 
% para.lambda = 0.15;
% para.sigma = 2;
% para.gamma = 0.8;
% tic
% [I, T_ini,T_ref] = LIME(L,para);
% toc
% 
% figure(1);imshow(L);title('Input');
% figure(2);imshow(I);title('LIME');
% figure(3);imshow(T_ini,[]);colormap hot;title('Initial T');
% figure(4);imshow(T_ref,[]);colormap hot;title('Refined T');
% %% Post Processing
% if post
% YUV = rgb2ycbcr(I);
% Y = YUV(:,:,1);
% 
% sigma_BM3D = 50;
% [~, Y_d] = BM3D(Y,Y,sigma_BM3D,'lc',0);
% 
% I_d = ycbcr2rgb(cat(3,Y_d,YUV(:,:,2:3)));
% I_f = (I).*repmat(T_ref,[1,1,3])+I_d.*repmat(1-T_ref,[1,1,3]);
% 
% figure(5);imshow(I_d);title('Denoised ');
% figure(6);imshow(I_f);title('Recomposed');
% end