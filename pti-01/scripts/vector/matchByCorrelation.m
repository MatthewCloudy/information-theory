function [output] = matchByCorrelation(codebook,input)
    correlations = zeros(size(codebook,1), 1);
    for i = 1:size(codebook,1)
        correlations(i) = xcorr(input,codebook(i,:),0,'normalized');
        %correlations(i)
        %xcorr(input,codebook(i,:),'normalized')
    end
    [maxcor, index] = max(correlations);
    output = codebook(index,:);
end