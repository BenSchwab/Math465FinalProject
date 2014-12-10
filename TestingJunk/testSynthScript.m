nc = 2;
[X, Y] = blobInSphere(1000, 1000, 2);
scatter(X(1,:), X(2,:))
pause
[clusters, G] = SpectralClusterer(X, Y, struct('NumClusters', nc, 'NumberNeighbors', 70));
vals = unique(clusters.Unmerged);

%%% SHOW PURITY %%%%
ClusterPurity(clusters.Unmerged, Y, nc)
%%% END %%%%

numColors = length(vals);
colors = distinguishable_colors(numColors);
colorMap = containers.Map(vals, 1:numColors);

n = length(Y);
colorMatrix = zeros(n, 3);
for i = 1:n
    color = colors(colorMap(clusters.Unmerged(i)),:);
    colorMatrix(i,:) = color;
end
scatter(X(1,:), X(2,:),4, colorMatrix)