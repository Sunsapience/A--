function [index,mc] = minInOpen(open)
%MININOPEN    计算open列表中fn最小的节点
%   OPEN为开放列表
%   
global F
mv =  99999999; 
for ii=1:size(open,1)
     v = F(open(ii,1),open(ii,2));
    if v<mv
        mv = v;
        mc = open(ii,:);
        index = ii;
    end
end
end