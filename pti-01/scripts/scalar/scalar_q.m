function [signal_quantized, mse] = scalar_q(signal ,n)
    [partition, codebook] = podzialy(signal, n);
    scalar_q = dsp.ScalarQuantizerEncoder(BoundaryPoints = partition, CodewordOutputPort = true(1), Codebook = codebook);
    [indexes, signal_quantized] = scalar_q(signal);
    mse = mean((signal - signal_quantized).^2);
end

