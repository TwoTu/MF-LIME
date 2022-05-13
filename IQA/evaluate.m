function [SROCC, PLCC, RMSE] = evaluate(y_test, score)
% Calculate coefficients and errors

    [logistic, bayta, ehat, J] = logisFit(y_test, score);
    [ypre , ~] = nlpredci(logistic,score',bayta,ehat,J);

    SROCC = abs(corr( y_test, score, 'type', 'spearman'));
    PLCC = corr(y_test, ypre, 'type','Pearson');    % pearson linear coefficient
    RMSE = sqrt(mean((ypre - y_test).^2));   %root meas squared error
    
end

