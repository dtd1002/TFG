
u = out.u.Data;          % valores de entrada (insulina)
t = out.u.Time;          % tiempo
y = out.y.Data;         % valores de salida (glucosa)

Ts = t(2) - t(1);          % calculamos tiempo de muestreo

data_def = iddata(y, u, Ts);  % objeto para System Identification

systemIdentification

