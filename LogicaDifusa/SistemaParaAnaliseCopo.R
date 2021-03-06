# install.packages("sets");
library(sets);

sets_options("universe", seq(1, 200, 1));

variaveis = set(
    Quantidade = fuzzy_variable(
        Zero = fuzzy_triangular(corners = c(0, 25, 50)),
        UmQuarto = fuzzy_triangular(corners = c(25, 50, 75)),
        DoisQuartos = fuzzy_triangular(corners = c(75, 100, 125)),
        TresQuartos = fuzzy_triangular(corners = c(125, 150, 175)),
        QuatroQuartos = fuzzy_triangular(corners = c(150, 175, 200))
    ),
    Classificacao = fuzzy_partition(varnames = c(TotalmenteVazio = 0, ParcialmenteVazio = 50, Metade = 100, ParcialmenteCheio = 150, TotalmenteCheio = 200), sd = 10)
);

regras = set(
    fuzzy_rule(Quantidade %is% Zero, Classificacao %is% TotalmenteVazio),
    fuzzy_rule(Quantidade %is% UmQuarto, Classificacao %is% ParcialmenteVazio),
    fuzzy_rule(Quantidade %is% DoisQuartos, Classificacao %is% Metade),
    fuzzy_rule(Quantidade %is% TresQuartos, Classificacao %is% ParcialmenteCheio),
    fuzzy_rule(Quantidade %is% QuatroQuartos, Classificacao %is% TotalmenteCheio)
);

sistema = fuzzy_system(variaveis, regras);
sistema;
plot(sistema);

inferencia = fuzzy_inference(sistema, list(Quantidade = 10));
inferencia;
plot(inferencia);

def = gset_defuzzify(inferencia);
def
plot(sistema$variables$Classificacao)
lines(inferencia, col = "blue", lwd = 4)
sets_options("universe", NULL);