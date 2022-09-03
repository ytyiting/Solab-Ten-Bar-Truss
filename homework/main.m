% 最佳化主程式
x0 = [0.1;0.05]
A = [];
B = [];
Aeq = [];
Beq = [];
ub = [0.5;0.5];
lb = [0.001;0.001];
options = optimset("display","iter","Algorithm","sqp");
[x, fval, exitflag] = fmincon(@(x)obj(x), x0, A, B, Aeq, Beq, lb, ub, @(x)nonlcon(x),options);
