function [X, Y] = denseAndSparseBlobs(n, dim)

    sigmaOne = 0.2;
    ballOne = normrnd(0, sigmaOne, dim, 1000);

    distance = 1; %distance between centers of the two clusters with high 
    % variance on large cluster 
    % from epirical study - changing this does not affect acurracy i.e.
    % making closer does not help
    
    sigmaTwo = 1;
    
    twoCenter = zeros([dim, 1]);
    twoCenter(1) = distance;
    ballTwo = normrnd(0, sigmaTwo, dim, 1000);
    for i = 1:1000
        ballTwo(:,i) = ballTwo(:,i) + twoCenter;
    end

    X = horzcat(ballOne, ballTwo);
    ballOneLabels = ones([1, n]);
    ballTwoLabels = zeros([1, n]);
    Y = horzcat(ballOneLabels, ballTwoLabels);

end