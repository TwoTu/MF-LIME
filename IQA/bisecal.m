function result = bisecal(blk, wsize)
blk = double(blk);

blk = reshape(blk, wsize);
blk_col = im2col(blk, [3,3], 'sliding');
blk_col = [blk_col(1:4, :); blk_col(6:9, :)];
y = round(sum(blk_col)/8);
x = blk(2:wsize(1)-1, 2:wsize(2)-1);
x = x(:)';
f = getCounts(x, y)./prod(wsize);

result=sum(-f.*log2(f));  
end