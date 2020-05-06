%% Additional constraints for MESS
%% Constraint 70
Sn70 = zeros(len.Sn);
Xm70 = zeros(len.Sn,len.Xm);
% Xg70 = zeros(len.Sn,len.Xg);

for ii = 1:len.Xm
    Sn70(data.c(ii),data.c(ii)) = -1;
    Xm70(data.c(ii),ii) = 1;
end
% for ii = 1:len.Xg
%     Sn70(data.gen(ii,2),data.gen(ii,2)) = 1;
%     Xg70(data.gen(ii,2),ii) = -1;
% end
    
A70 = zeros(len.Sn,len.total);
A70(:,inp.Xm) = Xm70;
A70(:,inp.Sn) = Sn70;
A70 = A70(any(A70,2),:);

b70 = zeros(size(A70,1),1);

ineq(70).A = concA(steps,A70);
ineq(70).b = concB(steps,b70);

%% Constraint 71 >> set Xm(1) = 1
Xm71 = zeros(1,len.Xm);
Xm71(1) = 1;
Aeq71 = zeros(1,len.total);
Aeq71(:,inp.Xm) = Xm71;
beq71 = 1;

equ(71).Aeq = initials(steps,Aeq71);
equ(71).beq = beq71;

%% Constraint 72 >> SKIPPED FOR LATER
abc = rout(data.c);
Xm72 = cell2mat(abc(:,1));
Aeq72 = zeros(size(Xm72,1),len.total);
Aeq72(:,inp.Xm) = Xm72;

%% Constraint 73 .. 5
Cm73 = eye(len.Cm);
Dm73 = eye(len.Dm);
Xm73 = -ones(1,len.Xm);

A73 = zeros(len.Cm,len.total);
A73(:,inp.Cm) = Cm73;
A73(:,inp.Dm) = Dm73;
A73(:,inp.Xm) = Xm73;

b73 = zeros(size(A73,1),1);
ineq(73).A = concA(steps,A73);
ineq(73).b = concB(steps,b73);

%% Constraint 74 .. 6
Pmc74 = eye(len.Pmc);
Cm74 = -eye(len.Cm).*data.mess(:,11);

A74 = zeros(len.Pmc,len.total);
A74(:,inp.Pmc) = Pmc74;
A74(:,inp.Cm) = Cm74;

b74 = zeros(size(A74,1),1);

ineq(74).A = concA(steps,A74);
ineq(74).b = concB(steps,b74);

%% Constraint 75 .. 7
Pmd75 = eye(len.Pmd);
Dm75 = -eye(len.Dm).*data.mess(:,15);

A75 = zeros(len.Pmd,len.total);
A75(:,inp.Pmd) = Pmd75;
A75(:,inp.Dm) = Dm75;

b75 = zeros(size(A75,1),1);

ineq(75).A = concA(steps,A75);
ineq(75).b = concB(steps,b75);

%% Constraint 76 .. 8
Qmc76 = eye(len.Qmc);
Cm76 = -eye(len.Cm).*data.mess(:,13);

A76 = zeros(len.Qmc,len.total);
A76(:,inp.Qmc) = Qmc76;
A76(:,inp.Cm) = Cm76;

b76 = zeros(size(A76,1),1);

ineq(76).A = concA(steps,A76);
ineq(76).b = concB(steps,b76);

%% Constraint 77 .. 9
Qmd77 = eye(len.Qmd);
Dm77 = -eye(len.Dm).*data.mess(:,17);

A77 = zeros(len.Qmd,len.total);
A77(:,inp.Qmd) = Qmd77;
A77(:,inp.Dm) = Dm77;

b77 = zeros(size(A77,1),1);

ineq(77).A = concA(steps,A77);
ineq(77).b = concB(steps,b77);

%% Constraint 78 .. 10
Emess78 = eye(len.Emess);
Emess78_bef = -eye(len.Emess);
Pmc78 = -eye(len.Pmc).*data.mess(:,8).*inthour;
Pmd78 = eye(len.Pmd)./data.mess(:,9).*inthour;

Aeq78 = zeros(len.Emess,len.total);
Aeq78(:,inp.Emess) = Emess78;
Aeq78(:,inp.Pmc) = Pmc78;
Aeq78(:,inp.Pmd) = Pmd78;

