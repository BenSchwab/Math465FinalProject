function [] = syntheticDataAnalyzer( X, Y, Opts)

    %% plot the raw data in monocolor (if possible)
    if(Opts.savePlots)
        fh = figure('Visible','off');
    else
        fh = figure();
    end
    
    dimension = length(X(:,1));
    if (dimension == 2)
        scatter(X(1,:),X(2,:));
    elseif (dimension == 3)
        scatter3(X(1,:),X(2,:),X(3,:));
    else
        disp('cannot plot, >3 or <2 dimensions');
    end
    
    if(Opts.savePlots)
        saveas(fh,strcat(pwd,'/SyntheticData/',Opts.name,'/data'),'png');
        close(fh);
    else
        pause(Opts.interval);
    end

    %% plot assignments for any clustering algorithm
    
    function plotAssignments(X, labelAssignments, plotName)
        
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
        
        if(Opts.savePlots)
            fh = figure('Visible','off');
        else
            fh = figure();
        end

        if (d == 2)
            scatter(X(1,:),X(2,:), 4, colorMatrix);
        elseif (d == 3)
            scatter3(X(1,:),X(2,:),X(3,:), 4, colorMatrix);
        else
            disp('cannot plot, >3 dimensions');
        end
        
        if(Opts.savePlots)
            saveas(fh,strcat(pwd,'/SyntheticData/',Opts.name,'/',plotName),'png');
            close(fh);
        else
            pause(Opts.interval);
        end
   
    end
    
    %% plot the K-Means Clustering results

    kMeansLabelAssignments = kmeans(X', Opts.numberOfClusters);
    plotAssignments(X, kMeansLabelAssignments, 'kmeans');

    %% plot the Spectral Clustering results
    
    [spectralLabelAssignments, ~] = SpectralClusterer(X, Y, struct('NumClusters', Opts.numberOfClusters, 'NumberNeighbors', Opts.numberOfNeighbors));
    plotAssignments(X, spectralLabelAssignments.Merged, 'spectral');

    close all;
end