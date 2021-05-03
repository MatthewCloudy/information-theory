function [signal_quantized, mse] = vector_q(signal, n, vectorLength)
    vectors = splitVector(signal,vectorLength);
    codebook = fillCodeBook(n,vectors);
    quantisizedVectors = quantisize(codebook, vectors);
<<<<<<< HEAD
    signal_quantized = zeros(size(quantisizedVectors,1) * size(quantisizedVectors,2),1);
    for i = 1:size(quantisizedVectors,2)
        signal_quantized( ((i-1)*vectorLength + 1):(i*vectorLength), 1 ) = quantisizedVectors(:,i)';
    end
    %mse = zeros(l+vectorLength,2);
    padded_signal = [signal zeros(length(signal_quantized) - length(signal))];
    mse = realsqrt( (padded_signal - signal_quantized).^2./length(signal_quantized) );
=======
    signal_quantized = zeros(l+vectorLength,2);
    for i = 1:size(quantisizedVectors,2)
        signal_quantized( ((i-1)*vectorLength + 1):(i*vectorLength), 1 ) = quantisizedVectors(:,i)';
    end
>>>>>>> 563c30654c88c73086028e27db10a069c6fc7046
end