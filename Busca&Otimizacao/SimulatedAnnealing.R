## Achar os valores para a função f(x) = (1-x)² + 100(y-x²)² em que esta retorne 0

install.packages("GenSA", dependencies = TRUE);

library(GenSA);
## help(GenSA);

processamento <- function(dados) {
  x = dados[1];
  y = dados[2];

  result = (1 - x) ^ 2 + 100 * (y - x ^ 2) ^ 2;
  return(result);
}

# o altoritmo de simulated annealing buscará gerar valores que atendão a condição.
# este algoritmo tem como base que o menor valor é o ideal
result = GenSA(lower = c(0, 0), upper = c(9, 9), fn = processamento, control = list(verbose = TRUE));
result$par;
detach("package:GenSA", unload = TRUE);
