clc
close
clear

%{

Nota:

Para Utilizar este codigo se debe elegir el punto que desea Correr, se
selecciona completamente la seccion del punto deseado y se presiona
'Ctrl+T'

%}


%% PUNTO 1
% 
% % Se crea la Matriz degrade 
% 
% a = img(255,255);
% 
% % Grafica la Primera Imagen 
% 
% figure(1)
% imshow(a);
% 
% % Transformacion de e^z
% 
% img2 = transformacion_exp_z(a);
% 
% % Grafica la transformacion de la Primera Imagen 
% 
% figure(2)
% imshow(img2);

%% PUNTO 2

% % Transformacion de Cos(z)
% 
% img3 = transformacion_cos_z(a);
% 
% % Grafica la transformacion de la Primera Imagen 
% 
% figure(3)
% imshow(img3);

%% PUNTO 3
% 
% % LECTURA IMAGEN
% 
% x = rgb2gray(imread('Leon.jpg'));
% 
% % Grafica la  Imagen 
% 
% figure(4)
% imshow(x);
% 
% % % Transformacion de e^z
% % 
% % img4 = transformacion_exp_z(x);
% % 
% % % Grafica la transformacion de la Imagen 
% % 
% % figure(5)
% % imshow(img4);
% 
% % Transformacion de Cos(z)
% 
% img5 = transformacion_cos_z(x);
% 
% % Grafica la transformacion de la Imagen 
% 
% figure(6)
% imshow(img5);
