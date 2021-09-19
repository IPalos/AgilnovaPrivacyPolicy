% Ejemplo de aprendizaje de la funcion OR
% empleando un perceptron
clear all
clc
% inicializar perceptron
W = rand(1,4);      % Pesos aleatorios
X1 = [0 0 0];         % Valores de entrada
X2 = [0 0 1];
X3 = [0 1 0];
X4 = [0 1 1];
X5 = [1 0 0];
X6 = [1 0 1];
X7 = [1 1 0];
X8 = [1 1 1];
XT = [X1;X2;X3;X4;X5;X6;X7;X8];   %VECTOR DE DATOS DE ENTRADA

D = [0 1 1 1 1 1 1 1];
eta = 0.3;         %Constante para controlar la tasa de aprendizaje
epsilon = 0.1;      %Tolerancia

for i = 1:100     % EPOCA epoch
    MSE(i) = 0;     %Promedio del error (MSE=Error Cuadratico Medio)    
    for j = 1:8     %Hace el calculo una a una de las entradas
        X = XT(j,:);
        X = [1,X];
        d = D(j);
        u = W*X'; %u=w0*x0+w1*x1+w2*x2....... (Salida intermedia)
        if u>0
            y=1;
        else
            y=0;
        end            
        e = d-y;
        W = W+eta*X*e;
        MSE(i) = MSE(i)+e*e;
    end % =>j  
    MSE(i)=MSE(i)/4;
        if MSE(i)< epsilon
        break;
    end% =>if
end % =>i

%================== ETAPA DE PRUEBA ====================

count=0;    %Acumulador para porcentaje de éxito
 
for j = 1:8 %Se ingresan todas las combinaciones a la red
    X=XT(j,:);
    X=[1,X];
    s=W*X';
        if s > 0
            y = 1;
        else        %Se obtiene la salida de la red
            y = 0;
        end
    d=D(j);         %Se toma la deseada de la red
    fprintf('%d  :%d <->  %d \n',s,y,d);%visualización de pantalla
    if d==y         %Se verifica sin son iguales
        count=count+1;  %Se acumula en caso de exito
    end % =>if
end % =>j
i 
fprintf('reconocimiento=%f',(count*100)/8); %Calculo de porcentaje