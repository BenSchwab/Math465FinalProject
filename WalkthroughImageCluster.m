function [ ] = WalkthroughImageCluster( ImageSet )
%WALKTHROUGHIMAGECLUSTER Summary of this function goes here
%   Detailed explanation goes here

for i = 1:length(ImageSet)
    imshow(reshape(ImageSet(:,i),28,28));
    pause
end



end

