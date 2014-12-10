function [ X, Y ] = sparseBlobs(d, n, Opts)

    sigma = .6;
    distance = 2;
    
    blobOne = normrnd(0, sigma, d, n);
    
    twoCenter = zeros([d, 1]);
    twoCenter(1) = distance;
    blobTwo = normrnd(0, sigma, d, n);
    for i = 1:n
        blobTwo(:,i) = blobTwo(:,i) + twoCenter;
    end

    X = horzcat(blobOne, blobTwo);
    blobOneLabels = ones([1, n]);
    blobTwoLabels = zeros([1, n]);
    Y = horzcat(blobOneLabels, blobTwoLabels);
    
end
