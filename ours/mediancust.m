function K=mediancust(J)   %Function for median filter
%Define the window of size M*N
M=3;
N=3;


% Padding the matrix I with zeroes on all sides for filtering on border pix

newA=padarray(J,[floor(M/2),floor(N/2)]);

K = zeros([size(J,1) size(J,2)]);

for i = 1:size(newA,1)-(M-1)
    for j = 1:size(newA,2)-(N-1)
       
       
        temp = newA(i:i+(M-1),j:j+(N-1),:);
        %Red,Green and Blue Channels are traversed Separately
        for k = 1:3

          tmp = temp(:,:,k);
          K(i,j,k) = median(tmp(:));

        end
      
       
    end
end
% convert the matrix into uint8 format
K = uint8(K);
end