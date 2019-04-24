function [ xGrid, fGrid ] = discreteData(nGrid , a,b , f)
    xGrid = zeros(nGrid + 1, 1);
    fGrid = zeros(nGrid + 1, 1);
    for i = 0:nGrid
        % Chebyshev interpolation point
        xGrid(i+1) =((b-a)*cos(pi*i/nGrid)/2) + ((b+a)/2);
        fGrid(i+1) = f(xGrid(i+1));
    end
end