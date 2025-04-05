# AULA 05 - EXERCÍCIO

# Estruturas de Controle e Funções

#Escreva um loop (usando for, while e repeat) que percorra os números de 1 a 7 e imprime o cubo de cada número 
#usando print().
i <- 1
while (i <= 7) {
  cubo <- i ^ 3
  print(cubo)
  i <- i + 1
}

for (i in 1:7) {
  cubo <- i ^ 3
  print(cubo)
}

i <- 1
repeat{
  cubo <- i ^ 3
  print(cubo)
  i <- i + 1
  if(i > 7){
    break
  }
}

#Usando as seguintes variáveis: x = 1, y = 40, i = c(1:10). Faça um loop for() que aumenta x por três e 
#diminue y por dois, para cada i.
x <- 1
y <- 40
i <- c(1:10)
for(id in i){
  x <- x + 3
  y <- y - 2
  cat('Interação:', id, 'x=', x, 'y=', y, '|')
}

#Usando a seguinte variável: x = 100,  y = 50, i = 1. Crie um loop repeat() que incrementa i e 
#calcula x = x - i e y = y + i até x < y.
x <- 100
y <- 50
i <- 1
repeat{
  x <- x - i
  y <- y + i
  i <- i + 1
  if(x < y){
    break
  }
}
cat('iteração:', i - 1, 'x=', x, 'y=', y, '|')

#Escreva um loop while que imprime os números aleatórios da distribuição normal (use rnorm()), mas pare (break) 
#se obtiver um número maior que 1.
while (TRUE) { #loop infinito
  n <- rnorm(1) #gera um número aleatório da distribuição normal
  if(n > 1){  
    break
  }
  print(n)
}

#Usando next adapte o loop do último exercício para que não imprima números negativos.
while (TRUE) {
  n <- rnorm(1)
  if(n < 0){  #verifica se o número é negativo
    next
  }
  if(n > 1){
    break
  }
  print(n)
}

#Use Loops para:
#Calcular a média de cada coluna do dataset mtcars.
head(mtcars)
media <- vector('double', ncol(mtcars)) # Vetor para armazenar as médias
media
for (i in seq_along(media)) { # Percorre todas as colunas do dataset
  media[i] <- mean(mtcars[ , i], na.rm = T) # Calcula a média de cada coluna
}
names(media) <- colnames(mtcars)  #Adiciona os nomes das colunas ao vetor
media

#Determinar o tipo de cada coluna de nycflights13::flights. Dica: Instale primeiro o pacote nycflights13.
install.packages('nycflights13')
library(nycflights13)
head(flights)

tipo <- vector('character', ncol(flights))  # Vetor para armazenar os tipos
for(i in seq_along(flights)){ # Percorre todas as colunas
  tipo[i] <- class(flights[[i]])  # Obtém o tipo da coluna
}
names(tipo) <- colnames(flights) # Adiciona os nomes das colunas ao vetor
tipo
#ou
col_types <- character(ncol(flights))  # Vetor para armazenar os tipos
for (i in seq_along(flights)) {  # Percorre todas as colunas
  col_types[i] <- paste(class(flights[[i]]), collapse = ", ")  # Concatena as classes em uma única string
}
names(col_types) <- colnames(flights)  # Adiciona os nomes das colunas ao vetor
col_types

#Calcular o número de valores únicos em cada coluna de iris. Dica: use a função unique().
head(iris)
unico <- vector('numeric', ncol(iris))  # Vetor para armazenar a contagem de valores únicos
for(i in seq_along(iris)){  # Percorre todas as colunas do dataset
  unico[i] <- length(unique(iris[ , i]))  # Calcula o número de valores únicos
}
names(unico) <- colnames(iris)  # Adiciona os nomes das colunas ao vetor
unico


#Família Apply
#Dado o seguinte data frame dados1 <- data.frame (observacaoA = 16: 8, observacaoB = c (20:19, 6:12)), responda as questões abaixo.
dados1 <- data.frame (observacaoA = 16: 8, observacaoB = c (20:19, 6:12))
dados1
#Usando sapply (), encontre o comprimento das observações do conjunto de dados1.
sapply(dados1, length)

#Usando sapply (), encontre as somas das observações do conjunto de dados1.
sapply(dados1, sum)

