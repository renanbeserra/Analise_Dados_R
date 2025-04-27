# Aula 07 - Exercício

# Carregar, Limpar, Manipular e Exportar Dados

# Exercício

#Execute todos os passos da limpeza de dados do dataset caracóis marinhos apresentada nesta aula.

setwd('G:\\Meu Drive\\MESTRADO UFRPE (RURAL)\\Disciplinas\\Computação para Análise de Dados (CPAD)\\Exercícios\\')

Caracol_data <- read.csv(file = 'Snail_feeding.csv', header = T, strip.white = T, na.strings = "")
head(Caracol_data)
str(Caracol_data)

Caracol_data <- Caracol_data[, 1:7]
str(Caracol_data)

unique(Caracol_data$Sex)
levels(Caracol_data$Sex)  # precisa converta para fator
Caracol_data$Sex <- as.factor(Caracol_data$Sex) # converte em fator
levels(Caracol_data$Sex)

levels(Caracol_data$Sex)[2] <- "female"
levels(Caracol_data$Sex)[3] <- "male"
levels(Caracol_data$Sex)[3] <- "male"
levels(Caracol_data$Sex)
str(Caracol_data)

unique(caracol$Size)
which(is.na(Caracol_data$Size))
summary(Caracol_data)

levels(Caracol_data$Size) # precisa converter para fator
Caracol_data$Size <- as.factor(Caracol_data$Size) # converte em fator
levels(Caracol_data$Size)
str(Caracol_data)

Caracol_data$Distance <- as.numeric(Caracol_data$Distance)
str(Caracol_data)

#NAs
which(is.na(Caracol_data$Distance))
Caracol_data[682, "Distance"] <- 0.58
Caracol_data[755, "Distance"] <- 0.55
which(is.na(Caracol_data$Distance))
str(Caracol_data)

#Duplicadas
which(duplicated(Caracol_data))
index <- which(duplicated(Caracol_data)) ; index
Caracol_data <- Caracol_data[-index, ]
which(duplicated(Caracol_data))

summary(Caracol_data)
Caracol_data[which(Caracol_data$Depth > 2), ]
Caracol_data[8, "Depth"] <- 1.62

names(Caracol_data)
str(Caracol_data)
summary(Caracol_data)
head(Caracol_data)
tail(Caracol_data)

Caracol_data[order(Caracol_data$Distance, decreasing = T), ]

write.csv(Caracol_data, file = "caracol_exec_limpo.csv", row.names = F)


# Atividade

#Carregue o dataset do link abaixo. Esse dataset contém informações do peso do coração e corporal de 97 gatos adultos 
#que foram usados para experimentos com a droga "digitalis". Com posse desses dados responda as perguntas abaixo.  
#Qual foi a média do peso dos gatos  (Bwt) ? https://www.dropbox.com/s/w4xv9urbowbig3s/catsM.csv?dl=1 
gatos <- read.csv(file = "catsM.csv", header = T, strip.white = T, na.strings = "")
head(gatos)

mean(gatos$Bwt)

#Para as questões abaixo considere o dataset "Caracol_data_checked.csv". 
#Note que para você obter esse dataset você precisa executar todos os passos apresentado na aula de Manipulação Básica.
caracol <- read.csv(file = "caracol_exec_limpo.csv")
str(caracol)
head(caracol)

#Qual a média da profundidade (depth) dos caracóis marinhos?
mean(caracol$Depth)

#Qual foi a maior distância coletada para o Caracol Marinho Pequeno e Feminino ?
max(caracol$Distance[caracol$Size == "small" & caracol$Sex == "female"], na.rm = T)

#Para as questões abaixo carregue os dados do dataset Sparrows.csv.

#O arquivo de dados Sparrows.csv contém medidas de asa, tarso, cabeça e bico de duas espécies de pardal. 
#Use read.table(file = "Sparrows.csv", header = TRUE) para carregar os dados para um objeto chamado Sparrows. 
#Depois, use a função View () para exibir os dados. Note que algo deu errado! Todas as variáveis foram combinadas 
#em uma grande coluna. Qual foi o problema ?
setwd("C:\\Users\\Professor\\Documents\\Nova pasta")
pardal <- read.table(file = "Sparrows.csv", header = T, sep = ",")
View(pardal)
head(pardal)

#Qual o tamanho mínimo e máximo da cabeça da espécie "SSTS" ?
min(pardal$Head[pardal$Species == "SSTS"])
max(pardal$Head[pardal$Species == "SSTS"])

#Durante a entrada de dados, três linhas foram inseridas duas vezes. Quais são essas linhas duplicadas?
which(duplicated(pardal))

#Exiba os níveis do fator Sex. Veja que os níveis estão bagunçados. Altere de modo que a variável sexo 
#contenha apenas os níveis "Male" e "Female".  Por exemplo,  "Femal" deve ser "Female". Após isso, 
#determine qual é a media do tarso dos pardais femininos e masculinos.
str(pardal)
levels(pardal$Sex)
pardal$Sex <- as.factor(pardal$Sex)
levels(pardal$Sex)[1] <- "Female" 
levels(pardal$Sex)[2] <- "Female" 
levels(pardal$Sex)[3] <- "Male"
levels(pardal$Sex)
str(pardal)

mean(pardal$Tarsus[pardal$Sex == "Female"])
mean(pardal$Tarsus[pardal$Sex == "Male"])

#Digite o comando que verifica quais linhas na variável Wing contém NAs. Use a função which. 
#OBS.: Remova todos os espaços em branco.
which(is.na(pardal$Wing))

#Substitua todos os NAs da questão anterior pelos valores 59, 56.5 e 57 (nessa ordem). 
#Qual a média das asas dos pardais ?
pardal[64, "Wing"] <- 59
pardal[250, "Wing"] <- 56.5
pardal[806, "Wing"] <- 57
which(is.na(pardal$Wing))
mean(pardal$Wing)

#Qual o comando ordena o data frame pelas colunas Wing e Head e crie um novo objeto chamado de Sparrows_Ordenado ?
Sparrows_Ordenado <- pardal[order(pardal$Wing, pardal$Head), ]
Sparrows_Ordenado

#Salvar o dataset ordenado da questão anterior em outro arquivo
write.csv(Sparrows_Ordenado, file = "Sparrows_Ordenado.csv", row.names = F)
View(Sparrows_Ordenado)
