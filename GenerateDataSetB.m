function [ X, Y ] = GenerateDataSetB( N )
%GENERATEDATASETB Here N represents the number of 1s and 7s thus, the
%dimension of the returned data is 784*2N
%   

X = zeros(784,2*N);
Y = zeros(2*N,1);
load('TrainImages.mat');
load('TrainImageLabels.mat');

visited = zeros(60000,1);
sevens = 0;
ones = 0;
dataIndex = 1;
while dataIndex <= 2*N
    %Inneficient but simple way to randomly sample the data.
    %randomly generate index, and use sample if not yet used.
    sample = randi(60000,1,1);
    x = sample;
    if visited(sample) == 0
        visited(sample) = 1;
        if Labels(x) == 7 && sevens < N
            %extract the data of the ima dge
            d = squeeze(TrainImages(x,:,:));
            %flatten the data vector
            datavector = d( :);
            X(:,dataIndex) = datavector;
            Y(dataIndex) = 7;
            dataIndex = dataIndex +1;
            sevens = sevens + 1;

        end
        if Labels(x) == 1 && ones < N
            d = squeeze(TrainImages(x,:,:));
            %flatten the data vector
            datavector = d( :);
            X(:,dataIndex) = datavector;
            Y(dataIndex) = 1;
            dataIndex = dataIndex +1;
            ones = ones + 1;

        end
    end
end



end

