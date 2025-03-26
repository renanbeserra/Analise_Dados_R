#AULA 04 EXERCÍCIOS

# VETORES

# Escore padronizado

# Dada a tabela abaixo que representa uma competição entre piratas de beber (grogg) e escalar (climbing),  determine qual 
# pirata foi o vencedor. Dica: primeiro padronize os dados e depois calcule a média das duas colunas.
pirates <- c("Heidi", "Andrew", "Becki", "Madisen", "David")
grogg <- c(12, 8, 1, 6, 2)
climbing <- c(100, 520, 430, 200, 700)

grogg.z <- (grogg - mean(grogg)) / sd(grogg)
grogg.z

climbing.z <- (climbing - mean(climbing)) / sd(climbing)
climbing.z

media <- (grogg.z + climbing.z) / 2
media

vencedor <- pirates[which.max(media)]
cat("O pirata vencedor é:", vencedor)

#Defina a variável v1 como : (3, 7, -5,-7).
v1 <- c(3, 7, -5,-7)

#Defina a variável v2 como: (1, 2, 3, ... 48, 49, 50).
v2 <- 1:50

#Defina a variável v3 como: (3, 7, -5,-7 ,1, 2, 3, ... 48, 49, 50). Dica: use v1 e v2.
v3 <- c(v1, v2)
v3

#Defina a variável v4 como: (0.0, 0.1, 0.2, 0.3, ... 5.8, 5.9, 6.0).
v4 <- seq(0,6,0.1)
v4

#Defina a variável fumante com 99 elementos como: ("sim","não","não"," sim","não", "não” ,..., "sim", "não", "não").
simnao <- c("sim","não","não")
fumante <- rep(simnao, 33)
fumante
#ou
fum <- rep(c("sim", "não", "não"), length.out = 99)
fum

#Some todos os elementos de v1 e v2. Dica: use a função sum().
soma <- sum(v1,v2)
soma

#Calcule o produto dos elementos do vetor: (2, 30, 4, 5, 5). Dica: use a função prod().
produto <- prod(2, 30, 4, 5, 5)
produto

#Dado o vetor X <- c (NA, 3, 14, NA, 33, 17, NA, 41), crie um código que remove os NAs do vetor. Use a indexação lógica, numérica e which.
x <- c (NA, 3, 14, NA, 33, 17, NA, 41)
mx <- median(x, na.rm = TRUE)
x[c(1,4,7)] <- mx
x

x <- c (NA, 3, 14, NA, 33, 17, NA, 41)
is.na(x)
mx <- median(x, na.rm = TRUE)
x[is.na(x)] <- mx
x

x <- c (NA, 3, 14, NA, 33, 17, NA, 41)
is.na(x)
mx <- median(x, na.rm = TRUE)
x[which(is.na(x))] <- mx
x

#Dado o vetor X <- c (NA, 3, 14, NA, 33, 17, NA, 41), crie um código que conta o número de ocorrências de NAs.
x <- c (NA, 3, 14, NA, 33, 17, NA, 41)
is.na(x)
cont <- length(which(is.na(x)))
cont

#Dado o vetor X <- c (NA, 3, 14, NA, 33, 17, NA, 41) , crie um código em R substitui todas as ocorrências de NA por Zero.
x <- c (NA, 3, 14, NA, 33, 17, NA, 41)
is.na(x)
mx <- median(x, na.rm = TRUE)
x[is.na(x)] <- 0
x

#Vetores aceitam apenas um tipo de dados. O que acontece com os seguintes comandos: xx <- c(1.7, "a"), xx <- c(TRUE, 2), xx <- c("a", TRUE).
# Ordem da conversão de tipo de um vetor: chaterer->complex->numeric->integer->logical
#Os dois elemntos viram strings
xx <- c(1.7, "a")
xx
#O booleano vira inteiro
xx <- c(TRUE, 2)
xx
#O booleano vira string
xx <- c("a", TRUE)
xx

# Suponha que você tenha um vetor x <- 1:4 e y <- 2:3. O que é produzido pela expressão x * y?
x <- 1:4
y <- 2:3
x * y