#Use sapply () para encontrar os quantis das colunas do conjunto de dados1:
sapply(dados1, quantile)

#Encontre as classes das colunas do conjunto de dados1.
sapply(dados1, class)

#Dado a seguinte função DerivativeFunction <- function (x) {log10 (x) + 1}, aplique ela ao conjunto de dados1.
DerivativeFunction <- function(x){log10 (x) + 1}
sapply(dados1, DerivativeFunction)

#Escreva a função “ DerivativeFunction ” em sapply () e aplique ela a dados1.
sapply(dados1, function(x){log10 (x) + 1})

#Imprima o conjunto de dados1 com a função sapply ().
sapply(dados1, identity)
sapply(dados1, print)

#Os dados de chickwts descrevem os pesos de frango por tipo de alimento. Calcule o peso médio para cada 
#tipo de alimento usando tapply(). No entanto, primeiro carregue os dados: data (chickwts).
head(chickwts)
tapply(chickwts[,"weight"], chickwts[,"feed"], mean)

#Para os dados de chickwts, escreva uma função que recebe um vetor x como entrada e retorna o número de observações 
#em x que são maiores que 300. Em seguida, calcule o número de frangos com peso acima de 300 gramas para 
#cada tipo de alimento usando tapply().
conta300 <- function(x){
  sum(x > 300)  # Conta os valores no vetor x que são maiores que 300
}
# Aplicando a função conta300 para os pesos de frangos, agrupados por tipo de alimento
tapply(chickwts[,"weight"], chickwts[,"feed"], conta300)

#Use mapply () para somar os vetores "5:10" e "20:25".
mapply(function(x, y){ x + y}, c(5:10), c(20:25))

#Use mapply () para colar o vetor "1: 4" e "5: 8", com o separador "LETRAS [1: 4]".
mapply(function(x, y, z){ paste(x, y, z, sep = " ") }, c(1:4), c(5:8), LETTERS[1:4])

#Compare o loop e as funções apply. Primeiro crie o data frame abaixo. Depois, calcule o maior valor em cada linha (ignorando a coluna cat) usando:
set.seed(112)
d = data.frame(matrix(rnorm(1e5 * 10),ncol=10))
d$cat = sample(LETTERS[1:5], 1e5, replace=TRUE)
head(d)
#A função apply
apply(d[,-c(11)], 1, max)
#ou
apply(d[,1:10], 1, max)

#A função sapply ou lapply
sapply(1:nrow(d), function(i){ max(d[i, 1:10]) })
ou
lapply(1:nrow(d), function(i){ max(d[i, 1:10]) })

#Um único loop
valorMax <- numeric(nrow(d))
for(i in 1:nrow(d)){
  valorMax[i] <- max(d[i, 1:10])
}
head(valorMax)
#ou
i <- 1
repeat{
  valorMax[i] <- max(d[i, 1:10])
  i <- i + 1
  if(i > nrow(d)){
    break
  }
}
head(valorMax)

#Considere o data frame do exercício anterior e implemente comandos que localizem o valor mediano de cada uma das 10 colunas para cada
#um dos 5 níveis da coluna cat, usando:
head(d)
#Uma única função tapply
apply(d[1:10], 2, function(col){tapply(col, d$cat, median)})

#tapply dentro de um loop for
loop <- list()
for(j in 1:10){
  loop[[j]] <- tapply(d[,j], d$cat, median)
}
loop

#tapply dentro de um sapply ou lapply
sapply(1:10, function(j){ tapply(d[,j], d$cat, median) })
#ou
lapply(1:10, function(j){ tapply(d[,j], d$cat, median) })


head(iris)
#Quais comandos no R retornam um vetor das médias das variáveis 'Sepal.Length', 'Sepal.Width', 'Petal.Length' e 'Petal.Width' do dataset iris 
#(já incluído no R) ? Note que algumas funções usam diferentes formas de arredondamento.
apply(iris[ , 1:4], 1, FUN = mean)
apply(iris, 2, FUN = mean)
colMeans(iris)
apply(iris[ , 1:4], 2, FUN = mean)
sapply(iris[ , 1:4], FUN = mean)
mapply(iris[ , 1:4], mean)
apply(iris[1:4, ], 2, FUN = mean)

