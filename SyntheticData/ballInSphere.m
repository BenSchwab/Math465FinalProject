function [ X ] = ballInSphere(nBall, nSphere, d)

% generate multivariate gaussian (ball)
ball = normrnd(0,1,d,nBall);

% generate noisy sphere
sphere = normrnd(0,1,d,nSphere);
lengths = sqrt(sum(sphere.^2));
for i=1:nSphere
    sphere(:,i) = 3*sphere(:,i)/lengths(i);
end
sphere = sphere + normrnd(0,0.2,d,nSphere);

X = horzcat(ball, sphere);

end

