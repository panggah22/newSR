function inp = inputvariables(len)

% Input ranges (continuous)
inp.Pl = 0 + (1:len.Pl);
inp.Pbr = inp.Pl(end) + (1:len.Pbr);
inp.Pg = inp.Pbr(end) + (1:len.Pg);
inp.Pessc = inp.Pg(end) + (1:len.Pessc);
inp.Pessd = inp.Pessc(end) + (1:len.Pessd);
inp.Pmc = inp.Pessd(end) + (1:len.Pmc);
inp.Pmd = inp.Pmc(end) + (1:len.Pmd);
inp.Pmessc = inp.Pmd(end) + (1:len.Pmessc);
inp.Pmessd = inp.Pmessc(end) + (1:len.Pmessd);
inp.acp = inp.Pmessd(end) + (1:len.acp);
inp.adp = inp.acp(end) + (1:len.adp);

inp.Ql = inp.adp(end) + (1:len.Ql);
inp.Qbr = inp.Ql(end) + (1:len.Qbr);
inp.Qg = inp.Qbr(end) + (1:len.Qg);
inp.Qessc = inp.Qg(end) + (1:len.Qessc);
inp.Qessd = inp.Qessc(end) + (1:len.Qessd);
inp.Qmc = inp.Qessd(end) + (1:len.Qmc);
inp.Qmd = inp.Qmc(end) + (1:len.Qmd);
inp.Qmessc = inp.Qmd(end) + (1:len.Qmessc);
inp.Qmessd = inp.Qmessc(end) + (1:len.Qmessd);
inp.acq = inp.Qmessd(end) + (1:len.acq);
inp.adq = inp.acq(end) + (1:len.adq);

inp.U = inp.adq(end) + (1:len.U);
inp.Eess = inp.U(end) + (1:len.Eess);
inp.Emess = inp.Eess(end) + (1:len.Emess);


% Input ranges (discrete)
inp.Sn = inp.Emess(end) + (1:len.Sn);
inp.Xl = inp.Sn(end) + (1:len.Xl);
inp.Xbr = inp.Xl(end) + (1:len.Xbr);
inp.Xg = inp.Xbr(end) + (1:len.Xg);
inp.Xessc = inp.Xg(end) + (1:len.Xessc);
inp.Xessd = inp.Xessc(end) + (1:len.Xessd);
inp.Xm = inp.Xessd(end) + (1:len.Xm);
inp.Cm = inp.Xm(end) + (1:len.Cm);
inp.Dm = inp.Cm(end) + (1:len.Dm);

inp.cont = 1:inp.Emess(end); % Range of continuous var
inp.disc = inp.Sn(1):inp.Dm(end); % Range of discrete var

end