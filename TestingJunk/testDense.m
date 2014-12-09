nc = 2;
[X, Y] = denseAndSparseBlobs(1000, 3);
scatter3(X(1,:), X(2,:),  X(3,:))

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
scatter3(X(1,:), X(2,:), X(3,:), 4, colorMatrix)