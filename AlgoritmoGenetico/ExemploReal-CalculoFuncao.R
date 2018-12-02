install.packages("GA");
library(GA);

funcao = function(valor) {
  ## Equacao f(x) => 2x + 5 = 20
  resultado = 2 * valor + 5;
  if (resultado > 20) {
    return(20 - resultado);
  }
  else {
    return(resultado - 20);
  }
}

resultado = ga(type = "real-value",
            fitness = funcao,
            min = c(-20),
            max = c(20),
            popSize = 10,
            maxiter = 10,
            monitor = T,
            names = c("a"));

summary(resultado);
summary(resultado)$solution
plot(resultado);
detach("package:GA");