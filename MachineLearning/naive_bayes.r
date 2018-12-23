
install.packages("bnlearn");
library(bnlearn);

install.packages("caret", dependencies = TRUE);
library(caret);

particao = createDataPartition(1:20000, p = 0.7);

seguro_treino = insurance[particao$Resample1,];
seguro_teste = insurance[-particao$Resample1,];

dim(seguro_treino);
dim(seguro_teste);

modelo = naive.bayes(x=seguro_treino, training="Accident")
modelo
plot(modelo)

previsao = predict(modelo, seguro_teste)
previsao

confusionMatrix(previsao, seguro_teste$Accident)

help(naive.bayes)
help(table)