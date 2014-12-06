function [X_train,Y_train, X_test,Y_test ] = one_seven(n)
    num_map = num_index;
    ones = num_map(2, 1:2*n);
    sevens = num_map(8, 1:2*n);
    load('TrainImages');
    [n_images, x,y] = size(TrainImages);
    
    in = zeros(x*y, 2*n);
    out = zeros(2*n, 1);
    for i = [1:n]
        in(:, i) = reshape(TrainImages(ones(i),:,:), x*y,1);
        out(i) = 1;
        in(:, n + i) = reshape(TrainImages(sevens(i),:,:), x*y,1);
        out(n+i) = 7;
    end
    
    in_test = zeros(x*y, 2*n);
    out_test = zeros(2*n, 1);
    for i = [n+1:2*n]
        in_test(:, i-n) = reshape(TrainImages(ones(i),:,:), x*y,1);
        out_test(i-n) = 1;
        in_test(:, i) = reshape(TrainImages(sevens(i),:,:), x*y,1);
        out_test(i) = 7;
    end
    X_train = in;
    Y_train = out';
    X_test = in_test;
    Y_test = out_test';
end