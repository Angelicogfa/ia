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