#Quais comandos calcula a média  do tamanho das pétalas (Petal.Length) de acordo com as espécies de iris (Species)?
tapply(iris$Petal.Length, iris$Species, mean)
tapply(iris[,3], iris$Species, mean)
with(iris, tapply(Petal.Length, Species, mean))
sapply(iris, 2, mean)
mapply(iris$Petal.Length, iris$Species, mean)
mean(iris$Petal.Length, iris$Species)

#Qual dos seguintes loops não necessita de uma condição no R?
#No R, o loop que não necessita de uma condição explícita para sua execução é o repeat. O loop repeat continua rodando indefinidamente até que 
#um comando break seja utilizado para interrompê-lo. Diferente de while e for, ele não possui uma condição embutida para controle do fluxo.
#Esse código imprime os números de 1 a 5, encerrando o loop manualmente com break.
x <- 1
repeat {
  print(x)
  x <- x + 1
  if (x > 5) {
    break
  }
}

#Quantas vezes um loop while (T) {} é executado?
#O loop while (T) {} em R é executado infinitas vezes, a menos que haja um comando break dentro do bloco de código para interrompê-lo. 
#Como T representa TRUE, a condição do while nunca se torna falsa, resultando em um loop infinito.
while (T) {
  print("Rodando para sempre...")
}

#Qual é o valor de i após o loop for? for (i in 1:4){ }
for (i in 1:4){ print(i) }

#Qual é o valor de i após o loop for? for (i in 1:4){ break }
for (i in 1:4){ 
  break  
}
print(i) 

#Qual é o valor de i após o loop for? for (i in 1:4) {next }
for (i in 1:4) {
  next
}
print(i)

#Use o 'mapply' para obter uma lista de 10 elementos. A lista é uma alternação entre 'Rural' e 'Amo'. 
#O comprimento desses 10 elementos  diminuem de 10 para 1 (ver abaixo a saída). OBS.: Ao submeter o comando, retire todos os espaço em branco.
mapply(rep, c("Rural", "Amo"), 10:1)

#Qual deve ser o código em print para que as seguintes sequências sejam impressas: 1:10, 2:11 e 3:12(ver abaixo a saída)? 
#OBS.: Ao submeter o código, retire todos os espaço em branco e não use parênteses.
for(i in 1:length(1:3)){
  for(j in 1:10){
    print(i + j - 1)
  }
}

#Crie o data frame 'student.df' com os dados fornecidos a seguir: 
#student.df = data.frame (nome= c ("Sue", "Eva", "Henry", "Jan"), sexo= c ("f", "f", "m", "m"), anos= c (21,15,17,19)). 
#Use a função "ifelse" para adicionar os elementos de uma nova coluna chamada de"menor". 
#Essa coluna, que deve ser adicionada ao data frame, é uma coluna lógica, indicando "V" se a observação for um homem ("m") 
#com menos de 18 anos. Caso contrário, atribua "F" (veja o resultado esperado abaixo). Digite apenas uma linha de código 
#correspondente a toda essa ação. Note que você deve tirar todos os espaços em branco e a coluna "menor" deve ser 
#atribuída ao data frame através do operador "$". Além disso, as colunas do data frame devem ser acessadas pelo nome e 
#usem aspas duplas.
student.df = data.frame (nome= c ("Sue", "Eva", "Henry", "Jan"), sexo= c ("f", "f", "m", "m"), anos= c (21,15,17,19))
student.df
student.df$menor <- ifelse (student.df$sexo == "m" & student.df$anos < 18, "V", "F")
student.df

#Qual o comando usando a família apply você consegue obter a soma de cada um dos crimes contido no 
#dataset USArrests(já incluído no R) com a saída igual a apresentada abaixo? 
#OBS.: Ao submeter o código, retire todos os espaço em branco.
head(USArrests)
lapply(USArrests, sum)

#Qual o resultado do código abaixo ?
x = 0
a = 0
b = -5

if(a > b){
  if(b < a){
    x = x + 5
  }else if(a > 5){
    x = x + 4
  }else{
    x = x + 3
  }
}else{
  x = x + 2
}

print(x)

#Qual a resposta correta ?
x = 0

while(x < 100){
  x = x + 2
}

print(x)


