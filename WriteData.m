function [] = WriteData(filename, unmerged, merged)

    fid = fopen(sprintf('mnist_figs/%s', filename),'wt');
    fprintf(fid,'unmerged\n');
    for ii = 1:size(unmerged,1)
        fprintf(fid,'%7.3f\t',unmerged(ii,:));
        fprintf(fid,'\n');
    end
    fprintf(fid,'\n');
    fprintf(fid,'merged\n');
     for ii = 1:size(merged,1)
        fprintf(fid,'%7.3f\t',merged(ii,:));
        fprintf(fid,'\n');
    end

    fclose(fid);
end