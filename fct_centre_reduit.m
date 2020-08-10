function [Ind] = fct_centre_reduit (Ind, reduit)
% Ind : individus � formater
% reduit : 1      r�duction des donn�es
%   0      pas de r�duction

Xmoy = mean (Ind);
Xstd = std (Ind,1);

N = size(Ind, 1);

if (reduit)
    Ind = (Ind -  ones(N,1)*Xmoy)./(ones(N,1)*Xstd);
else
    Ind = (Ind -  ones(N,1)*Xmoy);
end