#Dada a tabela no link abaixo que representa uma competição entre Maria e Joana,  determine quem foi a vencedora.  
#Dica: primeiro padronize os dados e depois calcule a média dos valores padronizados. 
#https://docs.google.com/drawings/d/1_szurYna3gDzTB3ht9AQlWChbq_KLcCMPNJ22J1ydZI/edit?usp=sharing
teste <- c("abdominais em 2 min","salto em extensão (cm)","suspensão braços flexionados (seg)","correr/andar em 12 min (m)","conhecimento desportivo")
media <- c(30,155,50,1829,75)
desviopadrao <- c(6,23,8,274,12)
testemaria <- c(42,102,38,2149,97)
testejoana <- c(38,173,71,1554,70)

maria.z <- (testemaria - media) / desviopadrao
maria.z

joana.z <- (testejoana - media) / desviopadrao
joana.z

mediaMaria <- mean(maria.z)
mediaMaria
mediaJoana <- mean(joana.z)
mediaJoana

if(mediaMaria > mediaJoana){
  vencedor <- "Maria é a vencedora!"
}else{
  vencedor <- "Joana é a vencedora!"
}

vencedor

#OU

# Vetores com os dados reais
media <- c(30, 155, 50, 1829, 75)  # Média das provas
desvio <- c(6, 23, 8, 274, 12)     # Desvio padrão das provas
maria <- c(42, 102, 38, 2149, 97)  # Valores de Maria
joana <- c(38, 173, 71, 1554, 70)  # Valores de Joana

# Cálculo do Z-score para cada competidora
maria_z <- (maria - media) / desvio
joana_z <- (joana - media) / desvio

# Cálculo da média dos Z-scores
media_maria <- mean(maria_z)
media_joana <- mean(joana_z)

# Determinar a vencedora
if (media_maria > media_joana) {
  vencedora <- "Maria"
} else {
  vencedora <- "Joana"
}

# Exibir o resultado
cat("A vencedora é:", vencedora)


#Para responder as questões abaixo, faça download do arquivo disponível em https://www.dropbox.com/s/6t7b44acy7yfczu/vetor.RData?dl=1 
#e mova-o para o seu diretório. Em seguida leia-o com o comando load(“vetor.RData”) . 
#O vetor01 possui 15.000 observações referentes às notas dos candidatos do concurso público para auxiliar administrativo da Prefeitura de São Longuinho. 
#Os dados foram disponibilizados pela empresa organizadora do concurso. 
#As notas variam de 0 a 10 e os candidatos que não realizaram a prova estão com NA nos respectivos campos. 
#De posse dos dados, responda as perguntas abaixo.
load("G:\\Meu Drive\\MESTRADO UFRPE (RURAL)\\Disciplinas\\Computação para Análise de Dados (CPAD)\\Exercícios\\Meu RCurso\\vetor.RData")

#Qual foi a média das notas ?
media_notas <- mean(vetor01, na.rm = TRUE)
media_notas

#Qual foi a mediana das notas ?
mediana_notas <- median(vetor01, na.rm = TRUE)
mediana_notas

#Qual o desvio padrão das notas ?
desviopadrao_notas <- sd(vetor01, na.rm = TRUE)
desviopadrao_notas

#Qual foi a quantidade de faltosos ?
qtdfaltosos <- length(which(is.na(vetor01)))
qtdfaltosos
mean(vetor01 == NA)

#Qual foi percentual de faltosos ?
percentual_faltosos <- sum(is.na(vetor01)) / length(vetor01)
percentual_faltosos

#Quantos candidatos obtiveram notas maiores do que 7.00 e menores do que 8.00 ?
qtd_entre_7_8 <- sum(vetor01 > 7 & vetor01 < 8, na.rm = TRUE)
qtd_entre_7_8

#Quantos candidatos obtiveram notas maiores do que 9.00 ou menores do que 1.00?
qtd_maior_9_menor_1 <- sum(vetor01 > 9 | vetor01 < 1, na.rm = TRUE)
qtd_maior_9_menor_1

#Quais os comandos removem os valores ausentes (NA) do vetor01 e guarda o resultado no próprio vetor01 ?
vetor01 <- vetor01[!is.na(vetor01)]
vetor01[!is.na(vetor01)] -> vetor01
vetor01 <- vetor01[-which(is.na(vetor01))]


class(vetor01)
head(vetor01,10)
summary(vetor01)
str(vetor01)


# FATORES

