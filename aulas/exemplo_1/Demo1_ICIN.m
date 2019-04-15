% Demo1_ICIN
% 
% Reconhecimento de Padroes Linearmente Nao-Separaveis
%
% Reconhecimento correto depende de:
% # camadas, # neuronios por camada, # funcao de ativacao
% # numero de epocas - Condicoes Iniciais, -Algoritmo de trein.   
%
% ICIN - Introducao ao Controle Inteligente Numerico
% @ AB - LARA/ENE/UnB 2008-2019

% Pattern - Padrao de entrada
P = [0 0 0 0 1 1 1 1; 0 0 1 1 0 0 1 1;0 1 0 1 0 1 0 1];
% Target - saida desejada
T = [1 0 0 1 0 0 1 0];

% PARTE 1 - rede Perceptron - camada ?nica

net1 = newp(P,T);% criando a rede

net1 = init(net1);% inicializando a rede

[net1, stats] = train(net1,P,T); %treinando a rede

OUT1 = net1(P)% verificar a sa?da


% PARTE 2 - Rede Linear - 2 camadas

net1 = newff(P,T,[1],{'purelin','purelin'},'traingd'); % criando a rede
net1 = init(net1); % inicializando a rede

net1.divideParam.testRatio = 0; % ajustando os parametros da rede
net1.divideParam.valRatio = 0;
net1.divideParam.trainRatio = 1;

[net1, stats1] = train(net1,P,T);% treinando a rede

net2 = newff(P,T,[2],{'purelin','purelin'},'traingd');
net2 = init(net2);

net2.divideParam.testRatio = 0;
net2.divideParam.valRatio = 0;
net2.divideParam.trainRatio = 1;

[net2, stats2] = train(net2,P,T);

net3 = newff(P,T,[3],{'purelin','purelin'},'traingd');
net3 = init(net3);

net3.divideParam.testRatio = 0;
net3.divideParam.valRatio = 0;
net3.divideParam.trainRatio = 1;

[net3, stats3] = train(net3,P,T);

epochs = stats1.epoch; % estabelendo um vetor base para o gr?fico

E1 = stats1.perf;% colocando os erros de cada rede em um vetor
E2 = stats2.perf;
E3 = stats2.perf;

plot(epochs,E1,'r',epochs,E2,'b--o',epochs,E3,'g')% plotando os vetores de erro

OUT1 = net1(P); %verificando a sa?da
OUT2 = net2(P);
OUT3 = net3(P);

output1 =  OUT1 > 0.5 % Estabelecendo se a sa?da da rede ser? condizente com a sa?da esperada
output2 =  OUT2 > 0.5 
output3 =  OUT3 > 0.5

% PARTE 3 - utiliza-se o mesmo codigo da parte 2 
% mudando apenas de 'purelin' para 'logsig'
net1 = newff(P,T,[1],{'logsig','purelin'},'traingd');

net1.divideParam.testRatio = 0;
net1.divideParam.valRatio = 0;
net1.divideParam.trainRatio = 1;

[net1, stats1] = train(net1,P,T);

net2 = newff(P,T,[2],{'logsig','purelin'},'traingd');

net2.divideParam.testRatio = 0;
net2.divideParam.valRatio = 0;
net2.divideParam.trainRatio = 1;

[net2, stats2] = train(net2,P,T);

net3 = newff(P,T,[3],{'logsig','purelin'},'traingd');

net3.divideParam.testRatio = 0;
net3.divideParam.valRatio = 0;
net3.divideParam.trainRatio = 1;

[net3, stats3] = train(net3,P,T);

epochs = stats1.epoch;

E1 = stats1.perf;
E2 = stats2.perf;
E3 = stats2.perf;

plot(epochs,E1,'r',epochs,E2,'b--o',epochs,E3,'g')
 
OUT1 = net1(P);
OUT2 = net2(P);
OUT3 = net3(P);

output1 = OUT1 > 0.5
output2 =  OUT2 > 0.5
output3 =  OUT3 > 0.5




% PARTE 4 
% utiliza-se o mesmo codigo da parte 3 mudando apenas 
% de 'traingd' para 'trainlm'%

net1 = newff(P,T,[1],{'logsig','purelin'},'trainlm');

net1 = init(net1);

net1.divideParam.testRatio = 0;
net1.divideParam.valRatio = 0;
net1.divideParam.trainRatio = 1;

[net1, stats1] = train(net1,P,T);

net2 = newff(P,T,[2],{'logsig','purelin'},'trainlm');

net2 = init(net2);

net2.divideParam.testRatio = 0;
net2.divideParam.valRatio = 0;
net2.divideParam.trainRatio = 1;

[net2, stats2] = train(net2,P,T);

net3 = newff(P,T,[3],{'logsig','purelin'},'trainlm');

net3 = init(net3);

net3.divideParam.testRatio = 0;
net3.divideParam.valRatio = 0;
net3.divideParam.trainRatio = 1;

[net3, stats3] = train(net3,P,T);

epochs1 = stats1.epoch;
epochs2 = stats2.epoch;
epochs3 = stats3.epoch;

E1 = stats1.perf;
E2 = stats2.perf;
E3 = stats3.perf;

plot(epochs1,E1,'r'), hold on
plot(epochs2,E2,'b--o')
plot(epochs3,E3,'g')
 
OUT1 = net1(P);
OUT2 = net2(P);
OUT3 = net3(P);

output1 = OUT1 > 0.5
output2 =  OUT2 > 0.5
output3 =  OUT3 > 0.5

