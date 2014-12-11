function [ output_args ] = DDDPlotter(U, dims, labelAssignments, plotName)
        
        n = length(labelAssignments);

        X31 = U(:,dims);
     
        
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
        
end

