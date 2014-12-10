function [ X, Y ] = twoBalls(n, k, d, Opts)

    ballOne = transpose(GenerateBall(n,k,d));
    ballOneLabels = zeros(1,n);

    ballTwoCenter= zeros(d,n);
    if ~isfield(Opts,'clusterDistance')
        Opts.centerDistance = 2;
    end
    ballTwoCenter(1,:) = Opts.centerDistance.*ones(1,n);
    ballTwo = transpose(GenerateBall(n,k,d)) + ballTwoCenter;
    ballTwoLabels = ones(1,n);

    X = horzcat(ballOne, ballTwo);
    Y = horzcat(ballOneLabels, ballTwoLabels);

end