Aeq78_bef = zeros(len.Emess,len.total);
Aeq78_bef(:,inp.Emess) = Emess78_bef;
beq78 = zeros(size(Aeq78,1),1);

[equ(78).Aeq, equ(78).beq] = time_relate(steps,Aeq78_bef,Aeq78,beq78);

%% Constraint 79 .. 12
acp79 = eye(len.acp);
Xm79 = -eye(len.Xm).*data.mess(:,11);

A79 = zeros(len.Xm,len.total);
A79(:,inp.acp) = acp79;
A79(:,inp.Xm) = Xm79;

b79 = zeros(size(A79,1),1);

ineq(79).A = concA(steps,A79);
ineq(79).b = concB(steps,b79);

%% Constraint 80 .. 14
adp80 = eye(len.adp);
Xm80 = -eye(len.Xm).*data.mess(:,15);

A80 = zeros(len.Xm,len.total);
A80(:,inp.adp) = adp80;
A80(:,inp.Xm) = Xm80;

b80 = zeros(size(A80,1),1);

ineq(80).A = concA(steps,A80);
ineq(80).b = concB(steps,b80);

%% Constraint 81 .. 16
acq81 = eye(len.acq);
Xm81 = -eye(len.Xm).*data.mess(:,13);

A81 = zeros(len.Xm,len.total);
A81(:,inp.acq) = acq81;
A81(:,inp.Xm) = Xm81;

b81 = zeros(size(A81,1),1);

ineq(81).A = concA(steps,A81);
ineq(81).b = concB(steps,b81);

%% Constraint 82 .. 18
adq82 = eye(len.adq);
Xm82 = -eye(len.Xm).*data.mess(:,17);

A82 = zeros(len.Xm,len.total);
A81(:,inp.adq) = adq82;
A81(:,inp.Xm) = Xm82;

b82 = zeros(size(A82,1),1);

ineq(82).A = concA(steps,A82);
ineq(82).b = concB(steps,b82);

%% Constraint 83 .. 13
% A
Pmc83a = ones(len.Xm,len.Pmc);
Xm83a = eye(len.Xm).*data.mess(:,11);
acp83a = -eye(len.acp);

A83a = zeros(len.Xm,len.total);
A83a(:,inp.Pmc) = Pmc83a;
A83a(:,inp.Xm) = Xm83a;
A83a(:,inp.acp) = acp83a;

b83a = ones(len.Xm,1).*data.mess(:,11);

% B
acp83b = eye(len.acp);
Pmc83b = -eye(len.Pmc);

A83b = zeros(len.Xm,len.total);
A83b(:,inp.acp) = acp83b;
A83b(:,inp.Pmc) = Pmc83b;

b83b = zeros(len.Xm,1);

A83 = [A83a; A83b];
b83 = [b83a; b83b];

ineq(83).A = concA(steps,A83);
ineq(83).b = concB(steps,b83);

%% Constraint 84 .. 15
% A
Pmd84a = ones(len.Xm,len.Pmd);
Xm84a = eye(len.Xm).*data.mess(:,11);
adp84a = -eye(len.adp);

A84a = zeros(len.Xm,len.total);
A84a(:,inp.Pmd) = Pmd84a;
A84a(:,inp.Xm) = Xm84a;
A84a(:,inp.adp) = adp84a;

b84a = ones(len.Xm,1).*data.mess(:,11);

% B
adp84b = eye(len.adp);
Pmd84b = -eye(len.Pmd);

A84b = zeros(len.Xm,len.total);
A84b(:,inp.adp) = adp84b;
A84b(:,inp.Pmd) = Pmd84b;

b84b = zeros(len.Xm,1);

A84 = [A84a; A84b];
b84 = [b84a; b84b];

ineq(84).A = concA(steps,A84);
ineq(84).b = concB(steps,b84);

%% Constraint 85 .. 17
% A
Qmc85a = ones(len.Xm,len.Qmc);
Xm85a = eye(len.Xm).*data.mess(:,11);
acq85a = -eye(len.acq);