#Se x = c(1, 2, 3, 3, 5, 3, 2, 4, NA), quais são os níveis do fator (x)?
x = factor(c(1, 2, 3, 3, 5, 3, 2, 4, NA))
x # 1 2 3 4 5

#Execute e analise as seguintes intruções: 
#f <- factor(c("a", "a", "b", "c", "c", "d")), f[f == "a"], f[f %in% c("b", "c")], f[1:3] e f[-3].
f <- factor(c("a", "a", "b", "c", "c", "d"))
f
f[f == "a"] # todos que tem "a" = a a
f[f %in% c("b", "c")] # "b" e "c" contidos no fator f = b c c
f[1:3] # elementos da posição 1 à 3 = a a b
f[-3] # todos menos o elemento da posição 3 = a a c c d

#Categorize o vetor abaixo e identifique a frequência dos elementos usando o comando table(). 
#Além disso, organize os nomes dos meses para uma ordem que faça mais sentido. Ex.: January, February, March, etc.
# mths = c("March", "April", "January", "November", "January", "September", "October", "September", "November", "August", "January", "November", "November", "February", "May", "August", "July", "December", "August", "August", "September", "November", "February", "April")
mths <- c("March", "April", "January", "November", "January", "September", "October", "September", "November", "August", "January", "November", "November", "February", "May", "August", "July", "December", "August", "August", "September", "November", "February", "April")
mths
mths <- factor(mths, levels = c("January","February","March","April","May","June","July","August","September","October","November","December"), ordered = TRUE)
mths
table(mths)

#Considere o fator Resposta <- factor(c(”Concordo", "Concordo", "Concordo Plenamente", "Discordo", "Concordo")). 
#Crie um código que inclui o "Discordo Plenamente" e que a saída dos níveis seja 
#Levels: "Concordo Plenamente" "Concordo" "Discordo Plenamente" "Discordo".
Resposta <- factor(c("Concordo", "Concordo", "Concordo Plenamente", "Discordo", "Concordo"))
Resposta
levels(Resposta) <- c(levels((Resposta)), "Discordo Plenamente")
levels(Resposta)
Resposta <- factor(Resposta, levels = c("Concordo Plenamente", "Concordo", "Discordo Plenamente", "Discordo"), ordered = TRUE)
levels(Resposta)

#Dado o vetor z <- factor(c("p", "q", "p", "r", "q")) e os níveis "p", "q" e "r”, 
#crie um código em R que substitui o nível ”p” por ”w”.
z <- factor(c("p", "q", "p", "r", "q"))
z
z <- factor(z, levels = c("w", "q", "r"), ordered = TRUE)
z
z[c(1,3)] <- "w"
z


# LISTAS

#Dado a lista v <- list("a", "b", "c"), escreva um código em R que associa os nomes "Um", "Dois" e "Três" aos 
#elementos da lista v.
v <- list("a"="Um", "b"="Dois", "c"="Três")
v

#Crie a lista lista <- list(a=1:10,b=letters[1:3],c="Rural") e examine seus elementos através dos seguintes comandos: 
#lista$a e lista[[2]].
lista <- list(a=1:10,b=letters[1:3],c="Rural")
lista$a # 1 à 10
lista[[2]] # a b c

#Dado a lista v <- list(a=1:10, b="Bom Dia!", c="Rural"), escreva um código em R que adiciona um novo item 
#z="2017" a lista v.
v <- list(a=1:10, b="Bom Dia!", c="Rural")
v <- c(v, z="2017")
v

#Remova o terceiro elemento da lista anterior.
v <- v[-3]
v

#Dado a lista x <- list(c(1, 2, 3), c("A", "B", "C")), escreva um código que substitui “A” por ”W”. 
x <- list(c(1, 2, 3), c("A", "B", "C"))
x[[2]][1] <- "W"
x

#Dado a lista v <- list(a=1:10, b="Bom Dia!", c="Rural"), escreva um código em R que adiciona um 1 a todos os 
#elementos do primeiro vetor da lista v.
v <- list(a=1:10, b="Bom Dia!", c="Rural")
v$a <- v$a + 1
v$a

#Dado a lista v <- list(a=1:10, b="Bom Dia!", c="Rural"), escreva um código em R que determina o tamanho 
#da lista v e do vetor a.
v <- list(a=1:10, b="Bom Dia!", c="Rural")
length(v)
length(v$a)


