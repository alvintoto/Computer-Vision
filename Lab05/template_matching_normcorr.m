function [output, match] = template_matching_normcorr(img, template, threshold)
    
% Initialize output image with input image
output = img;

% Compute template size and shift values
[template_height, template_width] = size(template);
shift_u = floor(template_width / 2);
shift_v = floor(template_height / 2);

% Loop over image pixels
for u = shift_u + 1 : size(img, 2) - shift_u 
    for v = shift_v + 1 : size(img, 1) - shift_v
        
        % Extract patch around current pixel
        patch = img(v - shift_v : v + shift_v, u - shift_u : u + shift_u);
        
        % Normalize patch and template
        patch_norm = (patch - mean(patch(:))) / norm(patch(:) - mean(patch(:)));
        template_norm = (template - mean(template(:))) / norm(template(:) - mean(template(:)));
        
        % Compute normalized correlation
        normcorr = dot(patch_norm(:), template_norm(:));
        
        % Store normalized correlation value in output image
        output(v, u) = normcorr;
    end
end

% Threshold output image to create binary match image
match = output > threshold;

end
