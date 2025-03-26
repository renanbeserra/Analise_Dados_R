#AULA 04 TEORIA

# VETORES

#Concatenando Valores
c(2,3,4,5)
c(TRUE, FALSE, TRUE, FALSE)
c("Eu","AMO","A","RURAl")
c(2:4)*2

#Repetição
v <-c(1,2,3)
rep(v,3)
rep(c(1, 2, 3), 1:3)
rep(c(1, 2, 3), each = 3)

#Sequencia
1:5
seq(1,5,1)

#Arredondamento de Valores
v <-c(2.5,3.6,4.3,5.8)
round(v)

#Tamanho do vetor
length(v)

#Maior Valor
max(v)

#Menor Valor
min(v)

#Media
mean(v)

#Ordem Crescente
sort(v, decreasing= TRUE)

# summary
v <- c(2, 4, 4, 5, 6, 7, 8)
summary(v)

#Conversão
v<-c(TRUE ,TRUE ,3 ,FALSE,FALSE)
v
a<-c(TRUE ,2.5 ,"Rural" ,5,FALSE)
a

#Conversão
aux<-c(10,2,0,1)
class(aux)
aux<-as.character(aux)
aux
class(aux)

o<-c("oi", "ei", "ai")
class(o)
o<-as.numeric(o)
o
class(o)

a <-1:10
a / 100
a ^ 2

a <-1:5
b <-1:5
ab.sum <-a + b; ab.sum 
ab.diff <-a -b; ab.diff 
ab.prod <-a * b; ab.prod

#Acessando elementos
# Indexação Numérica
v <- c(2,3,4,5)
v[3]
v[c(1,2)]
v[1:3]

# Indexação lógica
boat.names<-c("a", "b", "c", "d")
boat.colors <-c("black", "green", "pink", "blue")
boat.ages <-c (143, 53, 356, 23)
boat.prices <-c(53, 87, 54, 66)
boat.costs <-c (52, 80, 20, 100)

boat.ages > 100
boat.names == "c"

#Comparando vetores de mesmo tamanho
boat.prices > boat.costs

#Obtendo preços cuja idade é > 100 
boat.prices[boat.ages>100]

# & (and), | (or)
boat.names[boat.prices > 70 | boat.prices < 60]
boat.names[boat.colors == "blue" & boat.prices > 60] 

boat.names[boat.prices > 70 | boat.prices < 60 | boat.colors == "black"]
boat.names[boat.colors == "black" & boat.prices < 80]

# %in% : ajuda a criar facilmente vários argumentos OR
x <- c("a", "t", "a", "b", "z")
x %in% c("a" , "b" , "c" , "d" )

# which: retorna a posição dos elementos que se enquadram na resposta da pergunta. Caso se queira os valores 
#dos elementos, é necessário colocar a função which() entre colchetes [which()], ao lado do objeto em pesquisa.
v <- c(1,1,1,10,10)
which(v>3)
v[which(v>3)]

# Contagens e porcentagens de vetores lógicos
x <- c(1, 2, 3, -5, -5, -5, -5, -5)

#Quantidade de valores positivos
sum(x > 0)

#Porcentagem de positivos
mean(x > 0)

# NOMES
x<-1:3
names(x)
names(x) <-c("um", "dois", "três")
names(x)
x["um"]

#Alterando elementos
v <-c(2,3,0,5)
v[2]<-0
v
v < 3
v[v<3] <-1
v

# Manipular Vetor Vazio
v <-vector(mode = "numeric", length =3)
v
v[1]<-1
v
v<-c(v,5)
v

# Not Available (NA)
v <-c(1 ,2 ,3 ,NA ,6)
is.na(v)
mean(v)
mean(v, na.rm=TRUE)

# Escore padronizado
# Para padronizar um vetor, basta subtrair o vetor pela média e dividir o resultado pelo desvio padrão do vetor
a <-c(5, 3, 7, 5, 5, 3, 4 )
mean(a)
sd(a)
a.z <-(a - mean(a)) / sd(a)
a.z

