function v = gn(point)
%GN    计算该点到起点的距离

global G parent
pr = parent(point(1),point(2)); %一维索引
          
%一维索引转换为二维索引
pc = upRank2(pr);    
ed = norm(pc-point);   % 欧式距离
v = G(pr) + ed;
end

