%Ziad Salah Hozain Ahmed   G1    20220068
function DM_1L(im,fact)
[r, c, ch]=size(im);
new_r = r*fact;
new_c = c*fact;
new_im = zeros(new_r,new_c, ch); 
for k=1:ch
    nn=0;
    for i=1:fact:new_r
        nn=nn+1;xx=0;
        for j=1:fact:new_c
            xx=xx+1;
            new_im(i,j,k)= im(nn,xx,k);
        end
    end
end
for k=1:ch
    for i=1:new_r
        for j=1:fact:new_c
            if j+fact<new_c
                cnt=1;
                if min(new_im(i,j,k),new_im(i,j+fact,k))==new_im(i,j,k)
                    for n=j+1:j+fact-1 
                        new_im(i,n,k)=round(((new_im(i,j+fact,k) - new_im(i,j,k))/fact)*cnt + new_im(i,j,k));
                        cnt=cnt+1;
                    end
                else
                    for n=j+fact-1:-1:j+1  
                        new_im(i,n,k)=round(((new_im(i,j,k) - new_im(i,j+fact,k))/fact)*cnt + new_im(i,j+fact,k));
                        cnt=cnt+1;
                    end      
                end    
            else
                for n=j+1:new_c 
                   new_im(i,n,k)= new_im(i,j,k);
               end
            end     
        end
    end
end
for k=1:ch
    for j=1:new_c
        for i=1:fact:new_r
            if i+fact<new_r
                cnt=1;
                if min(new_im(i,j,k),new_im(i+fact,j,k))==new_im(i,j,k)
                    for n=i+1:i+fact-1 
                        new_im(n,j,k)=round(((new_im(i+fact,j,k) - new_im(i,j,k))/fact)*cnt + new_im(i,j,k));
                        cnt=cnt+1;
                    end
                else
                    for n=i+fact-1:-1:i+1  
                        new_im(n,j,k)=round(((new_im(i,j,k) - new_im(i+fact,j,k))/fact)*cnt + new_im(i+fact,j,k));
                        cnt=cnt+1;
                    end      
                end    
            else
               for n=i+1:new_r 
                   new_im(n,j,k)= new_im(i,j,k);
               end
            end     
        end
    end
end
new_im = uint8(new_im);
figure,imshow(im),title('Original')
figure,imshow(new_im),title('Resized')