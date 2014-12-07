% Returns a matrix from 0-9 where the entries are the indicies in
% TrainImages
function ret = num_index
    load('TrainImageLabels');
    
    a = zeros(10,7000);
    current_index_for_num = ones(10,1);
    
    [r,c] = size(Labels);
    
    for i = [1:c]
        num = Labels(i);
        current_index = current_index_for_num(num+1);
        a(num + 1, current_index) = i;
        current_index_for_num(num+1) = current_index_for_num(num+1) + 1;
    end
    ret = a;
end
