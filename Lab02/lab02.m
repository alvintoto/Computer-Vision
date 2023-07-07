% Load images
img = imread('01.jpg');
lena = im2double(imread('lena_noisy.jpg'));

% 1. Rotate 01.jpg by 45 degrees using forward warping, and
% save as rotate_0.jpg

% Create an empty output image with the same size as the input
rotated_img = zeros(size(img, 1), size(img, 2), 3, 'uint8');

% Define the rotation angle
theta = 45;

% Define the center of rotation
center = [200, 150];

% Loop through each pixel in the input image
for i = 1:size(img, 2)
    for j = 1:size(img, 1)
        
        % Apply the forward warping operation
        x = cosd(theta)*(i - center(1)) + sind(theta)*(j - center(2)) + center(1);
        y = -sind(theta)*(i - center(1)) + cosd(theta)*(j - center(2)) + center(2);
        
        % Check if the rotated pixel is within the bounds of the output image
        if (x >= 1 && x <= size(img, 2) && y >= 1 && y <= size(img, 1))
            % Round the rotated coordinates to the nearest integer
            x = round(x);
            y = round(y);
            
            % Assign the value of the corresponding pixel in the input image to the output image
            rotated_img(y, x, :) = img(j, i, :);
        end
    end 
end

% Save the rotated image
imwrite(rotated_img, 'rotate_0.jpg');


% 2. Rotate 01.jpg by 45 degrees using backward warping,
% and save as rotate_1.jpg

% Create an empty output image with the same size as the input
rotated_img = zeros(size(img, 1), size(img, 2), 3, 'uint8');

% Loop through each pixel in the output image
for j = 1:size(rotated_img, 1)
    for i = 1:size(rotated_img, 2)
        
        % Apply the backward warping operation
        x = cosd(theta)*(i - center(1)) - sind(theta)*(j - center(2)) + center(1);
        y = sind(theta)*(i - center(1)) + cosd(theta)*(j - center(2)) + center(2);
        
        % Check if the original pixel is within the bounds of the input image
        if (x >= 1 && x <= size(img, 2) && y >= 1 && y <= size(img, 1))
            % Round the original coordinates to the nearest integer
            x = round(x);
            y = round(y);
            
            % Assign the value of the corresponding pixel in the input image to the output image
            rotated_img(j, i, :) = img(y, x, :);
        end
    end 
end

% Save the rotated image
imwrite(rotated_img, 'rotate_1.jpg');

% 3. Implement median_filter.m for lena_noisy.jpg, use patch
% size = 3 and save the image as median_0.jpg
img_median = median_filter(lena, [3,3]);
imwrite(img_median, 'median_0.jpg');

% 4. Use patch size = 5, and save the image as median_1.jpg
img_median = median_filter(lena, [5,5]);
imwrite(img_median, 'median_1.jpg');
