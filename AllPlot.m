%% Plot figures
%% ESS
figure
ESSplot = x(inp.Eess,:)./data.ess(:,4)'*100;
MESSplot = x(inp.Emess,:)./data.mess(:,4)'*100;
plot(ESSplot); hold on
plot(MESSplot);
ylim([9 40])

%% Active power generated
esscdp = [x(inp.Pessc,:); x(inp.Pessd,:)]';
Pesscd = Psoc(esscdp);

messcdp = [x(inp.Pmessc,:); x(inp.Pmessd,:)]';
Pmesscd = Psoc(messcdp);

figure
P_all = [Pesscd Pmesscd x(inp.Pg,:)']*data.MVAbase*1000;

bar(P_all,'stacked');

%% Reactive power generated
esscdq = [x(inp.Qessc,:); x(inp.Qessd,:)]';
Qesscd = Psoc(esscdq);

messcdq = [x(inp.Qmessc,:); x(inp.Qmessd,:)]';
Qmesscd = Psoc(messcdq);


figure
Q_all = [Qesscd Qmesscd x(inp.Qg,:)']*data.MVAbase*1000;

bar(Q_all,'stacked');

%% Function
function abc = Psoc(a)

abc = zeros(size(a,1),1);
for i = 1:size(a,1)
    [~, ind] = max(a(i,:));
    if ind == 1
        abc(i) = -max(a(i,:));
    else
        abc(i) = max(a(i,:));
    end
end
end