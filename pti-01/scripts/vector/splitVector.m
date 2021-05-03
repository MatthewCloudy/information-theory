function [division] = splitVector(v, n)
    division = zeros(n, ceil(length(v)/n));
    for i = 1:length(v)
        division(mod(i,n) + 1, ceil(i/n)) = v(i);
    end
end