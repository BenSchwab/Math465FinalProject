function [ X ] = lineAndBall(n)

lineMu = 0;
lineSigma = 0.05;
lineX = rand(1,n)*30;
lineY = normrnd(lineMu,lineSigma,1,n);
line = vertcat(lineX, lineY);

circleMu = 0;
circleSigma = .5;
circleCenter = ones(2,n);
circleCenter(1,:) = 6*ones(1,n);
circle = normrnd(circleMu, circleSigma, 2, n) + circleCenter;

X = horzcat(line, circle);

end