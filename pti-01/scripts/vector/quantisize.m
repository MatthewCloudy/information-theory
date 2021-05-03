function [out] = quantisize(codebook, input)
    out = zeros(size(input,1),size(input,2));
    for i = 1:size(input,2)
        out(:,i) = matchByCorrelation(codebook,input(:,i));
    end
end