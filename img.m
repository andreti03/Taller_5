function a = img(an,al)
    ancho = an;
    alto = al;
    for x = 1:ancho
        for y = 1:alto
            a(x,y)= uint8(y);
        end
    end
end

