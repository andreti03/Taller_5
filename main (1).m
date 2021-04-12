a = img(250,250);
figure(1)
imshow(a);
figure(2)

img2 = transformacion_exp_z(a);
imshow(img2);

figure(3)

img3 = transformacion_cos_z(a);
imshow(img3);

x = rgb2gray(imread('esfera'));

% figure(4)
% 
% img4 = transformacion_cos_z(x);
% imshow(img4);
% 
% figure(5)
% 
% img5 = transformacion_cos_z(x);
% imshow(img5);