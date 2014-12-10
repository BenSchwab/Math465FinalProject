function [ X, Y ] = doubleHelix(n, Opts)

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
if ~isfield(Opts,'strandSigma')
    Opts.strandSigma = 0.1;
end
zCoordinates = horzcat(strandOneZCoordinates, strandTwoZCoordinates);
xCoordinates = horzcat(strandOneXCoordinates, strandTwoXCoordinates) + normrnd(strandMu,Opts.strandSigma,1,n*2);
yCoordinates = horzcat(strandOneYCoordinates, strandTwoYCoordinates) + normrnd(strandMu,Opts.strandSigma,1,n*2);

X = vertcat(xCoordinates, yCoordinates, zCoordinates);
Y = horzcat(strandOneLabels, strandTwoLabels);

end