# MATRIZES

#Crie uma matriz quadrada e calcule seu determinante, sua transposta e sua inversa.
m <- matrix(c(9,12,30,23,25,26,37,83,39), 3, 3);m
det(m)
t(m)
solve(m)

#Com base na matriz anterior, determine: x[1, ] x[2, ] x[, 2] x[1, 2] x[, 2:3]
m
m[1, ] # elementos da linha 1
m[2, ] # elementos da linha 2
m[, 2] # elementos da coluna 2
m[1, 2] # elemento da linha 2 e coluna 2
m[, 2:3] # elementos sem linha específica e colunas de 2 à 3

#Crie três vetores x, y, z com inteiros, de modo que cada vetor tenha 3 elementos. 
#Combine os três vetores para se tornar uma matriz 3 × 3 onde cada coluna representa um vetor. 
#Altere os nomes das linhas para a, b, c.
x <- c(1, 2, 3)
y <- c(9, 8, 7)
z <- c(5, 6, 4)
m3x3 <- matrix(c(x, y, z), 3, 3);m3x3
rownames(m3x3) <- c("a", "b", "c");m3x3

#Crie um vetor com 12 inteiros. Converta o vetor em uma matriz B 4 x 3 usando matrix (). 
#Também altere os nomes das colunas para x, y, z e as linhas para a, b, c, d.
a <- c(1,2,3,4,5,6,7,8,9,10,11,12)
B <- matrix(c(a),4, 3);B
colnames(B) <- c("x", "y", "z");B
rownames(B) <- c("a", "b", "c", "d");B

#O que ocorre se definirmos o argumento byrow = TRUE na construção de uma matriz?
# Ao definir o argumento byrow = TRUE na construção de uma matriz em R, você está instruindo a função matrix() a preencher a matriz linha por linha, em vez de coluna por coluna, que é o comportamento padrão (byrow = FALSE).
# Criando uma matriz sem byrow = TRUE
A <- matrix(1:6, nrow = 2, ncol = 3);A
# Criando uma matriz com byrow = TRUE
B <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE);B

#Considere o seguinte comando: m <- matrix( c(1, 2, 3, 4), nrow = 2).
#Qual o valor do elemento da segunda linha da segunda coluna (m22)?
#Considerando a matriz m do item anterior, qual o resultado, no R, da seguintes operações: 3 * m, m + m, m > 2,sum[m == 3]
m <- matrix( c(1, 2, 3, 4), nrow = 2);m
m[2,2] # 4
3 * m # 3x todos o snúmeros da matriz
m + m # soma os números do seu quadrante
m > 2 # mostra TRUE ou FALSE de acordo com a condição
sum[m == 3] # dá um erro, objeto de tipo builtin


#Um fator também pode ser gerado usando a função gl(). Qual o comando cria um fator com 100 repetições tanto para "M" 
#quanto para "F" ? Note que o comando deve ser submetido no seguinte formato: gl(x,k,labels = z). 
#OBS.: Ao submeter o comando, retire todos os espaço em branco.
gl(2,100,labels=c("M","F"))
#2: Número de níveis (neste caso, "M" e "F").
#100: Número de repetições para cada nível.
#labels=c("M","F"): Define os rótulos dos níveis como "M" e "F".

#Crie o fator drinks <- factor(c("beer","beer","wine","water")).
#Depois, submeta apenas o comando em R para calcular a proporção de cervejas (beer) no objeto fator de bebidas (drinks). 
#É obrigatório o uso da função mean para calcular a proporção. 
#OBS.: Ao submeter o comando, retire todos os espaço em branco.
drinks <- factor(c("beer","beer","wine","water"));drinks
mean(drinks == "beer", na.rm=TRUE)

#Crie o fator drinks <- factor(c("beer","beer","wine","water")). 
#Depois, altere o primeiro nível do fator com o seguinte comando: levels(drinks)[1] <- "water". 
#Qual o fator resultante quando acessar os elementos do mesmo?
drinks <- factor(c("beer","beer","wine","water"));drinks
levels(drinks)[1] <- "water";drinks

