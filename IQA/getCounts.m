function cnt = getCounts(x, y)
idx = round(x.*255+y);
uidx = unique(idx);
if isscalar(uidx)
    cnt = length(idx);
else
    cnt = hist(idx, uidx);
end
end