# FATORES

#Criando fatores
v<-c("M","F","F","F","M","M","m","f","fem","mas","F","F")
a<-factor(v)
a
levels(a)
# frequência dos elementos
table(a)

semana <- factor(c("domingo", "segunda", "terça", "quarta", "quinta", "sexta", "sábado", "quarta", "terça"))
semana
#ordem alfabética
semana <- factor(semana, ordered = T)
semana
table(semana)

# ordem padronizada
semana_ordem <- factor(semana, levels = c("domingo", "segunda", "terça", "quarta", "quinta", "sexta", "sábado"), ordered = TRUE)
semana_ordem
table(semana_ordem)

#Acessando elementos de fatores

estado_civil <- factor(c("solteiro", "casado", "divorciado", "viúvo", "casado", "solteiro", "solteiro"))
table(estado_civil)
estado_civil[3]
estado_civil[c(1,2,3)]
estado_civil[-1]
levels(estado_civil)
levels(estado_civil)[1]

#Alterando elementos de fatores

estado_civil <- factor(estado_civil, levels = c("solteiro", "casado", "divorciado"))
estado_civil
estado_civil[4] <- "casado"
estado_civil
estado_civil[1] <- "viúvo"  # Não pode atribuir valores fora dos níveis
estado_civil
levels(estado_civil) <- c(levels(estado_civil), "viúvo") # Adiciona um nível
estado_civil
estado_civil[1] <- "viúvo"
estado_civil

#Altere o quarto elemento do vetor para “União Estável”
levels(estado_civil) <- c(levels(estado_civil), "União Estável")
estado_civil
estado_civil[4] <- "União Estável"
estado_civil


# LISTAS

#Criando uma lista 
cliente <- list(
  Nome = 'Renan',
  CPF = 12345678901,
  resp = c(TRUE, FALSE, TRUE)
)
cliente

#visualizar estrutura da lista
str(cliente)

#Acessando um elemento da lista
cliente[1]
cliente[2]
cliente[3]
cliente[c(T, F, T)]
cliente$Nome
cliente[[3]][2]

#Alterando elementos das listas
cliente[2] <- 10987654321
cliente$CPF


minha_lista <- list("a", "b", "c")

# Adicionando um novo elemento
minha_lista <- c(minha_lista, "novo_elemento")
minha_lista
# Adicionando um novo elemento diretamente
minha_lista[[5]] <- "outro_elemento"
minha_lista

# Removendo o terceiro elemento
minha_lista <- minha_lista[-3]
minha_lista


# MATRIZES

#Criando uma matriz 3x4
A <- matrix(1:12,3,4);A # matrix(elementos, linhas, colunas)

#Dimensão
dim(A)

#Número de Linhas
nrow(A)

#Dimensão
ncol(A)

A <- matrix(0,3,4);A # matriz composta por 0
A <- matrix(nrow = 3, ncol = 4);A # matriz composta por NA

#Renomeando linhas e colunas na matriz
A <- matrix(1:12, 4, 3);A
rownames(A) <- c("linha1", "linha2", "linha3", "linha4");A
colnames(A) <- c("coluna1", "coluna2", "coluna3");A

#Acrescentando linhas e colunas 
coluna4 <- c(0,0,0,0);A
linha5 <- c(1,1,1);A
A <- cbind(A, coluna4);A
A <- rbind(A, linha5);A

#Acessando elemento [linha, coluna]
A[3,1]
A[ , 1]
A[3, ]

#Como faço para acessar apenas a matriz 2x2 de A ? 
m2x2 <- A[1:2, 1:2];m2x2

#E se eu quiser apenas os valores maiores que 3?
mt3 <- A[A > 3];mt3 # na matriz completa, elementos maiores que 3
mm3 <- m2x2[m2x2 > 3];mm3 # na matriz 2x2, elementos maiores que 3

