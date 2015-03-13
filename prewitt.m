function output = prewitt(file_path,winSize)
%-----Ali Rahman---------
%My implementation of the prewitt filter.
%winSize example: If winSize=5, then window is a 5x5 matrix
%file_path=image file path e.g. '.../abc.jpg'
source=imread(file_path);
source=rgb2gray(source);
[h w]=size(source);

max_mag=(winSize-1)/2;
val=-(max_mag);
for i=1:winSize
    for j=1:winSize
       prew_y(i,j)=val;
       prew_x(j,i)=val;
    end
    val=val+1;
        
end

edge_x=conv2(double(source),prew_x,'same');
edge_y=conv2(double(source),prew_y,'same');
output=edge_x+edge_y;
output=uint8(output);
figure(1);
imshow(source);
title('Original Image');
figure(2);
imshow(uint8(edge_x));
title('Vertical Edges');
figure(3);
imshow(uint8(edge_y));
title('Horizontal Edges');
figure(4);
imshow(output);
title('Prewitt Filtered');
end
    
  
