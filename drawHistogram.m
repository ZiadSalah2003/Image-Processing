%Ziad Salah Hozain Ahmed   G1    20220068
function drawHistogram(imagePath)
    if size(imagePath, 3) == 3
        imagePath = color2gray(imagePath);
    end
    histogram = zeros(256, 1);
    [rows, cols] = size(imagePath);
    for row = 1:rows
        for col = 1:cols
            intensity = imagePath(row, col);
            histogram(intensity + 1) = histogram(intensity + 1) + 1;
        end
    end
    binLocations = 0:255;
    figure;
    bar(binLocations, histogram);
    title('Histogram of the Image');
    xlabel('Pixel Intensity');
    ylabel('Frequency');
    figure;
    imshow(imagePath);
    title('Original Image');
end