#Considere os vetores: nomes=[João, Paula, Maria, Ingrid, José, Marcos], pesos=[80, 65, 70, 58, 78, 70]  e 
#alturas=[1.70, 1.66, 1.65, 1.60, 1.76, 1.70]. Crie uma lista com esses vetores chamada de lista_pessoas. 
#Depois, crie um quarto objeto chamado IMC de acordo coma equação IMC=pesos/alturas^2. 
#Por fim, adicione o vetor IMC a lista_pessoas (ao final da lista) e responda as questões abaixo:
nomes = c("João", "Paula", "Maria", "Ingrid", "José", "Marcos")
pesos = c(80, 65, 70, 58, 78, 70) 
alturas = c(1.70, 1.66, 1.65, 1.60, 1.76, 1.70)

lista_pessoas <- list(nomes=nomes, pesos=pesos, alturas=alturas)

imc = pesos / alturas ^ 2

lista_pessoas$imc <- imc

lista_pessoas

#Qual o comando para acessar o primeiro nome  contido no primeiro elemento da lista (lista_pessoas)? 
#OBS.: Ao submeter o comando, retire todos os espaço em branco.
lista_pessoas[[1]][1]
lista_pessoas$nomes[1]

#Quais são as classes dos objetos na lista?
str(lista_pessoas)

#O que retorna o seguinte comando lista_pessoas[[4]][3]?
lista_pessoas[[4]][3]

#A partir do dateset 'airquality', crie uma variável 'lista' com o seguinte comando: 
#lista <- lapply(airquality, function(x){mean(x)}). A função lapply() retorna um objeto do tipo lista com os valores das 
#médias de cada uma das colunas do dataset 'airquality'. Usando o RStudio, analise o dataset 'airquality' e a variável 
#'lista'.  Em seguida, escreva o comando que apenas apresenta a média das temperaturas contida na variável 'lista'.
lista <- lapply(airquality, function(x){mean(x)})
lista
lista$Temp
mean(airquality$Temp, na.rm = TRUE)
head(airquality)

#Para responder as questão abaixo, faça download do arquivo disponível em 
#https://www.dropbox.com/s/luxinhu8d1hmc1j/chuvas.RData?dl=1 e mova-o para o seu diretório. 
#Em seguida leia-o com o comando load("chuvas.RData"). A matriz chuvas possui dados (em mm) sobre precipitações em 
#100 municípios do Brasil, durante um período de 30 dias. Os municípios estão representados em códigos através das 
#linhas e os dias através das colunas. Diante de tais dados, resolva as questões abaixo.
load("G:\\Meu Drive\\MESTRADO UFRPE (RURAL)\\Disciplinas\\Computação para Análise de Dados (CPAD)\\Exercícios\\Meu RCurso\\chuvas.RData")
str(chuvas)   # Mostra a estrutura da matriz
head(chuvas)  # Mostra os primeiros elementos da matriz

#Qual a média do volume de chuvas do período observado?
volchuva <- mean(chuvas, na.rm=TRUE);volchuva

#Qual município teve o maior volume de chuvas considerando os 30 dias observados?
volmun <- rowSums(chuvas);volmun
max(volmun)
maxmun <- which.max(volmun);maxmun

#Considerando o volume de todos os municípios observados, em qual dia menos choveu?
voldia <- colSums(chuvas);voldia
min(voldia)
minchuva <- which.min(voldia);minchuva

#Quais comandos abaixo calculam o volume de chuvas do município 81 (mun_81) nos primeiros 10 dias observados?

aux<-chuvas["mun_81" , ]; aux<-sum(aux[1:10]);aux #52.2

aux<-chuvas[81 , ]; aux<-sum(aux[1:10]);aux #52.2

aux<-chuvas[81 , ]; aux<-sum(aux[seq(1,10,1)]);aux #52.2

aux<-chuvas["mun_81" ]; aux<-sum(aux[1:10]);aux #NA 

aux<-chuvas["mun_81" , ]; aux<-sum(aux[c(1:10)]);aux #52.2
#fragmentado
aux<-chuvas["mun_81", ];aux 
aux<-aux[1:10];aux
aux<-sum(aux);aux


# DATAFRAMES

#Crie um data frame que contenha três variáveis: o nome de cada membro de sua família, a idade e o sexo. 
#Coloque pelo menos 5 membros. 
df.familia <- data.frame(
  'nome' = c('Amanda', 'Bernardo', 'Carlos', 'Douglas', 'Erika'), 
  'idade' = c(18,22,31,19,27),
  'sexo' = c('F','M','M','M','F')
  )
