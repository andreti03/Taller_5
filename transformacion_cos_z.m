function f = transformacion_cos_z(matriz_imagen)
    size_matriz = size(matriz_imagen);
    n = 250
    x = linspace(-1,1,n);
    y = linspace(pi,-pi,n);
    transformacion = [];
    
    for i = 1 : n
        for j = 1: n
            u=cos(x(j))*cosh(y(i));
            v=sin(x(j))*sinh(y(i));
            transformacion(i,j) = u+v*1i;
        end
    end
    
    real_max = max(real(transformacion),[],'all');
    imag_max = max(imag(transformacion),[],'all');
    real_min = min(real(transformacion),[],'all');
    imag_min = min(imag(transformacion),[],'all');
    x_real = linspace(real_min,real_max,n);
    y_imag = linspace(imag_max,imag_min,n);
    [x_real,y_imag] = meshgrid(x_real,y_imag);
    transformacion_organizada = x_real + y_imag*1i;
    resultado_imagen = ones(n)*255;
    
    for i = 1:n
        for j =1:n
            indice = find(abs(transformacion_organizada - transformacion(i,j)) <=0.1 ,1 ,'first');
            resultado_imagen(indice) = matriz_imagen(i,j);
        end
    end
    resultado_imagen_copia = resultado_imagen;
    for i = 1 : n
        for j = 1: n
            pixel = 255;
            for aux1 = -1:1
                for aux2 = -1:1
                    if resultado_imagen(i,j) == 255
                        if i+aux1 > 0 && i+aux1 < n+1 && j+aux2 > 0 && j+aux2 < n+1
                           if resultado_imagen(i+aux1,j+aux2) < pixel
                              pixel = resultado_imagen(i+aux1,j+aux2);
                           end 
                           
                        end 
                    else
                        pixel = resultado_imagen(i,j);
                    end
                end
            end
            resultado_imagen_copia(i,j) = pixel;
        end
    end
        
     
    resultado_imagen = resultado_imagen_copia;
    
    f = (uint8(resultado_imagen));
end