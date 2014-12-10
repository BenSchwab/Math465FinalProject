
pExampleNames   = { ...
    'twoBalls       Kmeans[O] Spectral[O]', ...
    'doubleHelix    Kmeans[X] Spectral[O]', ...
    'lineAndBlob    Kmeans[X] Spectral[X]', ...
    'denseSparse    Kmeans[X] Spectral[X]', ...
    'blobInSphere   Kmeans[X] Spectral[O]', ...
    'twoBalls       Varying Dimension', ...
    'blobInSphere   Varying Variance', ...
    'doubleHelix    Varying Variance',...
    'sparseBlobs    Kmeans[X] Spectral[X]'};

fprintf('\n\n Select example to run:\n');
for k = 1:length(pExampleNames),
    fprintf('\n [%d] %s',k,pExampleNames{k});
end;
fprintf('\n\n  ');

while true,
    try
        pExampleIdx = input('');
        pExampleIdx = str2num(pExampleIdx);
    catch
    end;
    if (pExampleIdx>=1) && (pExampleIdx<=length(pExampleNames)),
        break;
    else
        fprintf('\n %d is not a valid Example. Please select a valid Example above.',pExampleIdx);
        pExampleIdx=0;
    end;
end;

% default settings
Opts.numberOfClusters = 2;
Opts.numberOfNeighbors = 70;
Opts.savePlots = false;
Opts.interval = 2; % 2 seconds between plot displays

% update settings on a per case basis
switch pExampleIdx
    case 1  
        Opts.name = 'twoBalls';
        twoBallOpts = struct();
        [X, Y] = twoBalls(1000,2,3,twoBallOpts);
        syntheticDataAnalyzer(X, Y, Opts);
    case 2
        Opts.name = 'doubleHelix';
        doubleHelixOpts = struct();
        [X, Y] = doubleHelix(1000, doubleHelixOpts);
        syntheticDataAnalyzer(X, Y, Opts);
    case 3
        Opts.name = 'lineAndBlob';
        [X, Y] = lineAndBlob(1000, 1000);
        syntheticDataAnalyzer(X, Y, Opts);
    case 4
        Opts.name = 'denseAndSparseBlobs';
        [X, Y] = denseAndSparseBlobs(1000, 3);
        syntheticDataAnalyzer(X, Y, Opts);
    case 5
        Opts.name = 'blobInSphere';
        blobInSphereOpts = struct();
        [X, Y] = blobInSphere(1000, 1000, 2, blobInSphereOpts);
        syntheticDataAnalyzer(X, Y, Opts);
    case 6
        Opts.name = 'twoBalls';
        twoBallsOpts = struct('centerDistance',1.9); % TODO: looking to see if we can break spectral in high d, as points go to the spherical boundary
        dimensions = 2.^(1:10);
        averagePurities = zeros(1,length(dimensions));
        
        for i=1:length(dimensions)
            dimension = dimensions(i);
            [X, Y] = twoBalls(1000,dimension,dimension,twoBallsOpts); % embedded dim = dim
            [spectralLabelAssignments, ~] = SpectralClusterer(X, Y, struct('NumClusters', Opts.numberOfClusters, 'NumberNeighbors', Opts.numberOfNeighbors));
            purityMatrix = ClusterPurity(spectralLabelAssignments.Unmerged, Y, Opts.numberOfClusters);
            averagePurity = mean(purityMatrix(:,1));
            averagePurities(1,i) = averagePurity; 
        end
        
        plot(dimensions, averagePurities);
            
    case 7
        Opts.name = 'blobInSphere_varyVariance';
        
        blobSigmas = [0.5, .75, 1];
        sphereSigmas = [0.02, 0.05, 0.1];
        
        counter = 1;
        for i=1:length(blobSigmas)
            for j=1:length(sphereSigmas)
                blobSigma = blobSigmas(i);
                sphereSigma = sphereSigmas(j);
                
                blobInSphereOpts = struct('blobSigma',blobSigma,'sphereSigma',sphereSigma);
                [X, Y] = blobInSphere(1000, 1000, 2, blobInSphereOpts);
                [spectralLabelAssignments, ~] = SpectralClusterer(X, Y, struct('NumClusters', Opts.numberOfClusters, 'NumberNeighbors', Opts.numberOfNeighbors));
                
                plotPosition = subplot(length(blobSigmas),length(sphereSigmas),counter);
                colormap(cool);
                scatter(plotPosition, X(1,:),X(2,:), 4, spectralLabelAssignments.Merged);
                % title(strcat('\sigma_{blob} = ',num2str(blobSigma),', \sigma_{sphere} = ',num2str(sphereSigma)));
                
                if (counter == 1 || counter == 4 || counter == 7)
                    ylabel(strcat('\sigma_{blob} = ',num2str(blobSigma)));
                end
                
                if (counter == 7 || counter == 8 || counter == 9)
                    xlabel(strcat('\sigma_{sphere} = ',num2str(sphereSigma)));
                end
                
                counter = counter + 1;
            end
        end
       
    case 8
        Opts.name = 'doubleHelix_varyVariance';
        
        strandSigmas = [0.1, 0.2, 0.25, 0.3];
        
        counter = 1;
        for i=1:length(strandSigmas)
            strandSigma = strandSigmas(i);
            doubleHelixOpts = struct('strandSigma',strandSigma);
            [X, Y] = doubleHelix(1000, doubleHelixOpts);
            [spectralLabelAssignments, ~] = SpectralClusterer(X, Y, struct('NumClusters', Opts.numberOfClusters, 'NumberNeighbors', Opts.numberOfNeighbors));

            plotPosition = subplot(1,4,counter);
            colormap(cool);
            scatter3(plotPosition, X(1,:),X(2,:), X(3,:), 4, spectralLabelAssignments.Merged);
            title(strcat('strandSigma: ',num2str(strandSigma)));

            counter = counter+1;
        end
        
    case 9
        Opts.savePlots = false;
        Opts.name = 'sparseBlobs';
        Opts.numberOfNeighbors = 20;
        sparseBlobsOpts = struct();
        [X, Y] = sparseBlobs(3,50,sparseBlobsOpts);
        syntheticDataAnalyzer(X, Y, Opts);
        
end
