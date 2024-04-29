%Ziad Salah Hozain Ahmed   G1    20220068
function Edge_detection_filters(imagePath,mask_type)
imagePath= color2gray(imagePath);
edge_img =edge(imagePath, mask_type);
edge_img=uint8(edge_img);


figure,imshow(imagePath),title('Original')
figure,imshow(edge_img),title('edge_img')
end