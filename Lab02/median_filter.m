function filtered_img = median_filter(img, patch_size)

% Initialize the filtered image
filtered_img = zeros(size(img), 'like', img);

% Loop through each pixel in the input image
for j = 1:size(img, 1)
    for i = 1:size(img, 2)
        
        % Compute the row and column indices of the patch
        row_start = max(j - floor(patch_size(1)/2), 1);
        row_end = min(j + floor(patch_size(1)/2), size(img, 1));
        col_start = max(i - floor(patch_size(2)/2), 1);
        col_end = min(i + floor(patch_size(2)/2), size(img, 2));
        
        % Extract the patch from the input image
        patch = img(row_start:row_end, col_start:col_end);
        
        % Compute the median of the patch
        median_value = median(patch(:));
        
        % Assign the median value to the corresponding pixel in the output image
        filtered_img(j, i) = median_value;
    end 
end

end