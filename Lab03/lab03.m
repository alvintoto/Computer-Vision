% Load image
img = im2double(imread('lena.jpg'));

% Define the Sobel filters
h_filter = [1, 2, 1; 0, 0, 0; -1, -2, -1];
v_filter = [1, 0, -1; 2, 0, -2; 1, 0, -1];

% 1. Implement sobel_filter.m, use horizontal filter and save
% the image as sobel_h.jpg
sobel_h = sobel_filter(img, h_filter);
imwrite(sobel_h, 'sobel_h.jpg');

% 2. Use vertical filter and save the image as sobel_v.jpg
sobel_v = sobel_filter(img, v_filter);
imwrite(sobel_v, 'sobel_v.jpg');

% 3. Implement gaussian_filter.m, use hsize = 5, sigma = 2,
% and save the image as gaussian_5.jpg
gaussian_5 = gaussian_filter(img, 5, 2);
imwrite(gaussian_5, 'gaussian_5.jpg');

% 4. Use hsize = 9, sigma = 4, and save the image as
% gaussian_9.jpg
gaussian_9 = gaussian_filter(img, 9, 4);
imwrite(gaussian_9, 'gaussian_9.jpg');


