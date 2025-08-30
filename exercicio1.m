function t = exercicio1(func, x0)

% nao alterar: inicio
es = 1;      % Criterio de parada em porcentagem (erro relativo < 1%)
imax = 20;   % Numero maximo de iteracoes
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metodo: Secante Modificada
% Descricao: Este codigo calcula a raiz de 'func' usando o metodo da
%secante modificada, com um chute inicial 'x0'.
%%%%%%%%%%%%%%%%%%%%%%%%%%

% Inicializacao das variaveis do metodo
xr = x0;          % 'xr' e a nossa estimativa atual para a raiz (tempo t)
iter = 0;         % Contador de iteracoes
delta = 1e-6;     % Fator de perturbacao pequeno para aproximar a derivada
ea = 100;         % Erro relativo aproximado inicial (valor alto para garantir o inicio do loop)

% O loop continua enquanto o erro for maior que o permitido E
% o numero de iteracoes for menor que o maximo.
while (ea >= es && iter < imax)
    xrold = xr; % Salva o valor da raiz da iteracao anterior para calcular o erro

    % Numerador e denominador da formula da Secante Modificada
    fx = func(xr);
    fx_plus_delta = func(xr + delta * xr);
    denominator = fx_plus_delta - fx;

    % Verificacao para evitar divisao por zero, que pode ocorrer se a
    % funcao for muito plana na regiao.
    if abs(denominator) < 1e-15
        error('A derivada aproximada e muito proxima de zero. O metodo falhou.');
    endif

    % Calcula a proxima estimativa da raiz
    xr = xr - (fx * delta * xr) / denominator;

    % Incrementa o contador de iteracoes
    iter = iter + 1;

    % Calcula o erro relativo aproximado em porcentagem
    % Evita divisao por zero se a nova estimativa 'xr' for 0
    if xr ~= 0
      ea = abs((xr - xrold) / xr) * 100;
    endif
endwhile

% Se o loop terminou por excesso de iteracoes, exibe um aviso.
if ea >= es
  warning('O metodo nao convergiu em %d iteracoes. Erro final: %.2f%%', imax, ea);
endif

% Atribui o resultado final (a raiz encontrada) a variavel de saida 't'
t = xr;

%%%%%%%%%%%%%%%%%%%%%%%%%%
endfunction