#Escreva uma função que recebe a base e a altura de um triângulo e retorne sua área (A = (base x altura)/2).
areaTriangulo <- function(base, altura){
  return(base * altura/2)
}
areaTriangulo(3, 5)

#Construa uma função que calcula o somatório dos primeiros n números naturais. 
#Por exemplo se n = 4 a função deve retornar o valor: 1 + 2 + 3 + 4.
somatorio <- function(n){
  return(sum(1:n))
}
somatorio(4)

#Construa uma função que calcula automaticamente o valor de graus Celsius, 
#sabendo-se a temperatura em Fahrenheit. C°= 5/9 * (F°(temperatura dada) - 32)
celsius <- function(fahre){
  return(5/9 * (fahre - 32))
}

celsius(100)

#Construa uma função para demonstrar o Teorema Central do Limite.
teorema_central_limite <- function(pop_size, sample_size, num_samples){
  # Gerar a população com distribuição uniforme
  populacao <- runif(pop_size)
  
  # Calcular as médias das amostras
  medias <- numeric(num_samples)
  for(i in 1:num_samples){
    amostra <- sample(populacao, sample_size, replace = TRUE)
    medias[i] <- mean(amostra)
  }
  
  # Visualizar a distribuição das médias das amostras
  hist(medias, main = "Distribuição das Médias (TCL)", xlab = "Média", col = "lightblue", border = "black")
}

teorema_central_limite(10000, 30, 1000)

#Crie uma função que recebe um vetor numérico de qualquer tamanho e retorna uma lista contendo:
#O tamanho do vetor (função length()) .
#A soma do vetor (função sum()).
#Se o tamanho do vetor for par: Retornar o primeiro elemento.
#Se o tamanho do vetor for ímpar: Retornar o último elemento.
numeros <- function(vetor){
  list(
    tamanho = length(vetor),
    soma = sum(vetor),
    elemento = ifelse(length(vetor) %% 2 == 0, vetor[1], vetor[length(vetor)])
  )
}

numeros(c(1, 2, 3, 4))

#Crie uma função que dada uma palavra, retorna a posição de suas letras no vetor “letters” . 
#Ex.: Se a palavra é ‘abc’, a função retorna 1 2 3.
#Usa strsplit(palavra, "") para dividir a palavra em letras individuais.
#Converte o resultado em um vetor com unlist().
#Usa match() para encontrar a posição de cada letra no vetor letters.
posicao <- function(palavra){
  match(unlist(strsplit(palavra, "")), letters)
}
posicao('renan beserra pereira da silva')

#Crie uma função com um argumento padrão e que recebe o argumento '...', essa função deve:
#Receber três vetores e montar uma matriz (cbind ou rbind).
#Caso a dimensão dos vetores seja diferente o programa deve parar.
#Retorne uma lista contendo a matriz construída e um vetor com a soma de cada coluna.
constMatriz <- function(padrao = c(1, 2, 3), ...){  #Possui um argumento padrão, que tem o valor inicial c(1,2,3) (um vetor com os números 1, 2 e 3). O argumento ... permite que você passe múltiplos vetores adicionais à função.
  # Capturar os vetores passados como argumento
  # Converte os argumentos fornecidos em ... para uma lista chamada vetores. Isso permite que a função lide com vários vetores fornecidos como entrada.
  vetores <- list(...) 
  # Verificar se os vetores têm dimensões iguais
  # sapply(vetores, length): Aplica a função length em cada vetor da lista vetores para verificar o comprimento de cada um.
  # all(...): Verifica se todos os vetores possuem o mesmo comprimento que o vetor padrao.
  # !: Inverte o resultado para verificar se não são iguais.
  # stop("Os vetores possuem dimensões diferentes."): Interrompe a execução da função e exibe a mensagem de erro se os vetores não tiverem as mesmas dimensões.
  if(!all(sapply(vetores, length) == length(padrao))){
    stop('Os vetores possuem dimensões diferentes')
  }
  # Construir a matriz usando cbind
  # cbind: Junta os vetores por coluna para formar uma matriz.
  # do.call(cbind, vetores): Aplica cbind à lista vetores para criar a matriz.
  matriz <- do.call(cbind, vetores)
  # Retornar uma lista com a matriz e a soma das colunas
  # list(...): Retorna uma lista contendo:
  # matriz = matriz: A matriz criada com os vetores fornecidos.
  # soma_colunas = colSums(matriz): A soma de cada coluna da matriz, calculada com a função colSums.
  return(list(
    matriz = matriz, 
    somaColunas = colSums(matriz)
  ))
}

