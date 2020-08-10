function [Sig] = fct_signature (coord)

%  TracerSurFenetre.m
%  fct_signature
%  fct_deter_ind
%  fct _init_acp

%  Sig{chiffre}=[Sig{chiffre} ; signature]
% signature : tableau des 9 x 9 cases : nombre binaire


% à partir du tableau de structures créé par TracerSurFenetre.m
% création des individus correspondant aux différents chiffres
% fct_signature permet de transformer les coord en signatures sur une
% grille de 10 x 10 cases
% une troisieme fonction permettra de déterminer le chiffre à
% partir de sa signature

for i=1:9
    Sig{i} = [];
end

Nb = size(coord, 2);    % nombre de tests
fprintf ('\nSignature de %d individus\n',Nb);
for i=1:Nb
    tracer = coord{i}.coord;        % tableau des points
    % on convertit le tracer en grille binaire
    minx = min(tracer(:,1));
    miny = min(tracer(:,2));
    maxx = max(tracer(:,1));
    maxy = max(tracer(:,2));
    % valeurs entre 0 et 1
    grille = zeros(9,9);
    for k=1:max(size(tracer))  % pour tous les points
        cx = round((tracer(k,1) - minx)/(maxx - minx)*9+1);
        cy = round(10 - (tracer(k,2) - miny)/(maxy - miny)*9);  % change orientation axe
       grille (cy, cx) = 1;  % permute x et y 
    end

    % transformation de grille en vecteur
    signature = [];
    for k=1:10  % pour toutes les lignes
        signature = [signature  grille(k,:)];
    end        
    
    fprintf ('\nIndividus : %d\n', coord{i}.chif);
    
    % ajout des signatures les une sous les autres
    Sig{coord{i}.chif} = [Sig{coord{i}.chif} ; signature];
end
