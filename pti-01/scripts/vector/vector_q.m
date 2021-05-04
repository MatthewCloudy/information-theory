function [signal_quantized, mse] = vector_q(signal, n, vectorLength)
    vectors = splitVector(signal,vectorLength);
    codebook = fillCodeBook(n,vectors);
    quantisizedVectors = quantisize(codebook, vectors);
    signal_quantized = zeros(size(quantisizedVectors,1) * size(quantisizedVectors,2),1);
    for i = 1:size(quantisizedVectors,2)
        signal_quantized( ((i-1)*vectorLength + 1):(i*vectorLength), 1 ) = quantisizedVectors(:,i)';
    end
    padded_signal = [signal; zeros(length(signal_quantized) - length(signal), 1)];
    mse = mean((padded_signal - signal_quantized).^2);
end