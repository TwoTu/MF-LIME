function [features] = featureExtractLIVE(k_range, img_dir)
%% Extract features from images in an directory
% 
feature_dim = 56;   % The number of dimensions of the feature
feature_num = length(k_range);

disp_num = 10;  % Verbose control

% Preallocate some space
features = zeros(feature_num, feature_dim);

disp(['Extracting features from ', img_dir])

% Note that the process is parallel accelerated
% Replace parfor with a common for to make the execution serial
n_threads = 4;
parfor (i = 1:feature_num, n_threads)
% for i = 1:feature_num
    img_path = [img_dir, 'img', num2str(i), '.bmp'];
    img=imread(img_path);
    features(i,:) = featureExtract56(img, 2);
    if mod(i,disp_num) == 0
%         disp('Extracting features...')
        disp(['Current num: ', num2str(i)])
    end
end

end
