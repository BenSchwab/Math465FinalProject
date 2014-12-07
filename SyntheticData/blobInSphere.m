function [ X, Y ] = blobInSphere(nBlob, nSphere, d)

blobMu = 0;
blobSigma = 0.5;
blob = normrnd(blobMu,blobSigma,d,nBlob);
blobLabels = zeros(1,nBlob);

sphere = normrnd(0,1,d,nSphere);
lengths = sqrt(sum(sphere.^2));
sphereRadius = 3;
for i=1:nSphere
    % convert to unit vector and scale by sphere radius
    sphere(:,i) = sphereRadius*sphere(:,i)/lengths(i);
end
sphereMu = 0;
sphereSigma = 0.02;
sphere = sphere + normrnd(sphereMu,sphereSigma,d,nSphere);
sphereLabels = ones(1,nSphere);

Y = horzcat(blobLabels, sphereLabels);
X = horzcat(blob, sphere);

end

