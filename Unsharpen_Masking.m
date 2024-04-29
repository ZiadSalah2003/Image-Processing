%Ziad Salah Hozain Ahmed   G1    20220068
function  Unsharpen_Masking(imagePath)

imagePath = color2gray(imagePath);

blurred_img = imgaussfilt(imagePath, 2);

mask = imagePath - blurred_img;

sharpening_amount = 2;

sharpened_img = imagePath + sharpening_amount * mask;


imagePath=uint8(imagePath);
figure,imshow(imagePath),title('Original')
figure,imshow(sharpened_img),title('Unsharp Masking')
end