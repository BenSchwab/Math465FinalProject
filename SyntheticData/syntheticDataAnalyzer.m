function [] = syntheticDataAnalyzer( X, Y, Opts)

    %% plot the data if possible
    
    dimension = length(X(:,1));
    if (dimension == 2)
        scatter(X(1,:),X(2,:));
    elseif (dimension == 3)
        scatter3(X(1,:),X(2,:),X(3,:));
    else
        disp('cannot plot, >3 dimensions');
    end
    pause(2);

    %% plot the K-Means Clustering results
    
    function plotAssignments(X, labelAssignments)
        
        n = length(labelAssignments);
        d = length(X(:,1));
        
        numberOfColors = length(unique(labelAssignments));
        colors = distinguishable_colors(numberOfColors);
        colorMap = containers.Map(unique(labelAssignments), 1:numberOfColors);
        colorMatrix = zeros(n, 3); % construct RGB matrix
        for i = 1:n
            color = colors(colorMap(labelAssignments(i)),:);
            colorMatrix(i,:) = color;
        end
        
        if (d == 2)
            scatter(X(1,:),X(2,:), 4, colorMatrix);
        elseif (d == 3)
            scatter3(X(1,:),X(2,:),X(3,:), 4, colorMatrix);
        else
            disp('cannot plot, >3 dimensions');
        end
    end

    kMeansLabelAssignments = kmeans(X', Opts.numberOfClusters);
    plotAssignments(X, kMeansLabelAssignments);
    pause(2);

    %% plot the Spectral Clustering results
    
    [scLabelAssignments, ~] = SpectralClusterer(X, Y, struct('NumClusters', Opts.numberOfClusters, 'NumberNeighbors', Opts.numberOfNeighbors));
    plotAssignments(X, scLabelAssignments.Merged);
    pause(2);

end
