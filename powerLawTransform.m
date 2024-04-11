%Ziad Salah Hozain Ahmed   G1    20220068
function transformedImage = powerLawTransform(imagePath, gamma)
    if size(imagePath, 3) == 3
        imagePath = color2gray(imagePath);
    end
    normalizedImage = double(imagePath) / 255;
    transformedImage = uint8(255 * normalizedImage.^gamma);
figure,imshow(imagePath),title('Original Image')    
transformedImage = uint8(transformedImage);
figure,imshow(transformedImage),title(['Power-Law Transformed Image (\gamma = ' num2str(gamma) ')'])
end
