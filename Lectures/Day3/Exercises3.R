# Exploratory data analysis (EDA)

library(tidyverse)
library(ggplot2)
# Introduction to exploratory analysis

# example on dati2
library(medicaldata)

dati2 <- medicaldata::cytomegalovirus

# Histogram
ggplot(data = dati2) +
  geom_bar(mapping = aes(x = diagnosis))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("Diagnosis")

# 
ggplot(data = dati2) +
  geom_bar(mapping = aes(x = diagnosis))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("Diagnosis")


# Does a variable have nmore than one mean? (bimodal)
ggplot(data = dati2, mapping = aes(x = TNC.dose)) + 
  geom_histogram(binwidth = 0.9)+
  ggtitle("TNC dose")



# Outliers: values out of the mean range of the data

ggplot(data = dati2, mapping = aes(x = CD34.dose, y = time.to.cmv)) + 
  geom_point()

# drop the outliers
dati3 <- dati2 %>% 
  filter(between(CD34.dose, 0, 10))


ggplot(data = dati3, mapping = aes(x = CD34.dose, y = time.to.cmv)) + 
  geom_point()


dati2 %>% 
  count(diagnosis.type, aKIRs) %>%  
  ggplot(mapping = aes(x = diagnosis.type, y = as.factor(aKIRs))) +
  geom_tile(mapping = aes(fill = n))

#  Missing values
dati4<-  medicaldata::abm
