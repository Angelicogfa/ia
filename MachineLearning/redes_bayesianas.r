install.packages("bnlearn");
install.packages("caret", dependencies = TRUE);

library(bnlearn);
library(caret);

# help(hc);
#  hill-climbing
res = hc(insurance);
plot(res);

modelo = bn.fit(res, data = insurance);
modelo$GoodStudent;

cpquery(modelo, event = (Accident == "Moderate" | Accident == "Severe"),
evidence = (Age == "Senior" & RiskAversion == "Adventurous" & MakeModel == "SportsCar"));
