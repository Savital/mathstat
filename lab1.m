function lab1()
    clear;
    SampleX = csvread('data');
    SampleX = [SampleX zeros(1,145)+19];
    SampleX = sort(SampleX);
    N = length(SampleX);
    MaxX = max(SampleX); 
    MinX = min(SampleX);
    RangeX = MaxX - MinX;
    MeanX = mean(SampleX); 
    VarianceX = var(SampleX);
    SubCount = floor(log2(N) + 2); 
    DeltaX = RangeX/SubCount;
    SigmaX = sqrt(VarianceX);
    
    figure('Name','Bar graph + Density function');
    hold on;
    [y, x] = hist(SampleX, SubCount);
    y = y / (N * DeltaX);
    bar(x, y, 1, 'y');
    x = 10 : DeltaX/120 : 22;
    y = normpdf(x, MeanX, SigmaX);
    plot(x, y, 'k');
    hold off;
    deltaS = sprintf('\\Delta = %.5f\n', DeltaX);
    text(20, 300, deltaS, 'Units', 'pixels');
    MinXS = sprintf('min = %.5f\n', MinX);
    text(20, 280, MinXS, 'Units', 'pixels');
    MaxXS = sprintf('max = %.5f\n', MaxX);
    text(20, 260, MaxXS, 'Units', 'pixels');
    xlabel('x');
    ylabel('f(x)');
    
    figure('Name', 'Cumulative and Emperical distribution function graph');
    hold on;
    x = 10 : DeltaX/120 : 22;
    y = normcdf(x, MeanX, SigmaX);
    plot(x, y, 'r');
    [y, x] = ecdf(SampleX);
    stairs(x, y, 'k');
    hold off;
    deltaS = sprintf('\\Delta = %.5f\n', DeltaX);
    text(20, 300, deltaS, 'Units', 'pixels');
    MinXS = sprintf('min = %.5f\n', MinX);
    text(20, 280, MinXS, 'Units', 'pixels');
    MaxXS = sprintf('max = %.5f\n', MaxX);
    text(20, 260, MaxXS, 'Units', 'pixels');
    xlabel('x');
    ylabel('F(x)');
    
    fprintf('Sample X result:\n');
    fprintf('Max = %f | Min = %f\n', MaxX, MinX);
    fprintf('Range = %f\n', RangeX);
    fprintf('Delta = %f\n', DeltaX);
    fprintf('Mu = %f | S^2 = %f\n', MeanX, VarianceX);
end
