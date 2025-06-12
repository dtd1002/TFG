% Valor de referencia de glucosa (mg/dL)
G_ref = 126;
tol = 0.05 * G_ref; % Tolerancia ±5%

% === Análisis simout (Feedforward Estático) ===
t1 = out.simout.time;
y1 = out.simout.signals.values;

[val_max1, idx_max1] = max(y1);
t_pico1 = t1(idx_max1);
OS1 = ((val_max1 - G_ref) / G_ref) * 100;
idx_est1 = find(abs(y1 - G_ref) > tol);
t_est1 = t1(idx_est1(end));

% === Análisis simout1 (Feedforward Dinámico) ===
t2 = out.simout1.time;
y2 = out.simout1.signals.values;

[val_max2, idx_max2] = max(y2);
t_pico2 = t2(idx_max2);
OS2 = ((val_max2 - G_ref) / G_ref) * 100;
idx_est2 = find(abs(y2 - G_ref) > tol);
t_est2 = t2(idx_est2(end));

% === Tabla de resultados ===
tabla = table( ...
    [val_max1; val_max2], ...
    [OS1; OS2], ...
    [t_pico1; t_pico2], ...
    [t_est1; t_est2], ...
    'VariableNames', {'ValorMax_mg_dL', 'Sobreoscilacion_por', 'TiempoPico_s', 'TiempoEstablecimiento_s'}, ...
    'RowNames', {'Feedforward Estático', 'Feedforward Dinámico'});

% Mostrar resultados
disp('Resultados comparativos:')
disp(tabla)
