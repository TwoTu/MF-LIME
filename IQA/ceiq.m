%==========================================================================
% J. Yan, J. Li, X. Fu, "No-Reference Quality Assessment of Contrast-Distorted Images using Contrast Enhancement"
% 
% Please try your own contrast distorted images with different levels.
% Larger predicted score means better contrast quality.
% This model was trained by all the images in CCID2104 database using
% LIBSVM.
%==========================================================================

function [predicted_score] = ceiq(Img)
    load('model.mat');
    feat = [];
    gImg = rgb2gray(Img);
    enhancedImg = histeq(gImg);
    [fmean, fmap] = ssim(gImg, enhancedImg);
    f1 = fmean; %image similarity, f1
 
    h1 = imhist(gImg, 128);
    h2 = imhist(enhancedImg, 128);
    h1 = h1 / (size(gImg, 1) * size(gImg, 2));
    h2 = h2 / (size(gImg, 1) * size(gImg, 2));
    goodones = h1 > 0 & h2 > 0;
    f2 = - sum(h1(goodones) .* log2(h1(goodones))); % f2, Eq. (3)
    f3 = - sum(h2(goodones) .* log2(h2(goodones))); %f3, Eq. (3)
    f4 = - sum(h1(goodones) .* log2(h2(goodones))); %f4, Eq. (4)
    f5 = - sum(h2(goodones) .* log2(h1(goodones))); %f5, Eq. (5)
 
    feat = [feat f1 f2 f3 f4 f5];
    predicted_score = svmpredict(1, feat, model);

end
