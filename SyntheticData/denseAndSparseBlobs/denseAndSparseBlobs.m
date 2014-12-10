function [X, Y] = denseAndSparseBlobs(n, dim)

    sigmaOne = 0.2;
    blobOne = normrnd(0, sigmaOne, dim, n);

    distance = 1; %distance between centers of the two clusters with high 
    % variance on large cluster 
    % from epirical study - changing this does not affect acurracy i.e.
    % making closer does not help
    
    sigmaTwo = 1;
    
    twoCenter = zeros([dim, 1]);
    twoCenter(1) = distance;
    blobTwo = normrnd(0, sigmaTwo, dim, n);
    for i = 1:n
        blobTwo(:,i) = blobTwo(:,i) + twoCenter;
    end

    X = horzcat(blobOne, blobTwo);
    blobOneLabels = ones([1, n]);
    blobTwoLabels = zeros([1, n]);
    Y = horzcat(blobOneLabels, blobTwoLabels);

end