function [Vect, val, Xmoy] = fct_base_TP (Sig, nb)

if (~exist('nb'))
    nb = 0;            % si non def mise à 0    
end
N = size(Sig,2);
for i=1:N
    if (~isempty(Sig{i}))
        [R, L, phi]  = fct_deter_base_TP (Sig{i}, nb);  
        Vect{i} = R;
        val{i} = L;
        Xmoy{i} = phi;
    end
end
