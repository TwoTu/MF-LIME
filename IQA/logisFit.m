function [logistic, bayta, ehat, J] = logisFit(y_test, score)
    beta(1) = max(y_test);
    beta(2) = min(y_test);
    beta(3) = mean(score);
    beta(4) = 0.1;
    beta(5) = 0.1;
    logistic = @(beta,x)(beta(1)*(1/2-1./(1+exp(beta(2)*(x-beta(3)))))+beta(4)*x+beta(5));
    [bayta, ehat,J] = nlinfit(score,y_test,logistic,beta);
end

