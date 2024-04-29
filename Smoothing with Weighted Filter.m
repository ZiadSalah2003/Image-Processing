function smoothed = weightedFilterCustom(imagePath, kernel)
    if size(imagePath, 3) == 3
        imagePath = rgb2gray(imagePath);
    end
    [rows, cols] = size(imagePath);

    kernelSize = size(kernel, 1);
    pad = floor(kernelSize / 2);

    paddedImage = zeros(rows + 2 * pad, cols + 2 * pad);
    paddedImage(pad + 1:end - pad, pad + 1:end - pad) = double(imagePath);
    smoothed = zeros(rows, cols);
    for i = 1 + pad:rows + pad
        for j = 1 + pad:cols + pad
            neighborhood = paddedImage(i - pad:i + pad, j - pad:j + pad);
            weightedSum = 0;
            for m = 1:kernelSize
                for n = 1:kernelSize
                    weightedSum = weightedSum + neighborhood(m, n) * kernel(m, n);
                end
            end
            smoothed(i - pad, j - pad) = weightedSum;
        end
    end
    smoothed = uint8(smoothed / max(smoothed(:)) * 255);
    figure;
    subplot(1, 2, 1);
    imshow(imagePath);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(smoothed);
    title('Smoothed Image (Weighted Filter)');
end
