function [score, pred_class] = predict(feature, svrmodel, svcmodel)
%% Predict scores
n_dis = length(svrmodel);
[pred_class, acc, p] = svmpredict(ones(1,1), feature, svcmodel,'-b 1 -q');
q=zeros(1,n_dis);
for j=1:n_dis
    [q(:,j), reg_acc, dec] = svmpredict(ones(1,1), feature, svrmodel{j}, '-q');
end
score = sum(p.*q , 2);
end

