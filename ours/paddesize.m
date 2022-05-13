function PQ = paddesize(AB,CD,~)
if nargin==1
    PQ = 2*AB;
elseif nagin==2 && ~ischar(CD)
    PQ = AB + CD - 1;
    PQ = 2*ceil(PQ/2);
elseif nargin==2
    m = max(AB);
    P = 2^nextpow2(2*m);
    PQ = [P P];
elseif nargin==3
    m = max([AB CD]);
    P = 2^nextpow2(2*m);
    PQ = [P P];
else
    error('wrong');
end