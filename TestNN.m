numNeighbors = 5;
examine = 3;
[count,idxs, dists,NNInfo] = nrsearch(X, X, numNeighbors, 0);
 imshow(reshape(X(:,examine),28,28))
 pause;
 neighbors = idxs{examine};
for ind = 1:numNeighbors
    neighbor = neighbors(ind);
    imshow(reshape(X(:,neighbor),28,28))
     pause;

end