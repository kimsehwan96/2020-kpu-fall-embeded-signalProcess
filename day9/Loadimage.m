function img_Array = Loadimage(img_name,row,col)
    img_read1 = fopen(img_name,'r');
    img_read2 = fread(img_read1,row*col,'uint8=>uint8');
    img_Array = reshape(img_read2,row,col);
    img_Array = img_Array';
end

    
    