A85a = zeros(len.Xm,len.total);
A85a(:,inp.Qmc) = Qmc85a;
A85a(:,inp.Xm) = Xm85a;
A85a(:,inp.acq) = acq85a;

b85a = ones(len.Xm,1).*data.mess(:,11);

% B
acq85b = eye(len.acq);
Qmc85b = -eye(len.Qmc);

A85b = zeros(len.Xm,len.total);
A85b(:,inp.acq) = acq85b;
A85b(:,inp.Qmc) = Qmc85b;

b85b = zeros(len.Xm,1);

A85 = [A85a; A85b];
b85 = [b85a; b85b];

ineq(85).A = concA(steps,A85);
ineq(85).b = concB(steps,b85);

%% Constraint 86 .. 19
% A
Qmd86a = ones(len.Xm,len.Qmd);
Xm86a = eye(len.Xm).*data.mess(:,11);
adq86a = -eye(len.adq);

A86a = zeros(len.Xm,len.total);
A86a(:,inp.Qmd) = Qmd86a;
A86a(:,inp.Xm) = Xm86a;
A86a(:,inp.adq) = adq86a;

b86a = ones(len.Xm,1).*data.mess(:,11);

% B
adq86b = eye(len.adq);
Qmd86b = -eye(len.Qmd);

A86b = zeros(len.Xm,len.total);
A86b(:,inp.adq) = adq86b;
A86b(:,inp.Qmd) = Qmd86b;

b86b = zeros(len.Xm,1);

A86 = [A86a; A86b];
b86 = [b86a; b86b];

ineq(86).A = concA(steps,A86);
ineq(86).b = concB(steps,b86);

%% Constraint 87 .. 20
Pmessc87 = eye(len.Pmessc);
acp87 = ones(1,len.acp);

Aeq87 = zeros(len.Pmessc,len.total);
Aeq87(:,inp.Pmessc) = Pmessc87;
Aeq87(:,inp.acp) = acp87;

beq87 = zeros(size(Aeq87,1),1);

equ(87).Aeq = concA(steps,Aeq87);
equ(87).beq = concB(steps,beq87);

%% Constraint 88 .. 21
Pmessd88 = eye(len.Pmessd);
adp88 = ones(1,len.adp);

Aeq88 = zeros(len.Pmessd,len.total);
Aeq88(:,inp.Pmessd) = Pmessd88;
Aeq88(:,inp.adp) = adp88;

beq88 = zeros(size(Aeq88,1),1);

equ(88).Aeq = concA(steps,Aeq88);
equ(88).beq = concB(steps,beq88);

%% Constraint 89 .. 22
Qmessc89 = eye(len.Qmessc);
acq89 = ones(1,len.acq);

Aeq89 = zeros(len.Qmessc,len.total);
Aeq89(:,inp.Qmessc) = Qmessc89;
Aeq89(:,inp.acq) = acq89;

beq89 = zeros(size(Aeq89,1),1);

equ(89).Aeq = concA(steps,Aeq89);
equ(89).beq = concB(steps,beq89);

%% Constraint 90 .. 23
Qmessd90 = eye(len.Qmessd);
adq90 = ones(1,len.adq);

Aeq90 = zeros(len.Qmessd,len.total);
Aeq90(:,inp.Qmessd) = Qmessd90;
Aeq90(:,inp.adq) = adq90;

beq90 = zeros(size(Aeq90,1),1);

equ(90).Aeq = concA(steps,Aeq90);
equ(90).beq = concB(steps,beq90);

%% sigma xm < 1
Xm91 = ones(data.num_mess,len.Xm);

A91 = zeros(data.num_mess,len.total);
A91(:,inp.Xm) = Xm91;

b91 = ones(data.num_ess,1);

ineq(91).A = concA(steps,A91);
ineq(91).b = concB(steps,b91);


%% Check if there is input Xm
% Xbb = [0 0 0 0 0 0 0 0 0 0 0 1 0 0 1]';
% Xm100 = eye(len.Xm);
% Aeq100 = zeros(len.Xm,len.total);
% Aeq100(:,inp.Xm) = Xm100;
% 
% beq100 = Xbb;
% equ(100).Aeq = concA(steps,Aeq100);
% equ(100).beq = beq100;