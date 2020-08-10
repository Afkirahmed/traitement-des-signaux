function [base_sig1] = diag_sig(mes_sig1,fen)
[lig_mes,col_mes]=size(mes_sig1);
base_sig1=[];

% fênettre glissante
for i=1:col_mes-fen+1
    v=[];
    for j=1:lig_mes
        x=mes_sig1(j,[i:i+fen-1]);
        v=[v;mean(x);var(x)];
    end
    base_sig1=[base_sig1,v];
end

% centrage réduction sig1
for i=1:2*lig_mes
    base_sig1(i,:)=(base_sig1(i,:)-mean(base_sig1(i,:)))/std(base_sig1(i,:));
end

c=base_sig1*base_sig1';
plot(base_sig1)

%[vecp,valp]=eig(c); base_sig1=vecp'*base_sig1;base_sortie=vecp(:,end-1:end)'*base_sig1;
