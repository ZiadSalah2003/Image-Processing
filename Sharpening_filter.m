%Ziad Salah Hozain Ahmed   G1    20220068
function Sharpening_filter(imagePath)


imagePath = color2gray(imagePath);

laplacian_filter = fspecial('laplacian', 0.5); 
sharpened_img = imfilter(imagePath, laplacian_filter, 'replicate');

sharpened_img = imagePath + sharpened_img;

imagePath=uint8(imagePath);
figure,imshow(imagePath),title('Original')
figure,imshow(sharpened_img),title('Sharpened Image')
end