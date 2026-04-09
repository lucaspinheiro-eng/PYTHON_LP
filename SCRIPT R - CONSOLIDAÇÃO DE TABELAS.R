install.packages("tidyverse")
library("tidyverse")

# IBGE é o nome da coluna com o código 

arquivo1 <- arquivo_baixado1 %>% 
  
  group_by(IBGE, População_total, Nom_Mun, Nom_Região) %>% 
  
  summarise(
    
    across(where(is.numeric), sum, na.rm = TRUE),
    
    .groups = "drop"
    
  )


# Agora faz o join com arquivo2 (1 linha por município)

Consolidacao <- G4_AA_ %>% 
  left_join(G4_ES_, by = "cod_IBGE")

Consolidacao [,5] <- NULL
 




install.packages("openxlsx")
library("openxlsx")

# Exporta o objeto para um arquivo .xlsx na pasta de trabalho atual
write.xlsx(
  x     = Consolidacao_G4_AA_ES_v2,
  file  = "consolidação_g4_aa_es_v2.xlsx",
  overwrite = TRUE  , # substitui se já existir
  NA.rm = FALSE
)

str(G4_ES_)
summary(G4_ES_)
getwd()
