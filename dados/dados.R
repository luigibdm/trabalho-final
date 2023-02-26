{if(!require(devtools)) install.packages('devtools')}
if(!require(GetDFPData2)) devtools::install_github('msperlin/GetDFPData2')

library(GetDFPData2)
library(tidyverse)

### base completa
bd <- get_info_companies() 

# agrupa base completa por nome social
bd_nome_social <- bd %>% group_by(bd$DENOM_SOCIAL) %>% summarise(n())

# agrupa 
bd_situacao <- bd %>% group_by(bd$SIT_REG) %>% summarise(n())

# qtd de empresas ativas
ativas <- as.numeric(bd_situacao[1,2])


### base completa apenas com as empresas ativas
bd_ativas <- subset(bd, bd$SIT_REG=='ATIVO') #com filtro

bd_mercados <-  bd_ativas %>% group_by(bd_ativas$TP_MERC) %>% summarise(n())

names(bd_mercados) <- c('Mercado','QTD')

mercados <- bd_mercados[order(bd_mercados$QTD, decreasing = TRUE),]

bd_mercados$%Participação <- bd_mercados$QTD/ativas*100 

is.numeric(ativas)

view(mercados)
