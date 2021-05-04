function [codebook] = fillCodeBook(n, vectors)
    codebook = zeros(n, size(vectors,1));
    for i = 1:n
        codebook(i,:) = vectors(:,randi([ceil((i-1) * size(vectors,2) / n + 1) ceil(i * size(vectors,2) / n)],1,1))';
    end
end