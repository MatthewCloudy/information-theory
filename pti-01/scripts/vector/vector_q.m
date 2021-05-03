function [signal_quantized, mse] = vector_q(signal, n, vectorLength)
    vectors = splitVector(signal,vectorLength);
    codebook = fillCodeBook(n,vectors);
    quantisizedVectors = quantisize(codebook, vectors);
    signal_quantized = zeros(l+vectorLength,2);
    for i = 1:size(quantisizedVectors,2)
        signal_quantized( ((i-1)*vectorLength + 1):(i*vectorLength), 1 ) = quantisizedVectors(:,i)';
    end
end