df.familia

#Adicione uma variável ao data frame que indique em qual ano cada membro da sua família terá 100 anos de idade. 
#Qual é a média dessa variável?
anoAtual <- as.numeric(format(Sys.Date(), '%Y')) ; anoAtual
df.familia$cemAnos <- anoAtual + (100 - df.familia$idade) ; df.familia
mediaCemAnos <- mean(df.familia$cemAnos) ; mediaCemAnos

#Qual é a idade média dos seus familiares? De seus familiares femininos?
idadeMediafamilia <- mean(df.familia$idade) ; idadeMediafamilia

idadeFem <- subset(x = df.familia, subset = sexo == 'F', select = idade); idadeFem
mean(idadeFem$idade)
#ou
mean(df.familia$idade[df.familia$sexo == 'F'])


#Combine os dados em um único dataframe. Complete todos os exercícios a seguir do dataframe!
df.pirates <- data.frame(
  'Name' = c('Astrid', 'Lea', 'Sarina', 'Remon', 'Letizia', 'Babice', 'Jonas', 'Wendy', 'Niveditha', 'Gioia'),
  'Sex' = c('F', 'F', 'F', 'M', 'F', 'F', 'M', 'F', 'F', 'F'),
  'Age' = c(30, 25, 25, 20, 22, 22, 35, 19, 32, 21),
  'Superhero' = c('Batman', 'Superman', 'Batman', 'Spiderman', 'Batman', 'Antman', 'Batman', 'Superman', 'Maggott', 'Superman'),
  'Tattoos' = c(11, 15, 12, 5, 65, 3, 9, 13, 900, 0)
)
df.pirates

#Qual é a idade mediana dos 10 piratas?
median(df.pirates$Age)

#Qual foi a idade média dos piratas femininos e masculinos separadamente?
mean(df.pirates$Age[df.pirates$Sex == 'F'])
mean(df.pirates$Age[df.pirates$Sex == 'M'])

#Qual foi o maior número de tatuagens de um pirata masculino?
max(df.pirates$Tattoos[df.pirates$Sex == 'M'])

#Que porcentagem de piratas do sexo feminino tem menos de 32 anos?
sum(df.pirates$Age)
sum(df.pirates$Sex == 'F' & df.pirates$Age < 32) / sum(df.pirates$Sex == 'F') * 100
mean(df.pirates$Age[df.pirates$Sex == 'F'] < 32) * 100

#Adicione uma nova coluna ao dataframe chamado tattoos.per.year, que mostra quantas tatuagens cada pirata tem para cada ano de vida.
df.pirates$tattoos.per.year <- round(df.pirates$Tattoos / df.pirates$Age, 1)
df.pirates


#Qual pirata teve o maior número de tatuagens por ano?
df.pirates$Name[which.max(df.pirates$tattoos.per.year)]

#Quais são os nomes das mulheres piratas cujo super-herói favorito é Superman?
df.pirates$Name[which(df.pirates$Sex == 'F' & df.pirates$Superhero == 'Superman')]

#Qual foi o número médio de tatuagens de piratas com mais de 20 anos cujo super-herói favorito é o Batman?
mean(df.pirates$Tattoos[df.pirates$Age > 20 & df.pirates$Superhero == 'Batman'])


#Crie os vetores a seguir: ‘mouse.color' com os valores: ‘purple’, ‘red’, ‘yellow’,‘brown’; ‘mouse.weight’ com os valores 23, 21, 18, 26. 
#Crie um data frame chamado de ‘mouse.info’ com esses vetores, formando 4 linhas e 2 colunas. 
#Nomeie a primeira coluna para ‘colour’ e a segunda para ‘weight’. De posse desse data frame, responda as perguntas abaixo. 
#OBS.: Ao submeter o comando, retire todos os espaço em branco.
mouse.color <- c('purple', 'red', 'yellow','brown')
mouse.weight <- c(23, 21, 18, 26)
mouse.info <- data.frame('mouse.color' = mouse.color, 'mouse.weight' = mouse.weight) ; dfmouse.info
names(dfmouse.info)[1] <- 'colour'
names(dfmouse.info)[2] <- 'weight'
mouse.info

#Qual comando imprime a estrutura do  data frame no console ?
str(mouse.info)

