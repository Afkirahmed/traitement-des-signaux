function  [clas] = fct_err_TP (TSig, Vect, Xmoy)

Class = size(Vect,2);   
for i=1:Class   
    if (~isempty(Vect{i}))
        Err(i) = fct_deter_err_TP (TSig, Vect{i}, Xmoy{i});        
        fprintf ('\nErreur par rapport à Ind%d : %6.2f', i,Err(i));
    else
        Err(i)=inf;  
    end
end
Err = round(100*Err)/100;
[m, clas] = min(Err);

poss = find(Err == m);
if (max(size(poss) > 1))
    fprintf ('\nClasse %d', poss);
else
    fprintf ('\nClasse %d', clas);
end
fprintf ('\n\n');