constMatriz(c(1, 2, 3), c(4, 5, 6), c(7, 8, 9))


#Qual o resultado da função abaixo.
y <- 5
mult <- function(x, y){
  return(x * y)
}
mult(10)

#Qual o resultado da função abaixo.
y <- 5
mult <- function(x){
  return(x * y)
}
mult(10)

#Escreva uma função chamada 'prisoes' que calcula a soma das prisões em estados americanos do 
#dataset USArrests. A função 'prisoes' recebe dois argumentos: 'estados' e 'tiposPrisoes'. 
#Dado esses argumentos, a função retorna o total de prisões. 
#Se não existir nem o estado ou o tipo de prisão, então uma mensagem de erro deve ser retornada. 
#O protótipo dessa função é: prisoes <- function(estados, tiposPrisoes){}. 
#As seguintes mensagens precisam ser apresentadas caso o estado ou o tipo de prisão estejam inválidos: 
#"Estado Inválido"  ou "Tipo de Prisão Inválida". De posse dessa função, responda as questões abaixo.
prisoes <- function(estados, tiposPrisoes){
  # Verificar se os estados e tipos de prisão são válidos
  if(!all(estados %in% rownames(USArrests))){
    return("Estado inválido")
  }
  if(!all(tiposPrisoes %in% colnames(USArrests))){
    return("Tipo de Prisão Inválida")
  }
  # Calcular a soma das prisões
  total_prisoes <- sum(USArrests[estados, tiposPrisoes, drop = FALSE])
  return(paste("O total de prisões do(s) estado(s)", paste(estados, collapse = ", ", "é", total_prisoes)))
}

prisoes(estados = "Oregon", tiposPrisoes = c("Rape", "Murder"))
prisoes(estados = c("Nevada", "Washington"), tiposPrisoes = c("UrbanPop", "Assault"))
prisoes(estados = "Pernambuco", tiposPrisoes = c("Rape", "Murder"))

#Qual é o total de prisões do código a seguir? 
prisoes(estados="Tennessee", tiposPrisoes=c("Rape","Murder"))

#Qual é o total de prisões do código a seguir? 
prisoes(estados=c("California ","Miami", "Arizona"), tiposPrisoes=("Assault"))

#Qual é o total de prisões do código a seguir? 
prisoes(estados=c("Pennsylvania","Mississippi", "Nebraska"), tiposPrisoes=c("Rape","UrbanPop","Assault"))

#Qual é o total de prisões do código a seguir? 
prisoes(estados=c("Vermont","Wisconsin", "Texas"), tiposPrisoes=c("Rape","Assalto"))

#Escreva uma função chamada 'minhasNotas_1' que calcula a média das suas notas para a disciplina de 
#Computação para Análise de Dados. A função 'minhasNotas_1' recebe 8 argumentos: 
#'Exe_1', "VA_1", 'Exe_2', "Proj" "VA_2", "VA_3", "Opt", e "threshold". 
#“Opt" pode receber quatro opções: 1 para retornar a média da 1 VA, 2 para retornar a média da 2 VA, 
#3 para retornar a média da 3 VA e 4 para retornar a Média Final, incluindo a 3 VA. Note que se qualquer 
#opção for selecionada, as demais devem ser ignoradas. Além disso, a Média Final da UFRPE consiste 
#de uma média aritmética das duas maiores médias (1VA, 2VA e 3VA). 
#Para a 1 e a 2 VA as notas de 'Exe_1', "VA_1", "Exe_2", "Proj" e "VA_2" possuem os seguintes pesos,  
#respectivamente, 5, 5, 2, 5, 3. Assim, por exemplo, a média da 1 VA é uma média ponderada dada pela 
#seguinte equação: 1VA = (('Exe_1'*5) + ("VA_1"*5)/10). Por fim, o argumento "threshold" consiste 
#na média mínima de aprovação. 

