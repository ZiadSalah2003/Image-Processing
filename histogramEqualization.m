%Ziad Salah Hozain Ahmed   G1    20220068
function equalizedImage = histogramEqualization(imagePath)
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
    runningSum = zeros(256, 1);
    runningSum(1) = histogram(1);
    for i = 2:256
        runningSum(i) = runningSum(i - 1) + histogram(i);
    end
    maxRunningSum = max(runningSum);
    normalizedRunningSum = runningSum / maxRunningSum;
    newRange = 255;
    scaledRunningSum = round(normalizedRunningSum * newRange);
    equalizedImage = zeros(rows, cols);
    for row = 1:rows
        for col = 1:cols
            intensity = imagePath(row, col);
            newIntensity = scaledRunningSum(intensity + 1);
            equalizedImage(row, col) = newIntensity;
        end
    end

    figure;
    subplot(1, 2, 1);
    imshow(imagePath, []);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(uint8(equalizedImage), []);
    title('Histogram Equalized Image');
end
