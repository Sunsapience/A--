function point = upRank(v)
%从一维变到二维
global row

% point(1) = v - (point(2)-1)*row;   
if rem(v,row)==0
    point(1) = row; 
else 
    point(1) = rem(v,row);
end

%  point(2) = floor(v/row);
if rem(v,row)==0
    point(2) = floor(v / row); 
else 
    point(2) = floor(v / row)+1;
end
end

