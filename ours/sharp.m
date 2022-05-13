function [ result ] = sharp(image)

image = im2double(image);

GaussKernel = fspecial('gaussian', 5, 3);

imBlur = imfilter(image,GaussKernel);
unSharpMask = image - imBlur;
stretchIm = hisStretching(unSharpMask);

result = (image + stretchIm)/2;
end

