function Cint = lagrange_interp(x, Cnew, xint)
    N = length(x);
    M = length(xint);
    Cint = zeros(M, 1);
    for i = 1:M
        xi = xint(i);
        P = 0;
        for j = 1:N
            L_j = 1; 
            for k = 1:N
                if k ~= j
                    numerator = (xi - x(k));
                    denominator = (x(j) - x(k));
                    L_j = L_j * (numerator / denominator);
                end
            end
            P = P + Cnew(j) * L_j;
        end
        Cint(i) = P;
    end
end