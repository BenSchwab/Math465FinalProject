function [ X, Y ] = doubleHelix(n)

t = rand(1,n)*n/100;

strandOneXCoordinates = cos(t);
strandOneYCoordinates = sin(t);
strandOneZCoordinates = t;
strandOneLabels = zeros(1,n);

strandTwoXCoordinates = -cos(t);
strandTwoYCoordinates = -sin(t);
strandTwoZCoordinates = t;
strandTwoLabels = ones(1,n);

strandMu = 0;
strandSigma = 0.4;
zCoordinates = horzcat(strandOneZCoordinates, strandTwoZCoordinates);
xCoordinates = horzcat(strandOneXCoordinates, strandTwoXCoordinates) + normrnd(strandMu,strandSigma,1,n*2);
yCoordinates = horzcat(strandOneYCoordinates, strandTwoYCoordinates) + normrnd(strandMu,strandSigma,1,n*2);

X = vertcat(xCoordinates, yCoordinates, zCoordinates);
Y = horzcat(strandOneLabels, strandTwoLabels);

end