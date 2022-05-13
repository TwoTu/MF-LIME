function drawScatter(y_test, score, xl, yl, db)
figure;
plot(score,y_test,'+b');
hold on;

[logistic, bayta, ehat, J] = logisFit(y_test, score);
t = min(score):0.01:max(score);
[ypre, ~] = nlpredci(logistic,t,bayta,ehat,J);
p=plot(t,ypre);
set(p,'Color','black','LineWidth',2);
legend(['Images in ', db],'Curve fitted with logistic function', 'Location','SouthWest');
xlabel(xl);
ylabel(yl);
hold off;
end

