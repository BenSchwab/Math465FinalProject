function [ X ] = twoBlobs(n, k, d)

ballTwoCenter= zeros(d,n);
ballTwoCenter(1,:) = 2*ones(1,n);

ballOne = transpose(GenerateBall(n,k,d));
ballTwo = transpose(GenerateBall(n,k,d)) + ballTwoCenter;

X = horzcat(ballOne, ballTwo);
end