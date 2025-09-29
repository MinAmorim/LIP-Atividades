fun {Pascal R C}
   if C == 1 then 1
   elseif C == R then 1
   else {Pascal R-1 C-1} + {Pascal R-1 C}
   end
end

1. Especificação (S):
A função Pascal(R, C) calcula o coeficiente binomial C(R-1, C-1) para todo 1 <= C <= R.

2. Casos Base (C=1 ou C=R):
- A função retorna 1.
- A especificação exige C(R-1, 0) (para C=1) ou C(R-1, R-1) (para C=R).
- Ambos os coeficientes são matematicamente iguais a 1.
- Portanto, os casos base estão corretos.

3. Passo Indutivo (caso "else"):
- Hipótese de Indução (HI): Assumimos que Pascal(R-1, K) está correto, ou seja, calcula C(R-2, K-1).
- O passo recursivo calcula: Pascal(R-1, C-1) + Pascal(R-1, C).
- Usando a (HI), a expressão se torna: C(R-2, C-2) + C(R-2, C-1).
- Pela Identidade de Pascal, sabemos que essa soma é exatamente igual a C(R-1, C-1).
- Este resultado é o que a especificação (S) exige para Pascal(R, C).
- Portanto, o passo indutivo está correto.
