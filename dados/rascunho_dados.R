library(GetDFPData2)
library(tidyverse)

df_info <- get_info_companies()

ativos <- df_info %>% group_by(df_info$SIT_REG) %>% summarise(n())

cnpj <- df_info %>% group_by(df_info$CNPJ) %>% summarise(n()) 


bno <- df_info %>% group_by(df_info$TP_MERC) %>% summarise(n())

bo <- subset(df_info, df_info$TP_MERC!='BALCÃO NÃO ORGANIZADO') #com filtro

social <- bo %>% group_by(df_info$DENOM_SOCIAL) %>% summarise(n())

comercial <- df_info %>% group_by(df_info$DENOM_COMERC) %>% summarise(n())

cd_cvm <- df_info %>% group_by(df_info$CD_CVM) %>% summarise(n())

#Atividade

empresas_atividades <- df_inf %>% group_by(df_info$SETOR_ATIV) %>% summarise(n())

total <- sum(empresas_atividades$`n()`)

tabela <- data.frame(empresas_atividades)

tabela2 <- order(tabela$n.., decreasing = TRUE)

tabela3 <- tabela[order(tabela$n.., decreasing = TRUE),]

tabela3$Participacao <- (tabela3$`QTD de Empresas`/total)*100

sum(tabela3$Participacao)

tabela3[1:15,]

length(tabela3$Atividade)

print(tabela3)

head(tabela)

names(tabela3) <- c("Atividade","QTD de Empresas")

view(tabela3)

#Controle Acionário

empresas_controle <- df_info %>% group_by(df_info$CONTROLE_ACIONARIO) %>% summarise(n())

tabela_controles <- data.frame(empresas_controle)

print(tabela_controles)

tabela_controles2 <- tabela_controles[order(tabela_controles$n.., decreasing = TRUE),]

print(tabela_controles2)

?colnames()

?data.frame

df_search <- search_company('ambev')

print(df_search)

## Mercados

empresas_mercados <- subset(df_info, df_info$SIT_REG=='ATIVO') #com filtro

empresas_mercados2 <-  empresas_mercados %>% group_by(empresas_mercados$TP_MERC) %>% summarise(n()) 
print(empresas_mercados2)

empresas_mercados3 <- df_info %>% group_by(df_info$TP_MERC) %>% summarise(n())


## Situação

empresas_situacao <- df_info %>% group_by(df_info$SIT_REG) %>% summarise(n())

?include
