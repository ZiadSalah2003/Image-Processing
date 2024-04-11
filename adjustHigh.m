%Ziad Salah Hozain Ahmed   G1    20220068
function adjustedImage = adjustHigh(imagePath, newMin, newMax)
    if size(imagePath, 3) == 3
        imagePath = rgb2gray(imagePath);
    end
    oldMin = double(min(imagePath(:)));
    oldMax = double(max(imagePath(:)));
    adjustedImage = ((double(imagePath) - oldMin) / (oldMax - oldMin)) * (newMax - newMin) + newMin;
    adjustedImage(adjustedImage < newMin) = newMin;
    adjustedImage(adjustedImage > newMax) = newMax;
    figure;
    subplot(1, 2, 1);
    imshow(imagePath);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(uint8(adjustedImage));
    title('Adjusted Image');
end
