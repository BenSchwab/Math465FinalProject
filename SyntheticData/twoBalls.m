function [ X, Y ] = twoBlobs(n, k, d)

ballOne = transpose(GenerateBall(n,k,d));
ballOneLabels = zeros(1,n);

ballTwoCenter= zeros(d,n);
ballTwoCenter(1,:) = 2*ones(1,n);
ballTwo = transpose(GenerateBall(n,k,d)) + ballTwoCenter;
ballTwoLabels = ones(1,n);

X = horzcat(ballOne, ballTwo);
Y = horzcat(ballOneLabels, ballTwoLabels);

end