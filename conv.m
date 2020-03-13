input_image = imread('C:\Users\ahsan\Dropbox\6th Semester\DIP LAB\DIP LAB 5\two_cats.jpg');

conv_kernel = [1,2,1;2,4,2;1,2,1]
laplacian =[0,1,0;1,-4,1;0,1,0]
[kernel_h kernel_w] = size(laplacian);
[m n z]=size(input_image);

if z==3
    input_image = rgb2gray(input_image);
end

for i=1:m-2
    for j=1:n-2
        sum =0.0;
        x=0;
        y=0;
        for s=1:kernel_w
            for t=1:kernel_h
                sum =sum+( laplacian(s,t).*double(input_image(i+x,j+y)));
                y=y+1;
            end
        x=x+1;
        y=0;
        end
        conv_img(i,j)=uint8(sum);
    end
end

figure(1)
subplot(1,2,1)
imshow(input_image);
title('Original')
subplot(1,2,2)
conv_img = padarray(conv_img,[1,1],'symmetric','both');
conv_img = input_image-conv_img;
imshow(conv_img)
title('Convolved Image')