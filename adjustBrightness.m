%Ziad Salah Hozain Ahmed   G1    20220068
function adjustedImage = adjustBrightness(imagePath, brightnessOffset)
    image_double = double(imagePath);
    adjustedImage_double = image_double + brightnessOffset;
    adjustedImage_double(adjustedImage_double < 0) = 0;
    adjustedImage_double(adjustedImage_double > 255) = 255;
    adjustedImage = uint8(adjustedImage_double);
    figure;
    subplot(1, 2, 1);
    imshow(imagePath);
    title('Original Image');
    subplot(1, 2, 2);
    imshow(adjustedImage);
    title(['Brightness Adjusted Image (Offset: ' num2str(brightnessOffset) ')']);
end
