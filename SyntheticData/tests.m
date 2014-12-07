%% unit test for ballInSphere
X = ballInSphere(1000, 1000, 2);
scatter(X(1,:),X(2,:));

%% unit test for twoBlobs
X = twoBlobs(1000,2,3);
scatter3(X(1,:),X(2,:),X(3,:));

%% unit test for double helix
X = doubleHelix(1000);
scatter3(X(1,:),X(2,:),X(3,:));