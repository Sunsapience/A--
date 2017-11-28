%starA(M, A, B)
%STARA    根据A*算法计算两点间的最短路径
%   M为矩阵
%   A为起点
%   B为终点

clear;clc
M = [0 0 0 1 0 0 0;
     0 0 0 1 0 0 0;
     0 0 0 1 0 0 0;
     0 0 1 1 1 0 0;
     0 0 0 0 0 0 0;];
A = [3,2];
B = [3,6];
notCross = 1; % M中不能通过的点的值
%% ==============================================
global F G parent row

row = size(M, 1);
col = size(M, 2);

F = zeros(size(M));
G = zeros(size(M));
mov = [1 0;-1 0; 0 1;0 -1;-1 -1; -1 1; 1 -1; 1 1];
open = [A];
close = [];
parent = zeros(size(M));
inOpen = false(size(M));   % 是否在开放列表中
inClose = false(size(M));  % 是否在关闭列表中
%% ================================================
%
inOpen(A(1),A(2)) = true;
G(A(1),A(2)) = 0;
F(A(1),A(2)) = hn(A,B);
[index,min] = minInOpen(open);
while min(1)~=B(1)||min(2)~=B(2)   %结束条件(也就是终点被放入到)，
    open(index,:) = [];     %从开放列表中删除
    inOpen(min(1), min(2)) = false;
    close = [close;min];
    inClose(min(1), min(2)) = true;
    
    % 计算8领域中各点的fn，gn，hn。
    for i=1:8
        temp = min + mov(i,:);
        if temp(1)<=row&&temp(1)>0&&temp(2)<=col&&temp(2)>0
            if M(temp(1),temp(2)) ~= notCross&&inClose(temp(1),temp(2)) == false      % 该点可以通过且不在封闭列表中
                if inOpen(temp(1),temp(2)) == 0    %  不在开放列表中，加入open
                    parent(temp(1),temp(2)) = (min(2)-1)*row+ min(1);
                    open = [open;temp];
                    G(temp(1),temp(2)) = gn(temp);
                    F(temp(1),temp(2)) = G(temp(1),temp(2))+hn(temp,B);
                    inOpen(temp(1), temp(2)) = true;
                else           % 在开放列表中
                    gnn = norm(min-temp) + G(min(1),min(2)); %
                    if gnn < G(temp(1),temp(2))
                        parent(temp(1),temp(2)) = downRank(min);
                    end
                end
            end
        end
    end
    
    [index,min] = minInOpen(open);
end
% 回溯找路径
route =[B];
t=parent(B(1),B(2));
indA = downRank(A);
while t ~=  indA
    pc = upRank2(t);
    route = [route;pc];
    t=parent(t);
end


route = [route;A];
Path = zeros(5,7);
for kk=1:7
    Path(route(kk,1),route(kk,2))=1;
end
size(route)
imshow(Path);
disp(' The distance between A and B is :');
disp(G(B(1),B(2)));
disp(' Route as follows: (from B to A)');
disp(route);



