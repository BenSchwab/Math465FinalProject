function [ X, Y ] = lineAndBlob(nLine, nBlob)

lineMu = 0;
lineSigma = 0.05;
lineX = rand(1, nLine)*30; % line from 0 to 30
lineY = normrnd(lineMu, lineSigma, 1, nLine); % add noise to the line
line = vertcat(lineX, lineY);
lineLabels = zeros(1, nLine);

blobMu = 0;
blobSigma = .5;
blobCenter = 0.9*ones(2, nBlob);
blobCenter(1,:) = 6*ones(1, nBlob); % shift over center to (6,0.9)
blob = normrnd(blobMu, blobSigma, 2, nBlob) + blobCenter;
blobLabels = ones(1, nBlob);

X = horzcat(line, blob);
Y = horzcat(lineLabels, blobLabels);

end