#A função  'minhasNotas_1' retorna a média do aluno de acordo com a opção escolhida e também se a mesma 
#está abaixo ou acima do "threshold". Vale ser ressaltado que se a opção “4” for escolhida então uma 
#mensagem será retornada informando a média e se o aluno foi aprovado ou se está na final. 
#Adicionalmente, uma mensagem de erro deve ser apresentada caso notas acima de 10 ou menores que zero 
#forem passadas. O mesmo deve acontecer se for escolhido uma opção incorreta ou se o aluno não tiver
#notas para uma determinada VA. Por fim, NAs devem ser tratado como nota zero 
#e a "VA_1", o "Proj", a "VA_2" e a "VA_3" devem receber apenas um único valor. 

#O protótipo dessa função é descrito a seguir: 
#minhasNotas_1 <- function(Exe_1=0, VA_1=0, Exe2=0, Proj=0, VA_2=0, VA_3=0, Opt=1, threshold=7){}. 
#Por exemplo, as seguintes mensagens poderão ser apresentadas caso o aluno selecione a nota da 
#1 VA (Opt=1) e o threshold igual a 7,0:  "Média da 1VA: 9.0 -- Acima da Média" ou “Aluno não possui 
#nota para a 1 VA”. Se Opt=3 for selecionada e o threshold for igual a 7,0 as seguintes mensagens poderão 
#ser apresentadas: 
#“Aluno não possui nenhuma nota -- Reprovado!!", “9,0 -- Aprovado!!" ou “6,0 -- Na Final!!".5

minhasNotas_1 <- function(Exe_1=0, VA_1=0, Exe_2=0, Proj=0, VA_2=0, VA_3=0, Opt=1, threshold=7){
  
  # Substituir NAs por zero
  Exe_1[is.na(Exe_1)] <- 0
  Exe_2[is.na(Exe_2)] <- 0
  
  # Garantir que Proj, VA_1, VA_2 e VA_3 não sejam NA
  Proj <- ifelse(is.na(Proj), 0, Proj)
  VA_1 <- ifelse(is.na(VA_1), 0, VA_1)
  VA_2 <- ifelse(is.na(VA_2), 0, VA_2)
  VA_3 <- ifelse(is.na(VA_3), 0, VA_3)
  
  # Validar que VA_1, VA_2, VA_3 e Proj sejam valores únicos
  if(length(VA_1) > 1){ 
    return("Quantidade de Notas Inválidas para a 1VA!")
  }
  if(length(VA_2) > 1){
    return('Quantidade de Notas Inválidas para a 2VA!')
  }
  if(length(VA_3) > 1){
    return('Quantidade de Notas Inválidas para a 3VA!')
  }
  if(length(Proj) > 1){
    return('Quantidade de Notas Inválidas para a 2VA!')
  }
  
  # Verificar limites de todas as notas
  if(any(Exe_1 > 10 | Exe_1 < 0) || VA_1 > 10 || VA_1 < 0 ||
     any(Exe_2 > 10 | Exe_2 < 0) || Proj > 10 || Proj < 0 ||
     VA_2 > 10 || VA_2 < 0 || VA_3 > 10 || VA_3 < 0) {
    return("Nota(s) Inválida(s) para a Média Final!")
  }

  # Calcular médias ponderadas
  media_1VA <- (mean(Exe_1) * 5 + VA_1 * 5) / 10
  media_2VA <- (mean(Exe_2) * 2 + Proj * 5 + VA_2 * 3) / 10
  media_3VA <- VA_3
  
  # Escolha da opção
    if(Opt == 1){
      if(is.na(media_1VA)){ return('Aluno não possui nota para a 1VA') }
    status <- ifelse(media_1VA >= threshold, "Acima da média", "Abaixo da média")
    return(paste('Média da 1VA:', media_1VA, '--', status))
  } else if(Opt == 2){
      if(is.na(media_2VA)){ return('Aluno não possui nota para a 2VA') }
    status <- ifelse(media_2VA >= threshold, "Acima da média", "Abaixo da média")
    return(paste('Média da 2VA:', media_2VA, '--', status))
  } else if(Opt == 3){
      if(is.na(media_3VA)){ return('Aluno não possui nota para a 3VA') }
    status <- ifelse(media_3VA >= threshold, "Acima da média", "Abaixo da média")
    return(paste('Média da 3VA:', media_3VA, '--', status))
  } else if(Opt == 4){
    medias <- c(media_1VA, media_2VA, media_3VA)
      if(all(is.na(medias))){ return('Aluno não possui nenhuma nota -- Reprovado!') }
    final_media <- mean(sort(medias, decreasing = TRUE)[1:2])
    status <- ifelse(final_media >= threshold, "Aprovado!", "Na Final!")
    return(paste(final_media, '--', status))
  } else{
    return('Opção inválida!')
  }
}

