function filter = sobel_filter(img, kernel)

% Pad the image with zeros to handle the boundary pixels
img_padded = padarray(img, [1 1], 'replicate');

% Get the size of the padded image
[row, col] = size(img_padded);

% Initialize the filtered image
img_filtered = zeros(size(img));

% Apply the filter to the padded image
for i = 2:row-1
    for j = 2:col-1
        window = img_padded(i-1:i+1, j-1:j+1);
        img_filtered(i-1, j-1) = sum(sum(window .* kernel));
    end
end

% Normalize the filtered image to the range [0, 255]
img_filtered = uint8(img_filtered / max(img_filtered(:)) * 255);

% Return the filtered image
filter = img_filtered;

end