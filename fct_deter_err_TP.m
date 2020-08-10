function [Err] = fct_deter_err_TP (Phi, Vect, phi)
        
Phi = Phi'; 
Om = Vect'*(Phi - phi);
Phir = Vect*Om;
Err =1/(max(size(phi)))* ((Phi - phi) - Phir)'*((Phi - phi) - Phir);
 
 