function SaliencyMap = saliencyMap(inImg)

inImg = im2double(inImg);
%% Spectral Residual
myFFT = fft2(inImg);
myFFT(myFFT==0) = eps;
myLogAmplitude = log(abs(myFFT));
myPhase = angle(myFFT);
mySpectralResidual = myLogAmplitude - imfilter(myLogAmplitude, fspecial('average', 3), 'replicate');
SaliencyMap = abs(ifft2(exp(mySpectralResidual + 1j*myPhase))).^2;

%% After Effect
SaliencyMap = imfilter(SaliencyMap, fspecial('gaussian', [10, 10], 2.5));
% SlMap = sum(sum(SaliencyMap));

