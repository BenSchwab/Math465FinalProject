% filename = .....#{num_data}_#{num cluster}_#{run id}

data_points = [1000];%[100, 200, 400, 600, 1000 ];
knns =         [50];%[20, 30, 50, 50, 50 ];

num_data_runs = length(data_points);
num_runs = 5;
for r = 10:num_runs+10
    for i = 1:num_data_runs
        num_points = data_points(i);
        tic
        sprintf('run: %d \t data_points: %d', r, num_points)
        knn = knns(i);
        %%%%
        % [0,1]
        %%%%
        digits = [0,1];
        cluster_options = [2,3];
        num_options = length(cluster_options);
        for j = 1:num_options
            num_clusters = cluster_options(j);
            filename = sprintf('zero_one_%d_%d_%d', num_points, num_clusters, r);

            [X,Y] = MNIST_helper(digits, num_points,0); 
            [clusters, G] = SpectralClusterer(X, Y, struct('NumClusters', num_clusters, 'NumberNeighbors', knn, 'auto',0));
            purity_un = ClusterPurity(clusters.Unmerged, Y, num_clusters);
            purity_merge = ClusterPurity(clusters.Merged, Y, 2);

            WriteData(filename, purity_un, purity_merge);
        end
        %%%%
        % [1,7]
        %%%%

        digits = [1,7];
        [X,Y] = MNIST_helper(digits, num_points,0); 
        cluster_options = [2,3];
        num_options = length(cluster_options);
        for j = 1:num_options
            num_clusters = cluster_options(j);
            filename = sprintf('one_seven_%d_%d_%d', num_points, num_clusters, r);    
            [clusters, G] = SpectralClusterer(X, Y, struct('NumClusters', num_clusters, 'NumberNeighbors', knn, 'auto',0));
            purity_un = ClusterPurity(clusters.Unmerged, Y, num_clusters);
            purity_merge = ClusterPurity(clusters.Merged, Y, 2);

            WriteData(filename, purity_un, purity_merge);
        end
        %%%%
        % [0,1,3,6]
        %%%%
        digits = [0,1,3,6];
        [X,Y] = MNIST_helper(digits, num_points,0);
        cluster_options = [4,7];
        num_options = length(cluster_options);
        for j = 1:num_options
    
            num_clusters = cluster_options(j);
            filename = sprintf('zero_six_%d_%d_%d', num_points, num_clusters, r);

            [clusters, G] = SpectralClusterer(X, Y, struct('NumClusters', num_clusters, 'NumberNeighbors', knn, 'auto',0));
            purity_un = ClusterPurity(clusters.Unmerged, Y, num_clusters);
            purity_merge = ClusterPurity(clusters.Merged, Y, 4);

            WriteData(filename, purity_un, purity_merge);
        end
        %%%%
        % [0-9]
        %%%%
        digits = 0:9;
        [X,Y] = MNIST_helper(digits, num_points,0);
        cluster_options = [10, 20];
        num_options = length(cluster_options);
        for j = 1:num_options
            
            num_clusters = cluster_options(j);
            filename = sprintf('all_%d_%d_%d', num_points, num_clusters, r);

            [clusters, G] = SpectralClusterer(X, Y, struct('NumClusters', num_clusters, 'NumberNeighbors', knn, 'auto',0));
            purity_un = ClusterPurity(clusters.Unmerged, Y, num_clusters);
            purity_merge = ClusterPurity(clusters.Merged, Y, 10);


            WriteData(filename, purity_un, purity_merge);
        end
        toc
    end
end