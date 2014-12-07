function [ X ] = doubleHelix(n)

t = rand(1,n)*n/100;
mu = 0;
sigma = 0.3;

strandOneZ = t;
strandOneX = cos(t);
strandOneY = sin(t);

strandTwoZ = t;
strandTwoX = -cos(t);
strandTwoY = -sin(t);

z = horzcat(strandOneZ, strandTwoZ);
x = horzcat(strandOneX, strandTwoX) + normrnd(mu,sigma,1,n*2);
y = horzcat(strandOneY, strandTwoY) + normrnd(mu,sigma,1,n*2);
X = vertcat(x,y,z);

end