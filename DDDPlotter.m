function [ output_args ] = DDDPlotter(U, labelAssignments, plotName)
        
        n = length(labelAssignments);

        X3 = U(1:3,:);
        
        numberOfColors = length(unique(labelAssignments));
        colors = distinguishable_colors(numberOfColors);
        colorMap = containers.Map(unique(labelAssignments), 1:numberOfColors);
        colorMatrix = zeros(n, 3); % construct RGB matrix
        for i = 1:n
            color = colors(colorMap(labelAssignments(i)),:);
            colorMatrix(i,:) = color;
        end
        
        fh = figure();
        scatter3(U(:,1),U(:,2),U(:,3), 4, colorMatrix);
        caxis([0,9]);
        colorbar;
end

