load('C:\Users\Ordi\Documents\MATLAB\TP DIAG-SIG\sig1')
%base_sig=fen_g(sig1,200)
%plot(base_sig)
%hold
%plot(sig1,'y')

s=[rand(1,100)*0.2+3 rand(1,100)*0.4+4];
[Mi, Sigest] = fct_EWMA_TP (s, 0.5)

%load mesures
%[Mi, Sigest] = fct_EWMA_TP (mesures, 0.5)

%load donnees
%[Mi, Sigest] = fct_EWMA_TP (X1, 0.5)

base_sig=fen_g(mesures,200)
[Mi, Sigest] = fct_EWMA_TP (mesures, 0.5)

%hold
%plot(sig1,'y')