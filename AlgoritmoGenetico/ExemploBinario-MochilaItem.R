install.packages("GA");
library(GA)

itens = data.frame(item = c("canivete", "feijão", "batatas", "lanterna", "saco de dormir", "corda", "bussula"),
                   pontos = c(10, 20, 15, 2, 30, 10, 30),
                   peso = c(1, 5, 10, 1, 7, 5, 1));

itens

mochila = function(solucao) {

  peso = 0;
  pontos = 0;

  for (i in 1:7) {
    if (solucao[i] == 1) {
      peso = peso + itens[i, 3];
      pontos = pontos + itens[i, 2];
    }
  }

  if (peso > 15)
    pontos = 0;

  return(pontos);
}

resultado = ga("binary", #tipo de geração 
                fitness = mochila, #funação de avaliação
                nBits = 7, #numero de bits para o tipo de binary
                popSize = 10, #tamanho da população
                maxiter = 15, #quantidade maxima de iteração
                names = c("canivete", "feijão", "batatas", "lanterna", "saco de dormir", "corda", "bussula")); #mapeamento das x colunas (nbits) a fim de identificar o resultado

summary(resultado);
summary(resultado)$solution;
plot(resultado);
detach("package:GA");
