% src_test_TP
% script de test


load coord_chiffre   % (1, 2, 3 et 4)
clear global coord
global coord

 
 [Sig] = fct_signature (coord_sauv);
 [Vect, val, Xmoy] = fct_base_TP (Sig);
 
 TracerSurFenetre (2);  % ou autre chiffre
  
 [sigtest] = fct_signature (coord);
 [clas] = fct_err_TP (sigtest{2}, Vect, Xmoy);