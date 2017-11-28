function point = upRank(v)
%从一维变到二维
global row
point(2) = floor(v / row)+1;
point(1) = v - (point(2)-1)*row;   
end