#Operações com matrizes
A <- matrix(1, 3, 3);A
B <- matrix(c(1,1,1,2,2,2,3,3,3), 3, 3);B
A + B

#Multiplicação matricial
A <- matrix(c(1,3,2,4), 2, 2);A
B <- matrix(c(-1,4,3,2), 2, 2);B
A%*%B
#Explicação: Linha da matriz A × Coluna da matriz B.
#Primeiro elemento (posição [1,1]): 1 × (−1) + 2 × 4 = −1 + 8 = 7  
#Segundo elemento (posição [1,2]): 1 × 3 + 2 × 2 = 3 + 4 = 7 
#Terceiro elemento (posição [2,1]): 3 x (-1) + 4 x 4 = -3 + 16 = 13
#Quarto elemento (posição [2,2]):  3 x 3 + 4 x 2 = 9 + 8 = 17

#Transporta
B <- matrix(c(1,1,1,2,2,2,3,3,3), 3, 3);B
t(B)

# rowSums soma todas as linhas
# colSums soma todas as colunas 
# rowMeans obtém a média de todas as linhas
# colMeans obtém a média de todas as colunas 

b <- matrix(c(1,3,4,3,25,40,3,3,3), 3, 3);b
colMeans(b)
colSums(b)
rowMeans(b)
rowSums(b)


# DATA FRAMES

#Criando objeto dataframe
a <- c(1,2,3,4)
b <- c("João", "Maria", "José", "Pedro")
c <- c(3.0, 5.0, 2.5, 1.0)

meu.banco <- data.frame("ID"=a, "Nome"=b, "Peso"=c, stringsAsFactors = FALSE) 
meu.banco

# Mostrar a estrutura de meu.banco
str(meu.banco)

# head() mostra as primeiras linhas
head(ChickWeight)

# tail() mostra as últimas linhas
tail(ChickWeight)

# View() abre o dataframe completo em uma nova janela
View(ChickWeight)

# Mostra um sumário estatístico de todas as colunas de ToothGrowth no console
summary(ToothGrowth)

# Apresenta informações adicionais sobre ToothGrowth no console
str(ToothGrowth)

#Para saber quais são os nome das colunas do dataframe ToothGrowth
names(ToothGrowth)

# Retorna as colunas de ToothGrowth
ToothGrowth$len
ToothGrowth$supp
ToothGrowth$dose

# Apresenta a média da coluna len de ToothGrowth?
mean(ToothGrowth$len)

#Apresenta as coluna len E supp de ToothGrowth
head(ToothGrowth[c("len", "supp")])

head(ToothGrowth)

# Muda o nome da primeira coluna do dataframe 
names(meu.banco)[1] <- "IDENTIFICADOR"
meu.banco

# Muda o nome da segunda coluna do dataframe 
names(meu.banco)[2] <- "NOMES"
meu.banco

#Muda o nome da coluna usando logica vetorial
names(meu.banco)[names(meu.banco) == "Peso"] <- "PESOS"
meu.banco

#É possível adicionar novas colunas a um dataframe usando os operadores $ e <-. 
#Para fazer isso, basta usar a notação df$nameColumn e atribuir um novo vetor de dados ao dataframe.

# Criar um novo dataframe chamado survey
survey <- data.frame("index" = c(1,2,3,4,5), "age" = c(24, 25, 42, 56, 22))
survey

# Adicionar uma nova coluna chamada sex
survey$sex <- c("m","m","f","f","m")
survey

#Utilize o cbind() para adicionar à coluna name
name <- c("João","Joaquim","Julieta","Júlia","José")
survey <- cbind(survey, "name" = name)
survey

#Cria um dataframe vazio
data <- data.frame(Nome = character(0), idade = numeric(0), stringsAsFactors = F)
data

#Adiciona informações na primeira linha
data[1, ] <- c("José", 30)
data

