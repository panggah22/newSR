function len = lengthbochen(data)

% Continuous variables
len.Pl = data.num_load; len.Pbr = data.num_branch; len.Pg = data.num_gen;
len.Pessc = data.num_ess; len.Pessd = len.Pessc;
len.Ql = len.Pl; len.Qbr = len.Pbr; len.Qg = len.Pg;
len.Qessc = len.Pessc; len.Qessd = len.Pessd; len.U = data.num_bus;
len.Eess = data.num_ess;
len.Pmc = data.num_mess*data.num_cand; len.Pmd = len.Pmc;
len.Qmc = len.Pmc; len.Qmd = len.Pmc;
len.Pmessc = len.Pmc; len.Pmessd = len.Pmc;
len.Qmessc = len.Pmc; len.Qmessd = len.Pmc;
len.adp = len.Pmc; len.acp = len.Pmc;
len.adq = len.Pmc; len.acq = len.Pmc;
len.Emess = len.Pmc;

% Discrete and binary variables
len.Sn = data.num_bus; len.Xl = len.Pl; len.Xbr = data.num_branch;
len.Xg = data.num_gen; len.Xessc = data.num_ess; len.Xessd = len.Xessc;
len.Xm = data.num_mess*data.num_cand;
len.Cm = len.Xm; len.Dm = len.Xm;

% len.total = len.Pl + len.Pbr + len.Pg + len.Pessc + len.Pessd ...
%     + len.Ql + len.Qbr + len.Qg + len.Qessc + len.Qessd + len.U + len.Eess...
%     + len.Sn + len.Xl + len.Xbr + len.Xg + len.Xessc + len.Xessd;
len.total = sum(cell2mat(struct2cell(len)));
% len.Ptot = len.Pl + len.Pbr + len.Pg + len.Pessc + len.Pessd;
% len.Qtot = len.Ql + len.Qbr + len.Qg + len.Qessc + len.Qessd;
% len.U = len.U;
% len.Eess = len.Eess;
% len.discrete = len.Sn + len.Xl + len.Xbr + len.Xg + len.Xessc + len.Xessd;

end