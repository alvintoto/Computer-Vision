% Loading my images from root folder
img1 = imread('01.jpg');
img2 = imread('02.jpg');
img3 = imread('03.jpg');
img4 = imread('04.jpg');
img5 = imread('05.jpg');
img6 = imread('06.jpg');

% 1. Set green channel to zero, and save as green.jpg
green_img = img1;
green_img(:,:,2) = 0;
imwrite(green_img, 'green.jpg');

% 2. Convert image from RGB to gray scale without using
% built-in functions, and save as gray.jpg
gray_img = img1(:,:,1)*0.2989 + img1(:,:,2)*0.5870 + img1(:,:,3)*0.1140;
imwrite(gray_img, 'gray.jpg');

% 3. Rotate 90 degrees, and save as rotate.jpg
rotate_img = imrotate(img1,90);
imwrite(rotate_img, 'rotate.jpg');

% 4. Crop the image given the upper left point (30, 100) and
% lower right point (270, 300), and save as crop.jpg
crop_img = img1(100:300, 30:270, :);
imwrite(crop_img, 'crop.jpg');

% 5. Horizontally flip the image, and save as flip.jpg
flip_img = flip(img1);
imwrite(flip_img, 'flip.jpg');

% 6. Combine 4 images (01.jpg ~ 04.jpg) into one matrix
% with 2 x 2 grid and 10 pixels separations, and save as
% combine.jpg
canvas = zeros(300*2 + 10, 400*2 + 10, 3, 'uint8');
canvas(1:300, 1:400, :) = img1;
canvas(1:300, 411:810, :) = img2;
canvas(311:610, 1:400, :) = img3;
canvas(311:610, 411:810, :) = img4;
imwrite(canvas, 'combine.jpg')

% 7. Convert images (05.jpg and 06.jpg) to vectors, average
% them, and save as average.jpg
img5_vector = img5(:);
img6_vector = img6(:);
average_vector = (img5_vector + img6_vector) / 2;
img_size = size(img5);
average_img = reshape(average_vector, img_size(1), img_size(2), img_size(3));
imwrite(average_img, 'average.jpg');