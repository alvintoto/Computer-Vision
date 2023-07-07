% 4. Implement hybrid_image.m
function img_merged = hybrid_image(img1, img2, ratio)
    % Convert input images to grayscale
    img1_gray = rgb2gray(img1);
    img2_gray = rgb2gray(img2);
    
    % Split img1 and img2 into low/high frequency maps
    img1_low = separate_frequency(img1_gray, ratio);
    img2_low = separate_frequency(img2_gray, ratio);
    img2_high = img2_gray - img2_low;
    
    % Combine the low-frequency map of img1 with the high-frequency map of img2
    img_merged = img1_low + img2_high;
end