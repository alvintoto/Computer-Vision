% Load the images
lena = im2double(imread('lena.jpg'));
marilyn = im2double(imread('marilyn.jpg'));
einstein = im2double(imread('einstein.jpg'));

%% 2. Use ratio = 0.1, and save the image as lena_low_0.1.jpg and
% lena_high_0.1.jpg

% Generate low-pass and high-pass images with ratio = 0.1
[low_pass_img, high_pass_img] = separate_frequency(lena, 0.1);

% Normalize and convert the data type of the low-pass and high-pass images
% otherwise the high frequency is black and white
low_pass_img = (low_pass_img - min(low_pass_img(:))) * 255 / (max(low_pass_img(:)) - min(low_pass_img(:)));
low_pass_img = uint8(low_pass_img);
high_pass_img = (high_pass_img - min(high_pass_img(:))) * 255 / (max(high_pass_img(:)) - min(high_pass_img(:)));
high_pass_img = uint8(high_pass_img);

% Save the images
imwrite(low_pass_img, 'lena_low_0.1.jpg');
imwrite(high_pass_img, 'lena_high_0.1.jpg');

%% 3. Use ratio = 0.2, and save the image as lena_low_0.2.jpg and
% lena_high_0.2.jpg

% Generate low-pass and high-pass images with ratio = 0.2
[low_pass_img, high_pass_img] = separate_frequency(lena, 0.2);

% Normalize and convert the data type of the low-pass and high-pass images
% otherwise the high frequency is black and white
low_pass_img = (low_pass_img - min(low_pass_img(:))) * 255 / (max(low_pass_img(:)) - min(low_pass_img(:)));
low_pass_img = uint8(low_pass_img);
high_pass_img = (high_pass_img - min(high_pass_img(:))) * 255 / (max(high_pass_img(:)) - min(high_pass_img(:)));
high_pass_img = uint8(high_pass_img);

% Save the images
imwrite(low_pass_img, 'lena_low_0.2.jpg');
imwrite(high_pass_img, 'lena_high_0.2.jpg');

%% 5. Use any ratio to merge the low-frequency of marilyn.jpg and
% the high frequency of einstein.jpg, and save the image as
% hybrid_1.jpg

% Use any ratio to create hybrid_1 image
ratio = 0.1;
hybrid_1 = hybrid_image(marilyn, einstein, ratio);

% Save the hybrid_1 image
imwrite(hybrid_1, 'hybrid_1.jpg');

%% 6. Use any ratio to merge the low-frequency of einstein.jpg and
% the high frequency of marilyn.jpg, and save the image as
% hybrid_2.jpg

% Use any ratio to create hybrid_2 image
ratio = 0.2;
hybrid_2 = hybrid_image(einstein, marilyn, ratio);

% Save the hybrid_2 image
imwrite(hybrid_2, 'hybrid_2.jpg');