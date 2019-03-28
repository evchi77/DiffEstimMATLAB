close all
clear
clc
%%

s = tf('s');

Kp = 5;
Waper = 1/(1/Kp * s + 1);
Waper_est = s/(1/Kp * s + 1);
s1 = sprintf('Aperiodic filter, Kp = %.2f', Kp);

Kp = 5;
Ki = 5;
Wpi = (1 + Kp/Ki * s)/(1/Ki * s^2 + Kp/Ki * s + 1);
Wpi_est = s*(1 + Kp/Ki * s)/(1/Ki * s^2 + Kp/Ki * s + 1);
s2 = sprintf('PI-filter, Kp = %.2f, Ki = %.2f', Kp, Ki);

W_estimator_aperiodic = Waper*Waper_est;
W_estimator_pi = Wpi*Wpi_est;

%%
figure(1)
bode(W_estimator_aperiodic,W_estimator_pi);
legend(s1, s2);
grid on
grid minor
%%
figure(2)
step(W_estimator_aperiodic, W_estimator_pi)
grid on
grid minor
legend(s1, s2);

%% Для SIMULINK
N = 11; %имп/об
z = 21.3; %для 400 RPM max
n = 60;
h_T = 1/(N*n*z/60); %с/имп, т.е. шаг по времени
h_A = 360/(N*z); %шаг по углу




