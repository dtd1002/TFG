% Asignación corregida de señales:
% simout    -> PS (Predictor de Smith)
% simout2   -> PI con ganancia reducida
% simout1   -> Escalón (referencia sin control)

% Predictor de Smith
y1 = out.simout;
t1 = y1.time;
s1 = y1.signals.values;

% PI con ganancia reducida
y2 = out.simout2;
t2 = y2.time;
s2 = y2.signals.values;

% Escalón de referencia
y3 = out.simout1;
t3 = y3.time;
s3 = y3.signals.values;

% Cálculo de métricas con stepinfo
info1 = stepinfo(s1, t1); % PS
info2 = stepinfo(s2, t2); % PI
info3 = stepinfo(s3, t3); % Escalón

% Mostrar métricas
disp("=== Predictor de Smith ===")
disp(info1)

disp("=== PI con Ganancia Reducida ===")
disp(info2)

disp("=== Escalón de Referencia ===")
disp(info3)

% Gráfica comparativa
figure
plot(t1, s1, 'LineWidth', 1.5)
hold on
plot(t2, s2, '--', 'LineWidth', 1.5)
plot(t3, s3, ':k', 'LineWidth', 1.2)
legend('Predictor de Smith', 'PI (K×0.5)', 'Escalón', 'Location', 'Best')
xlabel('Tiempo (s)')
ylabel('Glucosa (mg/dL)')
title('Comparación de Respuestas del Sistema')
grid on

