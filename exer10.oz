

(a) Executando o Exemplo Original

- Resultados: Ao executar o exemplo original várias vezes, o resultado pode ser 2, mas às vezes pode ser 1.

- Por que o resultado 1 é possível?
Isso acontece por uma race condition. A operação de incremento não é atômica e 
consiste em 3 passos: Ler, Calcular, Escrever. Uma intercalação ruim das threads causa o problema:

1. Thread 1 lê o valor de C (que é 0).
2. O sistema pausa a Thread 1.
3. Thread 2 lê o valor de C (que ainda é 0).
4. Thread 2 calcula 0 + 1 e escreve 1 em C.
5. O sistema volta para a Thread 1.
6. Thread 1, que já tinha lido 0, calcula 0 + 1 e também escreve 1 em C.

O trabalho da Thread 2 é sobrescrito e perdido. O resultado final é 1.


(b) Forçando o Resultado 1 com Delay

É possível forçar o resultado 1 de forma consistente adicionando um Delay entre a leitura e a escrita para 
garantir a intercalação ruim.

Código:
declare
C = {NewCell 0}
proc {IncComDelay}
   local X in
      X = @C
      {Delay 100}
      C := X + 1
   end
end
thread {IncComDelay} end
thread {IncComDelay} end
{Delay 500}
{Browse @C}


(c) Tentando Quebrar a Versão Correta com Lock

A versão correta usa um "lock" para criar uma "seção crítica", garantindo que a operação seja atômica. Tentar 
usar um Delay nesta versão NÃO quebra a sua corretude. O resultado será sempre 2.

Código:
declare
L = {NewLock}
C = {NewCell 0}
proc {IncComLockEDelay}
   lock L then
      local X in
         X = @C
         {Delay 100}
         C := X + 1
      end
   end
end
thread {IncComLockEDelay} end
thread {IncComLockEDelay} end
{Delay 500}
{Browse @C}

- O que acontece com o lock:
1. Thread 1 adquire o lock e entra na seção crítica.
2. Thread 1 lê C (valor 0) e pausa por causa do Delay.
3. Thread 2 tenta executar, mas para na instrução "lock L", pois o lock está ocupado. A Thread 2 fica bloqueada, esperando.
4. A pausa da Thread 1 termina, ela escreve 1 em C e libera o lock.
5. Só então a Thread 2 pode adquirir o lock, ler o valor de C (que agora é 1) e escrever 2.

O lock garante a "exclusão mútua" e impede a condição de corrida, independentemente dos delays.
