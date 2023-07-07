% 1. Implement separate_frequency.m
function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
    % Apply FFT
    frequency_map = fft2(img);
    
    % Shift the frequency map
    shifted_frequency_map = fftshift(frequency_map);
    
    % Compute low-frequency mask
    [height, width] = size(img);
    center_y = round(height / 2);
    center_x = round(width / 2);
    radius = round(min(height, width) * ratio / 2);
    low_pass_mask = zeros(size(shifted_frequency_map));
    low_pass_mask(center_y-radius:center_y+radius, center_x-radius:center_x+radius) = 1;
    
    % Separate low-frequency and high-frequency maps
    low_pass_map = shifted_frequency_map .* low_pass_mask;
    high_pass_map = shifted_frequency_map .* (1 - low_pass_mask);
    
    % Shift frequency maps back
    shifted_low_pass_map = ifftshift(low_pass_map);
    shifted_high_pass_map = ifftshift(high_pass_map);
    
    % Apply Inverse FFT
    low_pass_img = real(ifft2(shifted_low_pass_map));
    high_pass_img = real(ifft2(shifted_high_pass_map));
end