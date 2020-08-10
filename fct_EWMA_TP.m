function [Mi, Sigest] = fct_EWMA_TP(Seq, lambda,Seuil)
H = 80;
Mi(1:H) = mean (Seq(1:H)); % M0 = x0
N = max(size(Seq));
Sigi = std(Seq(1:H));
Sigest = Sigi*sqrt(lambda/(2-lambda));
LS = mean (Seq(1:H)) + Seuil*Sigest;
LI = mean (Seq(1:H)) - Seuil*Sigest;   
    
for i=H+1:N
    Mi(i) = lambda*Seq(i) + (1-lambda)*Mi(i-1);         
end
fprintf ('\nEcart-type : %f\n', Sigi);
fprintf ('\nEcart-type estim� : %f\n', Sigest);

N = N-H+1;

figure (3); 
hold off
plot ([1,N],[Mi(1) Mi(1)], 'g');
hold on
line ([1,N],[LS LS]);
line ([1,N],[LI LI]);
plot (Mi,'r');   