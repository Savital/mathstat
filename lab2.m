function lab2()
    X = csvread('data');

    Gm = 0.9; 
    Alph = (1 - Gm)/2;
    M = []; S = [];
    N = 10:length(X);
    for i = N
        M = [M, mean(X(1:i))];
        S = [S, var(X(1:i))];
    end 
    t = tinv(1 - Alph, N - 1)
    hl = chi2inv(1 - Alph, N - 1)
    hh = chi2inv(Alph, N - 1)
    Ml = M - sqrt(S).*t./sqrt(N);
    Mh = M + sqrt(S).*t./sqrt(N);
    Sl = S.*(N - 1)./hl;
    Sh = S.*(N - 1)./hh;
    
    MeanX = mean(X); VarX = var(X);
    fprintf('M = %.2f\nS^2 = %.2f\n\n', MeanX, VarX);
    fprintf('M[low] = %.2f\nM[high] = %.2f\n', Ml(end), Mh(end));
    fprintf('Sigma[low]^2 = %.2f\nSigma[high]^2 = %.2f\n', Sl(end), Sh(end));
    
    figure
    hold on;
    plot([N(1), N(end)], [MeanX, MeanX], 'k');
    plot(N, M, 'b');
    plot(N, Ml, 'r');
    plot(N, Mh, 'g');
    hold off;
    MeanXS = sprintf('\\mu = %.5f\n', MeanX);
    text(290, 300, MeanXS, 'Units', 'pixels');
    xlabel('N');
    ylabel('µ');
    
    figure
    hold on;
    plot([N(1), N(end)], [VarX, VarX], 'k');
    plot(N, S, 'b');
    plot(N, Sl, 'r');
    plot(N, Sh, 'g');
    hold off;
    VarXS = sprintf('\\sigma^2 = %.5f\n', VarX);
    text(290, 300, VarXS, 'Units', 'pixels');
    xlabel('N');
    ylabel('S^2');
end
