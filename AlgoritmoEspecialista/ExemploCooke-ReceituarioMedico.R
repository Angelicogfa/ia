install.packages("expert", dependencies = T);
library(expert);


# Especialistas: esp1, esp2, esp3
# Sementes: sem1, sem2
# Variavel de interesse: int

analise = list(esp1 = list(sem1 = c(75, 80, 85),
                           sem2 = c(10, 15, 20),
                           int = c(650, 800, 850)),
                esp2 = list(sem1 = c(80, 90, 95),
                           sem2 = c(25, 30, 35),
                           int = c(500, 600, 700)),
                esp3 = list(sem1 = c(65, 70, 80),
                           sem2 = c(20, 25, 30),
                           int = c(450, 650, 800)));

# probabilidades
prob = c(0.1, 0.5, 0.9);

# sementes verdadeiras
semver = c(80, 25);

# inferencia dos valores para o algoritmo
inf = expert(analise, "cooke", prob, semver);

# decision maler, combinação das avaliações dos especialistas
inf
hist(inf, col = "blue");

# comparando as distribuições agregado e especialista
par(bg = "white");
split.screen(c(2, 2));
screen(1);
hist(inf, col = "gray", main = "Distribuição agregada")

screen(2);
s = density(c(650, 800, 850));
plot(s, main = "Especialista 1");
polygon(s, col = "blue");

screen(3);
s = density(c(500, 600, 700));
plot(s, main = "Especialista 2");
polygon(s, col = "blue");

screen(4);
s = density(c(450, 650, 800));
plot(s, main = "Especialista 3");
polygon(s, col = "blue");
close.screen(all = TRUE)

# mais informações da inferencia
# quantile zero e 100 são calculados automaticamente
summary(inf);

# quantiles
quantile(inf);

# media dos quatis
mean(inf);

# distribuição cumulativa
dc = cdf(inf);
plot(dc);

# oviga, usado para mostrar a frequencia acumulada
og = ogive(inf);
plot(og)