#Qual comando imprime apenas a linha 3 no console ?
mouse.info[3, ]

#Qual comando imprime apenas a coluna 1 no console ?
mouse.info[ , 1] 

#Qual comando imprime o item na linha 4 da coluna 1 ?
mouse.info[4, 1]

#Para as questões abaixo use o dataset airquality já incluído no RStudio.
head(airquality)
#Qual foi o valor  mínimo de ozônio no mês de maio ?
min(airquality$Ozone[airquality$Month == 5], na.rm = TRUE)

#Extraia o subconjunto do data frame em que os valores de Ozônio estão acima de 25 e os valores da temperatura (Temp) estão abaixo de 90. 
#Qual é a média do Solar.R nesse subconjunto?
mean(airquality$Solar.R[airquality$Ozone > 25 & airquality$Temp < 90], na.rm = TRUE)

#Qual a quantidade de casos completos no dataset airquality ? Ou seja, a quantidade de observação (linhas) sem NAs.
sum(complete.cases(airquality))

#Carregue o arquivo genomes.csv numa variável chamada genomas através do seguinte comando: 
#genomas <- as.data.frame(read.csv("https://www.dropbox.com/s/vgh6qk395ck86fp/genomes.csv?dl=1")). 
#De posse desse dado, responda as perguntas abaixo.
genomas <- as.data.frame(read.csv("https://www.dropbox.com/s/vgh6qk395ck86fp/genomes.csv?dl=1"))
head(genomas)

#Selecione os organismos com mais de 40 cromossomos.
genomas$Organism[genomas$Chromosomes > 40]
#ou
genomas[genomas$Chromosomes > 40, ]
#ou
subset(genomas, Chromosomes > 40)

#Selecione os organismos que contém plasmídeos e também possui mais de um cromossomo.
genomas$Organism[genomas$Plasmids > 0 & genomas$Chromosomes > 1]
#ou
genomas[genomas$Plasmids > 0 & genomas$Chromosomes > 1, ]
#ou 
subset(genomas, Plasmids > 0 & Chromosomes > 1)

#Quantos grupos diferentes existem?
length(unique(genomas$Groups))

#Carregue o arquivo cancer_stats.csv numa variável chamada cancer_stats através do seguinte comando: 
#cancer_stats <- as.data.frame(read.csv("https://www.dropbox.com/s/g97bsxeuu0tajkj/cancer_stats.csv?dl=1")). 
#De posse desse dado, responda as perguntas abaixo.
cancer_stats <- as.data.frame(read.csv("https://www.dropbox.com/s/g97bsxeuu0tajkj/cancer_stats.csv?dl=1"))
head(cancer_stats)
cancer_stats$Class

#Para qual local do câncer (site) do sistema digestivo (Digestive System) existem mais casos femininos do que masculinos?
cancer_stats$Site[cancer_stats$Class == 'Digestive System' & cancer_stats$Female.Cases > cancer_stats$Male.Cases]
#ou
cancer_stats[cancer_stats$Class == 'Digestive System' & cancer_stats$Female.Cases > cancer_stats$Male.Cases, ]
#ou
subset(x = cancer_stats, subset = Class == 'Digestive System' & Female.Cases > Male.Cases)

#Qual local do câncer tem a melhor taxa de sobrevivência para os homens?
survivalRateM <- (1 - (cancer_stats$Male.Deaths / cancer_stats$Male.Cases)) * 100  ; survivalRateM
cancer_stats$Site[which.max(survivalRateM)]
#ou
cancer_stats[which.max(survivalRateM), "Site"]
#ou
cancer_stats[which.max(survivalRateM), ]
#ou
cancer_stats[which.max((1 - cancer_stats$Male.Deaths / cancer_stats$Male.Cases) * 100), "Site"]

#Qual local de câncer tem a pior taxa de sobrevivência para as mulheres?
survivalRateF <- (1 - (cancer_stats$Female.Deaths / cancer_stats$Female.Cases)) * 100 ; survivalRateF
cancer_stats$Site[which.min(survivalRateF)]
#ou
cancer_stats[which.min(survivalRateF), ]
#ou
cancer_stats[which.min(survivalRateF), 'Site']
#ou
cancer_stats[which.min((1 - cancer_stats$Female.Deaths / cancer_stats$Female.Cases) * 100), "Site"]

