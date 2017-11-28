function v = hn(point,endp)
%HN    计算该点到终点的曼哈顿距离

v = abs(point(1)-endp(1)) + abs(point(2)-endp(2));
end