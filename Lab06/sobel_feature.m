function [magnitude, orientation] = sobel_feature(img)

    % horizontal edge
    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
    % vertical edge
    Hx = [1, 0, -1; 2, 0 , -2; 1, 0 , -1];
    
    % sobel filtering
    Sobel_Hy = imfilter(img, Hy);
    Sobel_Hx = imfilter(img, Hx);

    % compute gradient magnitude and orientation
    magnitude = sqrt((Sobel_Hy).^2 + (Sobel_Hx).^2);
    orientation = atan2(Sobel_Hy, Sobel_Hx);
    
end
