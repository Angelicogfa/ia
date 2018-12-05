install.packages("expert", dependencies = T);
library(expert);


# Especialistas: esp1, esp2, esp3
# Variavel de interesse: int

analise = list(esp1 = list(int = c(650, 800, 850)),
                esp2 = list(int = c(500, 600, 700)),
                esp3 = list(int = c(450, 650, 800)));

# probabilidades
prob = c(0.1, 0.5, 0.9);

inf = expert(analise, "weights", prob, w = c(0.1, 0.7, 0.2));
inf
hist(inf, col = "blue");
detach("package:expert");
