function smoothedImage = meanFilterCustom(imagePath, kernelSize)
    if size(imagePath, 3) == 3
        imagePath = rgb2gray(imagePath);
    end
    [rows, cols] = size(imagePath);
    smoothedImage = zeros(rows, cols, 'uint8');

    pad = floor(kernelSize / 2);

    paddedImage = zeros(rows + 2 * pad, cols + 2 * pad, 'double');
    paddedImage(pad + 1:end - pad, pad + 1:end - pad) = double(imagePath);

    for i = 1 + pad:rows + pad
        for j = 1 + pad:cols + pad
            % Extract the local neighborhood
            neighborhood = paddedImage(i - pad:i + pad, j - pad:j + pad);

            meanValue = sum(neighborhood(:)) / (kernelSize^2);

            smoothedImage(i - pad, j - pad) = uint8(meanValue);
        end
    end

    figure;
    subplot(1, 2, 1);
    imshow(imagePath);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(smoothedImage);
    title('Smoothed Image (Mean Filter)');
end
