%Ziad Salah Hozain Ahmed   G1    20220068
function Image=createNegative(old_Image)

[r,c,ch]=size(old_Image);
Image = zeros(r,c,ch); 
for k=1:ch
    for i=1:r
        for j=1:c
         Image(i,j,k)=255-old_Image(i,j,k);   
        end
    end
end
Image=uint8(Image);
old_Image = uint8(old_Image);
figure,imshow(Image),title('Original')
figure,imshow(old_Image),title('Negative')
end