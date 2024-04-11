%Ziad Salah Hozain Ahmed   G1    20220068
function resultImages = addSubtractImages(imagePath1, imagePath2)
    if ~isequal(size(imagePath1), size(imagePath2))
        imagePath1 = imresize(imagePath1, size(imagePath2));
    end
    image1_double = double(imagePath1);
    image2_double = double(imagePath2);
    addResult = uint8(image1_double + image2_double);
    subtractResult = uint8(image1_double - image2_double);
    figure;
    subplot(2, 2, 1);
    imshow(imagePath1);
    title('Image 1');
    subplot(2, 2, 2);
    imshow(imagePath2);
    title('Image 2');
    subplot(2, 2, 3);
    imshow(addResult);
    title('Image 1 + Image 2');
    subplot(2, 2, 4);
    imshow(subtractResult);
    title('Image 1 - Image 2');
    resultImages = {addResult, subtractResult};
end
