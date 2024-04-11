%Ziad Salah Hozain Ahmed   G1    20220068
function matched_image = histogramMatching(input_image1, input_image2)
    new_image = zeros(size(input_image1));
    
    red_channel1 = input_image1(:, :, 1);
    green_channel1 = input_image1(:, :, 2);
    blue_channel1 = input_image1(:, :, 3);
    
    input_image1 = histogramEqualization(input_image1);
    input_image2 = histogramEqualization(input_image2);
    
    histogram_red1 = zeros(1, 256);
    histogram_green1 = zeros(1, 256);
    histogram_blue1 = zeros(1, 256);
    histogram_red2 = zeros(1, 256);
    histogram_green2 = zeros(1, 256);
    histogram_blue2 = zeros(1, 256);
    red1 = input_image1(:, :, 1);
    green1 = input_image1(:, :, 2);
    blue1 = input_image1(:, :, 3);
    red2 = input_image2(:, :, 1);
    green2 = input_image2(:, :, 2);
    blue2 = input_image2(:, :, 3);
    matching_red = zeros(1, 256);
    matching_green = zeros(1, 256);
    matching_blue = zeros(1, 256);
    
    for i = 0:255
        histogram_red1(i + 1) = histc(red1(:), i);
        histogram_green1(i + 1) = histc(green1(:), i);
        histogram_blue1(i + 1) = histc(blue1(:), i);
    end
    
    for i = 0:255
        histogram_red2(i + 1) = histc(red2(:), i);
        histogram_green2(i + 1) = histc(green2(:), i);
        histogram_blue2(i + 1) = histc(blue2(:), i);
    end
    
    for i = 1:256
        subt_red = abs(histogram_red1(i) - histogram_red2);
        subt_green = abs(histogram_green1(i) - histogram_green2);
        subt_blue = abs(histogram_blue1(i) - histogram_blue2);
        
        min_red = min(subt_red);
        index_red = find(subt_red == min_red, 1);
        matching_red(i) = index_red;
        
        min_green = min(subt_green);
        index_green = find(subt_green == min_green, 1);
        matching_green(i) = index_green;
        
        min_blue = min(subt_blue);
        index_blue = find(subt_blue == min_blue, 1);
        matching_blue(i) = index_blue;
    end
    
    red1(:, :, 2) = red1(:, :, 1);
    green1(:, :, 2) = green1(:, :, 1);
    blue1(:, :, 2) = blue1(:, :, 1);
    red1 = double(red_channel1);
    green1 = double(green_channel1);
    blue1 = double(blue_channel1);
    
    for i = 0:255
        red3 = red1(:, :, 1);
        red2 = red1(:, :, 2);
        red3(red3 == i & red2 ~= -1) = matching_red(i + 1);
        red2(red2 == i) = -1;
        red1(:, :, 1) = red3;
        red1(:, :, 2) = red2;
        
        green3 = green1(:, :, 1);
        green2 = green1(:, :, 2);
        green3(green3 == i & green2 ~= -1) = matching_green(i + 1);
        green2(green2 == i) = -1;
        green1(:, :, 1) = green3;
        green1(:, :, 2) = green2;
        
        blue3 = blue1(:, :, 1);
        blue2 = blue1(:, :, 2);
        blue3(blue3 == i & blue2 ~= -1) = matching_blue(i + 1);
        blue2(blue2 == i) = -1;
        blue1(:, :, 1) = blue3;
        blue1(:, :, 2) = blue2;
    end
    
    new_image(:, :, 1) = red3(:, :, 1);
    new_image(:, :, 2) = green3(:, :, 1);
    new_image(:, :, 3) = blue3(:, :, 1);
    
    matched_image = uint8(new_image);
    figure;
    subplot(2, 2, 1), imshow(input_image1), title('Input Image 1');
    subplot(2, 2, 2), imshow(input_image2), title('Input Image 2');
    subplot(2, 1, 2), imshow(matched_image), title('Histogram Matching Result');
end