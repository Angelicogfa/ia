## Problema da loja 7,11
## Criar um algoritmo que busque os itens que se somando e multiplicando os preços destes o valor será 7.11

install.packages("tabuSearch", dependencies = TRUE);

library(tabuSearch);
## help(tabuSearch);

# Itens da mochila com os respectivos preços
itens = c(1.10, 1.20, 1.25, 1.41, 1.50, 1.63, 2.05, 2.22, 2.65, 2.90, 3.04, 3.16);

compras <- function(lista) {

  produto = 1;
  soma = 0;

  for (indice in 1:12) {
    if (lista[indice] == 1) {
      produto = produto * itens[indice];
      soma = soma + itens[indice];
    }
  }

  if (produto == 7.11 & soma == 7.11) {
    return(7.11);
  } else {
    return (0);
  }
}

# o algoritmo de tabu search vai gerar um array de x valores (12 - com base na quantidade de itens) durante x iterações (1000)  e tentará encontrar
# os itens que satisfarão a condição imposta pelo problema.
# o algoritmo de tabusearch busca sempre o melhor resultado (maior)
result = tabuSearch(size = 12, iters = 1000, objFunc = compras, listSize = 9,
                    nRestarts = 10, repeatAll = 1, verbose = TRUE);

# result;
plot(result);
# summary(result);
summary(result, verbose = TRUE);
detach("package:tabuSearch", unload = TRUE)
