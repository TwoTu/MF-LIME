function [f, t] = featureExtract56( imrgb ,scale)
    % Set @scale to extract features in different scales
    t=zeros(1, 12*scale);
    tt = zeros(1, 12);
    f=zeros(1,28*scale);
    fea=zeros(1, 16);
    imdist=rgb2gray(imrgb);

    minWaveLength = 2.4;
    sigmaOnf = 0.55;
    mult = 1.31;
    dThetaOnSigma = 1.10;  
    scaleFactorForLoG = 0.87;
    
    wsize = [8 8];
    
    for i=1:scale        
        imsa=saliencyMap(imdist);
        emat = im2col(imsa, wsize, 'distinct');
        emat = sum(emat);
        sort_t = sort(emat,'ascend');
        len = length(sort_t);
        tsort=sort_t(ceil(len*0.2):ceil(len*1));
        A=ismember(emat,tsort);
       
        t1=clock;
        femat=im2col(imdist, wsize, 'distinct');
        femat=femat(:,A);
        femat=arrayfun(@(i) bisecal(femat(:,i), wsize), 1:size(femat, 2));
        sort_t = sort(femat,'ascend');
        mu= mean(sort_t);
        ske=skewness(sort_t);
        f2=[ mu  ske];        
        tt(1)=etime(clock,t1);

        t1=clock;
        [f3, f4, f5]=mutualInformation(imrgb);
        tt(2)=etime(clock,t1);
        
        [rows,cols] = size(imdist);
        LGFilters = logGabors(rows,cols,minWaveLength/(scale^scaleFactorForLoG),sigmaOnf,mult,dThetaOnSigma);
        fftIm = fft2(imdist);
        
        imggabor={8,1};
        for scaleIndex = 1:2
            for oriIndex = 1:4
                    response = ifft2(LGFilters{scaleIndex,oriIndex}.*fftIm);
                    
                    t1=clock;
                    im=uint8(abs(response));
                    femat1=im2col(im, wsize, 'distinct');
                    femat1=femat1(:,A);
                    femat1=arrayfun(@(i) bisecal(femat1(:,i), wsize), 1:size(femat1, 2));

                    sort_t = sort(femat1,'ascend');
                    mu= mean(sort_t);
                    ske=skewness(sort_t);
                    fea2=[ mu ske];        
                    idx = ((scaleIndex-1)*4+oriIndex);
                    tt(2+idx) = etime(clock,t1);
                    imggabor{idx,1}=im;

                    idx = ((scaleIndex-1)*4+oriIndex)*2-1;
                    fea(idx:idx+1) = fea2;
            end
        end 
        
        t1=clock;
        imggaborscale{1,1}=imggabor{1,1}+imggabor{2,1}+imggabor{3,1}+imggabor{4,1};
        imggaborscale{2,1}=imggabor{5,1}+imggabor{6,1}+imggabor{7,1}+imggabor{8,1};
        f9=MI(imggaborscale{1,1},imggaborscale{2,1});
        tt(11) = etime(clock,t1);
        
        t1=clock;
        imggaborori{1,1}=imggabor{1,1}+imggabor{5,1};
        imggaborori{2,1}=imggabor{2,1}+imggabor{6,1};
        imggaborori{3,1}=imggabor{3,1}+imggabor{7,1};
        imggaborori{4,1}=imggabor{4,1}+imggabor{8,1};
        f10=MI(imggaborori{1,1},imggaborori{2,1});
        f11=MI(imggaborori{1,1},imggaborori{3,1});
        f12=MI(imggaborori{1,1},imggaborori{4,1});
        f13=MI(imggaborori{2,1},imggaborori{3,1});
        f14=MI(imggaborori{2,1},imggaborori{4,1});
        f15=MI(imggaborori{3,1},imggaborori{4,1});
        tt(12) = etime(clock,t1);
        
        % Note that the order of features in this vector is different from 
        % that in the paper
        f((i-1)*28+1:i*28)=[f2 f3 f4 f5 fea f9 f10 f11 f12 f13 f14 f15];
        t((i-1)*12+1:i*12) = tt;
        imdist = imresize(imdist,0.5);
        imrgb = imresize(imrgb,0.5); 
    end
end
