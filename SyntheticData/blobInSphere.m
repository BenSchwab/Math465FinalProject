function [ X, Y ] = blobInSphere(nBlob, nSphere, d)

blob = normrnd(0,1,d,nBlob);
blobLabels = zeros(1,nBlob);

sphere = normrnd(0,1,d,nSphere);
lengths = sqrt(sum(sphere.^2));
sphereRadius = 3;
for i=1:nSphere
    sphere(:,i) = sphereRadius*sphere(:,i)/lengths(i);
end
sphere = sphere + normrnd(0,0.2,d,nSphere);
sphereLabels = ones(1,nSphere);

Y = horzcat(blobLabels, sphereLabels);
X = horzcat(blob, sphere);

end

