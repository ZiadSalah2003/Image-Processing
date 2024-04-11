%Ziad Salah Hozain Ahmed   G1    20220068
function gray_image = color2grayscc(rgb)
    [m,n,~] = size(rgb);
    gray_image = zeros(m,n);
    for i = 1:m
        for j = 1:n
            gray_image(i,j) = rgb(i,j,2);
        end
    end
    gray_image = uint8(gray_image);
    figure,imshow(rgb),title('Original Image');
    figure,imshow(gray_image),title('Gray Image');
end