function transformed_label = transformLabels(labels, map)
    transformed_label = arrayfun(@(x) map{x}, labels);
end