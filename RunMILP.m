% function x = RunMILP(equ,ineq,data,len,inp,inthour)
%% Testing the program
% Concatenate all the cells
Cequ = cell(size(equ,2),1);
Cbequ = Cequ;
for i = 1:size(equ,2)
    Cequ{i} = equ(i).Aeq;
    Cbequ{i} = equ(i).beq;
end
all_Aeq = cell2mat(Cequ);
all_beq = cell2mat(Cbequ);

Cineq = cell(size(ineq,2),1);
Cbineq = Cineq;
for i = 1:size(ineq,2)
    Cineq{i} = ineq(i).A;
    Cbineq{i} = ineq(i).b;
end
all_A = cell2mat(Cineq);
all_b = cell2mat(Cbineq);

% Check dimension
fprintf("Dimension of All_Aeq = %d x %d\n",size(all_Aeq,1),size(all_Aeq,2));
fprintf("Dimension of All_beq = %d x %d\n",size(all_beq,1),size(all_beq,2));
fprintf("Dimension of All_A = %d x %d\n",size(all_A,1),size(all_A,2));
fprintf("Dimension of All_b = %d x %d\n\n",size(all_b,1),size(all_b,2));

% Provide boundary
upper = Inf(len.total,1);
upper(inp.disc) = 1;
upper(inp.Emess) = data.mess(:,7).*data.mess(:,4);
% upper(inp.Pl) = data.load(:,4);
% upper(inp.Ql) = data.load(:,5);
% upper(inp.U) = 1.05^2;
% upper(inp.Eess) = data.ess(:,3) .* data.ess(:,6);

lower = -Inf(len.total,1);
lower(inp.disc) = 0;
lower(inp.Pmc) = 0;
lower(inp.Pmd) = 0;
lower(inp.Qmc) = 0;
lower(inp.Qmd) = 0;
lower(inp.adp) = 0;
lower(inp.acp) = 0;
lower(inp.adq) = 0;
lower(inp.acq) = 0;
lower(inp.Emess) = data.mess(:,6).*data.mess(:,4);

% Run MILP
charint(1,1:len.total) = 'C';
charint(1,inp.disc) = 'I';
decisionvar = zeros(len.total,1);
decisionvar(inp.Pl) = -data.load(:,6)*intmin*data.MVAbase*1000;
conchar = cell(1,steps);
conf = cell(steps,1);
conub = conf;
conlb = conf;

for i = 1:steps
    conchar{i} = charint;
    conf{i} = decisionvar;
    conub{i} = upper;
    conlb{i} = lower;
end
ctype = cell2mat(conchar);
ub = cell2mat(conub);
lb = cell2mat(conlb);
f = cell2mat(conf);

options = cplexoptimset('cplex');
options.display = 'on';
[y, fval, exitflag, output] = cplexmilp (f, all_A, all_b, all_Aeq, all_beq,...
    [ ], [ ], [ ], lb, ub, ctype, [ ], options);

x = reshape(y,length(y)/steps,steps);


