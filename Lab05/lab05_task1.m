% Load input image
img = im2double(imread('lena.jpg'));

% Set parameters
sigma = 2.0;
hsize = 7;
scale = 5;

%% Gaussian Pyramid
I = img;
for s = 1:scale
    % Gaussian filter
    G = imgaussfilt(I, sigma, 'FilterSize', hsize);
    
    % Save image
    imwrite(G, sprintf('Gaussian_scale%d.jpg', s));
    
    % Down-sampling
    I = imresize(G, 0.5);
end

%% Laplacian Pyramid
I = img;
for s = 1:scale
    % Gaussian filter
    G = imgaussfilt(I, sigma, 'FilterSize', hsize);
    
    % Laplacian filter
    L = I - imresize(G, size(I));
    
    % Save image
    imwrite(L + 0.5, sprintf('Laplacian_scale%d.jpg', s));
    
    % Down-sampling
    I = imresize(G, 0.5);
end