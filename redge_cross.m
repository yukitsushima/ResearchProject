function SE = redge_cross(X, y, alpha)
%REDGE_CROSS リッジ回帰の交差検証を行う
%   詳細説明をここに記述
[c1, ~] = size(X); % N * K
[c2, ~] = size(y); % N * 1
assert(c1 == c2, 'input dimension might be different');
devide = 4;
X1=zeros(1);X2=zeros(1);X3=zeros(1);X4=zeros(1);
y1=zeros(1);y2=zeros(1);y3=zeros(1);y4=zeros(1);
X1 = X(1,:);
y1 = y(1,:);
for i = 2 : round((c1/devide))
    X1 = [X1; X(i,:)];
    y1 = [y1; y(i,:)];
end
X2 = X(round(c1/devide)+1,:);
y2 = y(round(c1/devide)+1,:);
for i = round(c1/devide)+2 : round(c1*2/devide)
    X2 = [X2; X(i,:)];
    y2 = [y2; y(i,:)];
end
X3 = X(round(c1*2/devide)+1,:);
y3 = y(round(c1*2/devide)+1,:);
for i = round(c1*2/devide)+2 : round(c1*3/devide)
    X3 = [X3; X(i,:)];
    y3 = [y3; y(i,:)];
end
X4 = X(round(c1*3/devide)+1,:);
y4 = y(round(c1*3/devide)+1,:);
for i = round(c1*3/devide)+2 : c1
    X4 = [X4; X(i,:)];
    y4 = [y4; y(i,:)];
end
X123 = [X1; X2; X3]; y123 = [y1; y2; y3];
X124 = [X1; X2; X4]; y124 = [y1; y2; y4];
X134 = [X1; X3; X4]; y134 = [y1; y3; y4];
X234 = [X2; X3; X4]; y234 = [y2; y3; y4];
t123 = calc_regression_coefficient(X123,y123,alpha);
t124 = calc_regression_coefficient(X124,y124,alpha);
t134 = calc_regression_coefficient(X134,y134,alpha);
t234 = calc_regression_coefficient(X234,y234,alpha);
error = 0;
error = error + sum(y4 - X4 * t123);
error = error + sum(y3 - X3 * t124);
error = error + sum(y2 - X2 * t134);
error = error + sum(y1 - X1 * t234);
SE = error / 4;
end
