function feature = multiscale_sobel_feature(img, scale)

    % Initialize feature vector
    feature = [];
    
    for i = 1:scale
        
        % Compute Sobel feature
        [magnitude, orientation] = sobel_feature(img);
        
        % Concatenate feature vector
        % feature = cat(1, feature, magnitude(:));
        feature = cat(1, feature, orientation(:));
        
        % Down-sample image by a factor of 2
        img = imresize(img, 0.5);

    end
    
end
