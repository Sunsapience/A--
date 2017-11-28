function [v] = downRank(point)
%从二维坐标变到一维
global row
v = (point(2)-1)*row+ point(1);
end