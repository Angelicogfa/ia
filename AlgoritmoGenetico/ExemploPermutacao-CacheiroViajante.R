install.packages("GA", dependencies = TRUE);

library(GA);

mapa = data.frame(cidades = c("lindem", "parika", "lethen", "rosignol", "new amsterdan"),
                  lindem = c(0, 10, 8, 9, 25),
                  parika = c(10, 0, 10, 21, 12),
                  lethen = c(8, 10, 0, 10, 13),
                  rosignol = c(9, 21, 10, 0, 14),
                  newamsterdan = c(25, 12, 13, 14, 0))

mapa

percurso = function(solucao) {

  distancia = 0;

  for (i in 1:4) {
    cidade1 = solucao[i];
    cidade2 = solucao[i + 1];

    distancia = distancia + mapa[cidade1, cidade2];
  }

  return(-distancia);
}

resultado = ga(type = "permutation",
              fitness = percurso,
              min = c(1, 1, 1, 1, 1),
              max = c(5, 5, 5, 5, 5),
              popSize = 10,
              maxiter = 20,
              names = c("lindem", "parika", "lethen", "rosignol", "new amsterdan"));

summary(resultado);
summary(resultado)$solution
plot(resultado);
