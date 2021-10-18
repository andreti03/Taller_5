function f =  transformacion_exp_z(matriz_imagen)
    m = waitbar(0,'Transformacion e^z ...');
    pause(1)

    n = 255;
    x = linspace(-1,1,n);
    y = linspace(pi,-pi,n);
    tr = [];
    
    % Mapeo
    waitbar(0,m,'Mapeo ...');
    pause(1)
    for i = 1 : n
        A = x(i);
        for j = 1: n
            u = exp(A)*cos(y(j));
            v = exp(A)*sin(y(j));
            tr(j,i) = u+v*1i;
        end
        waitbar(i/n,m,'Calculando');
    end
    

    
    real_max = max(real(tr),[],'all');
    imag_max = max(imag(tr),[],'all');
    real_min = min(real(tr),[],'all');
    imag_min = min(imag(tr),[],'all');
    x_real = linspace(real_min,real_max,n);
    y_imag = linspace(imag_max,imag_min,n);
    
    [x_real,y_imag] = meshgrid(x_real,y_imag);
    tr_organizada = x_real + y_imag*1i;
    res_img = ones(n)*255;
    
    % Organiza la matriz
    
    for a = 1:n
        for b =1:n
            indice = find(abs(tr_organizada - tr(a,b)) <=0.1 ,1 ,'first');
            res_img(indice) = matriz_imagen(a,b);
        end
        waitbar(a/n,m,'Organizando Matriz ...');
    end
    res_img_copia = res_img;
    
    % Resultado final 
    
    for i = 1 : n
        for j = 1: n
            pixel = 255;
            for aux1 = -1:1
                for aux2 = -1:1
                    if res_img(i,j) == 255
                        if i+aux1 > 0 && i+aux1 < n+1 && j+aux2 > 0 && j+aux2 < n+1
                           if res_img(i+aux1,j+aux2) < pixel
                              pixel = res_img(i+aux1,j+aux2);
                           end 
                           
                        end 
                    else
                        pixel = res_img(i,j);
                    end
                end
            end
            res_img_copia(i,j) = pixel;
        end
        waitbar(i/n,m,'Compilando Imagen ...');
    end
        
     
    res_img = res_img_copia;
    delete(m)
    f = uint8(res_img);
    
end