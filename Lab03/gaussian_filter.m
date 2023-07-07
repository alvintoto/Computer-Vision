function filter = gaussian_filter(img, hsize, sigma)

% Create a Gaussian filter with specified size and standard deviation
filter = fspecial('gaussian', hsize, sigma);

% Apply the filter to the image
img_filtered = imfilter(img, filter);

% Normalize the filtered image to the range [0, 255]
img_filtered = uint8(img_filtered / max(img_filtered(:)) * 255);

% Return the filtered image
filter = img_filtered;

end 