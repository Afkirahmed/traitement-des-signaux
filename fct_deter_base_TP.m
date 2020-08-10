function [R, L, phi] = fct_deter_base_TP (X, nb)

[N,M] = size(X);
% vect moyen
phi = mean(X)';
ec_type = std(X,1)';  

X = fct_centre_reduit (X, 0);  % (Ind, 0) donnees uniquement centrées
% le centrage est obligatoire, la réduction ne l'est pas

[R, L] = eig(X'*X/N);
[L, pos] = sort(diag(L),'descend');   
 R = R(:,pos); 
 if (nb==0)  
      indic = find (L > 0.1*max(L));
 else
     indic = [1:nb];  %% 
 end
 R = R(:,indic);
 L = L(indic);