# Testes das diferentes chamadas da função
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=3, VA_2 = 4, VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=3, VA_2 = 4, VA_3=9, Opt=2, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=3, VA_2 = 4, VA_3=9, Opt=3, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=3, VA_2 = 4, VA_3=9, Opt=4, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, NA, NA), Exe_2 = 9, Proj = 7, VA_1=3, VA_2 = 4, VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=3, VA_2 = 4, VA_3=7, Opt=4, threshold=7)

minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=3, VA_2 = 4, VA_3=9, Opt=5, threshold=7)

minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=c(3,3), VA_2 = 4, VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = c(2, 3), VA_1=3, VA_2 = 4, VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=1, VA_2 = c(3,3), VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=1, VA_2 = 4, VA_3=c(3,3), Opt=1, threshold=7)

minhasNotas_1(Exe_1=c(10, 15, 7.5, 10, 2), Exe_2 = 1, Proj = 7, VA_1=1, VA_2 = 4, VA_3=8, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 11, Proj = 7, VA_1=1, VA_2 = 4, VA_3=8, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 1, Proj = 17, VA_1=1, VA_2 = 4, VA_3=8, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 1, Proj = 7, VA_1=12, VA_2 = 4, VA_3=8, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 1, Proj = 7, VA_1=1, VA_2 = 14, VA_3=8, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 1, Proj = 7, VA_1=1, VA_2 = 4, VA_3=18, Opt=1, threshold=7)

minhasNotas_1(Exe_1=c(10,9,7.5,NA,NA), VA_1=3, Exe_2=c(7,8), Proj=4, VA_2=7, VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10,9,7.5,NA,NA), VA_1=c(3,3), Exe_2=c(7,8), Proj=4, VA_2=7, VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(15,9,7.5,NA,NA), VA_1=c(3,3), Exe_2=c(7,8), Proj=4, VA_2=7, VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10,9,7.5,NA,NA), VA_1=3, Exe_2=c(7,8), Proj=9, VA_2=7, VA_3=9, Opt=2, threshold=7)
minhasNotas_1(Exe_1=c(10,9,7.5,NA,NA), VA_1=3, Exe_2=c(7,8), Proj=9, VA_2=7, VA_3=9, Opt=4, threshold=7)
minhasNotas_1(Exe_1=c(10,9,7.5,NA,NA), VA_1=7, Exe_2=c(7,8), Proj=10, VA_2=7, VA_3=2, Opt=4, threshold=8)

minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=c(3,3), VA_2 = 4, VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = c(2, 3), VA_1=3, VA_2 = 4, VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=1, VA_2 = c(3,3), VA_3=9, Opt=1, threshold=7)
minhasNotas_1(Exe_1=c(10, 9, 7.5, 10, 2), Exe_2 = 9, Proj = 7, VA_1=1, VA_2 = 4, VA_3=c(3,3), Opt=1, threshold=7)


#Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=c(10,9,7,5,10,4,NA,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(7,5), VA_2=7, VA_3=9, Opt=1, threshold=8)

#Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=c(10,9,7,5,NA,4,5,6,7,8,NA), VA_1=2, Exe_2=c(10,5.7,7.8,NA), Proj=4, VA_2=7, VA_3=9, Opt=2, threshold=5)

#Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(4,5), VA_2=7, VA_3=9, Opt=2, threshold=8)

#Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=c(NA,NA,7.5,1,10,2,5,6,7,8,10), VA_1=4, Exe_2=c(7,11,8.8,5,7,8), Proj=4, VA_2=7, VA_3=9, Opt=4, threshold=7)

#Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(6,8,9,8,5,7,8), Proj=7, VA_2=7, VA_3=9, Opt=4, threshold=8)
