%Ziad Salah Hozain Ahmed   G1    20220068
function adjustedImages = adjustContrast(imagePath)
    if size(imagePath, 3) == 3
        imagePath = color2gray(imagePath);
    end
    oldMin = min(imagePath(:));
    oldMax = max(imagePath(:));

    newMin = 0;
    newMaxLow = 100; 
    newMaxHigh = 200;
    lowContrastImage = ((imagePath - oldMin) / (oldMax - oldMin)) * (newMaxLow - newMin) + newMin;
    highContrastImage = ((imagePath - oldMin) / (oldMax - oldMin)) * (newMaxHigh - newMin) + newMin;
    lowContrastImage(lowContrastImage > 255) = 255;
    lowContrastImage(lowContrastImage < 0) = 0;

    highContrastImage(highContrastImage > 255) = 255;
    highContrastImage(highContrastImage < 0) = 0;
    adjustedImages = {imagePath, lowContrastImage, highContrastImage};

    
figure,imshow(imagePath),title('Original Image')    
lowContrastImage = uint8(lowContrastImage);
figure,imshow(lowContrastImage),title('Low Contrast Image')
highContrastImage = uint8(highContrastImage);
figure,imshow(highContrastImage),title('High Contrast Image')

end
