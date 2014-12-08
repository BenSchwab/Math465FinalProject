
%% visual test for blobInSphere
colormap(cool)
[X, Y] = blobInSphere(1000, 1000, 2);
scatter(X(1,:), X(2,:), 4, Y);

%% visual test for twoBlobs
colormap(cool)
[X, Y] = twoBalls(1000,2,3);
scatter3(X(1,:), X(2,:), X(3,:), 4, Y);

%% visual test for doubleHelix
colormap(cool)
[X, Y] = doubleHelix(1000);
scatter3(X(1,:), X(2,:), X(3,:), 4, Y);

%% visual test for lineAndBlob
colormap(cool)
[X, Y] = lineAndBlob(1000, 1000);
scatter(X(1,:), X(2,:), 4, Y);

%% visual test for denseAndSparseBlobs
colormap(cool)
[X, Y] = lineAndBlob(1000, 3);
scatter(X(1,:), X(2,:), X(3, :));