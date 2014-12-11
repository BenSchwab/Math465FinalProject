function [ output_args ] = DDDPlotter(U, labelAssignments, plotName)
        
        n = length(labelAssignments);

        X31 = U(:,1:3);
        X32 = U(:,4:6);
        X33 = U(:,7:9);
        
        numberOfColors = length(unique(labelAssignments));
        colors = distinguishable_colors(numberOfColors);
        colorMap = containers.Map(unique(labelAssignments), 1:numberOfColors);
        colorMatrix = zeros(n, 3); % construct RGB matrix
        for i = 1:n
            color = colors(colorMap(labelAssignments(i)),:);
            colorMatrix(i,:) = color;
        end
        
        fh = figure();
        scatter3(X31(:,1),X31(:,2),X31(:,3), 4, colorMatrix);
        caxis([0,9]);
        colorbar;
        
        fh = figure();
        scatter3(X32(:,1),X32(:,2),X32(:,3), 4, colorMatrix);
        caxis([0,9]);
        colorbar;
        
        fh = figure();
        scatter3(X33(:,1),X33(:,2),X33(:,3), 4, colorMatrix);
        caxis([0,9]);
        colorbar;
end