#Slicing com [ , ]
#notação dataframe[linhas, colunas], onde as linhas e colunas são vetores de inteiros.

# Retorna a linha 1
survey[1, ]

# Retorna a coluna 3
survey[, 3]

# Linhas 1 à 3 e Coluna 4
survey[1:3, 4]

ToothGrowth
# Mostra a primeira linha de ToothGrowth
ToothGrowth[1, ]

# Mostra a coluna 2 de ToothGrowth
ToothGrowth[, 2]

# Mostra as linhas 1 à 6 e coluna 1 de ToothGrowth
ToothGrowth[1:6, 1]

#Slicing com Vetor Lógico
#Primeiro, criamos um vetor lógico contendo apenas valores VERDADEIROS e FALSOS. Em seguida, indexamos um dataframe (normalmente as linhas) 
#usando o vetor lógico para retornar apenas os valores para os quais o vetor lógico é TRUE.

# Criar um novo df com apenas as linhas de ToothGrowth onde supp seja igual a "VC"
ToothGrowth.VC <- ToothGrowth[ToothGrowth$supp == "VC", ]
ToothGrowth.VC

# Criar um novo df com apenas as linhas de ToothGrowth onde supp seja igual a "OJ" e dose < 1
ToothGrowth.OJ.men1 <- ToothGrowth[ToothGrowth$supp == "OJ" & ToothGrowth$dose < 1, ]
ToothGrowth.OJ.men1

## Criar um novo df com apenas as linhas de InsectSprays onde spray seja igual a "A" ou "B" e count < 10
InsectSprays
dfSpray.A.B.men10 <- InsectSprays[InsectSprays$spray == "A" | InsectSprays$spray == "B" & InsectSprays$count < 10, ]
dfSpray.A.B.men10

#Slicing com subset()
#Permite dividir e fatiar o conjunto de dados exatamente como faria com parênteses
# subset(x, subset, select)
# x = dataframe que quer
# subset = vetor lógico indicando as linhas que quer manter
# select = colunas que quer manter

# Obtêm linhas de ToothGrowth, onde len < 20, supp == "OJ" e dose >= 1
subset(x = ToothGrowth, subset = len < 20 & supp == "OJ" & dose >= 1)

# Obtêm linhas de ToothGrowth, onde len > 30 e supp == "VC", porém apenas retorna às colunas len e dose
subset(x = ToothGrowth, subset = len > 30 & supp == "VC", select = c("len", "dose"))

# Qual o comprimento médio dos dentes dos porquinhos da índia dado o suplemento OJ ?
head(ToothGrowth)
# Step1: Criar um subconjunto do dataframe chamado oj
oj <- subset(x = ToothGrowth, subset = supp == "OJ")
oj
# Step2: Calcular a média da coluna len do novo subconjunto do dataset
mean(oj$len)

#Qual o peso médio das galinhas (ChickWeight) cuja Diet é 1?
head(ChickWeight)
diet1 <- subset(x = ChickWeight, subset = Diet == 1)
diet1
mean(diet1$weight)

#with()
#Permite que façamos operações com as colunas do dataframe sem ter que ficar repetindo o nome do dataframe seguido de 
#$, [ , ] ou [[]] o tempo inteiro.

# Criar o data frame health
health <- data.frame("age" = c(32, 24, 43, 19), "height" = c(1.75, 1.65, 1.50, 1.92), "weight" = c (70 , 65 , 62 , 79))

#Adicionar uma coluna com índice de massa corporal (IMC)
#Forma tradicional
imc <- health$height / health$weight ^ 2
imc

#Usando a função with()
imc <- with(health, height / weight ^ 2)
imc

#Removendo NAs
#complete.cases(): localiza e remove linhas com dados ausentes
airquality

sum(is.na(airquality)) # Total de NAs

x <- airquality[complete.cases(airquality), ]
x
sum(is.na(x))

