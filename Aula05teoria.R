# AULA 05 - TEORIA

#Estrutura Sequencial
#É um conjunto de comandos no qual cada comando será executada sequencia.
x <- c(1,2,3,4,5,6)
y <- x ^ 2
y

#Estruturas Condicionais
#is...else
#Uma estrutura condicional permite a escolha do grupo de comandos a ser executado quando determinadas condições, 
#representadas por expressões lógicas, são ou não satisfeitas.
x <- 0
if(x < 0){
  print('Número negativo')
}else if(x > 0){
  print('Número positivo')
}else{
  print('Zero')
}

x <- c('Rural', 'é', 'maravilhosa')
if('rural' %in% x){
  print('Rural foi encontrado pela primeira vez')
}else if('Rural' %in% x){
  print('Rural foi encontrado pela segunda vez')
}else{
  print('Rural não foi encontrada')
}

#ifelse
#é usado quando queremos que cada elemento de um vetor passe por algum teste lógico para retornar um valor dependendo 
#se a condição for TRUE ou FALSE
#ifelse (vetor_de_condicoes, valor_se_TRUE, valor_se_FALSE)
a <- c(5, 3, 8, 9, 10, 15)
ifelse(a %% 2 == 0, 'Par', 'Ímpar')

#Estruturas de Repetição
#Permite que uma sequência de comandos seja executada enquanto uma determinada condição seja verdadeira.
#while
i <- 1
while(i < 6){
  print(i)
  i = i + 1
}

v <- c('Olá', 'while loop')
cont <- 2
while (cont < 7) {
  print(v)
  cont = cont + 1
}

#for
#Permite iterar sobre os elementos de uma sequência.
#Essas sequências podem ser: strings, listas, tuplas ou buffers.
for(k in 1:10){
  print(k)
}

a <- c('Eu', 'amo', 'a Rural')
for(x in a){
  print(x)
}

#Calcule as médias das colunas de airquality
head(airquality)
saida <- vector('double', ncol(airquality))
saida
for(i in seq_along(airquality)){
  saida[i] <- mean(airquality[ , i], na.rm = T)
}
saida[i]
saida

# Calcule a soma das colunas 5 e 6 de airquality.
airquality
somaColunas5e6 <- sum(airquality[ , 5], na.rm = T) + sum(airquality[ , 6], na.rm = T)
somaColunas5e6
#ou
soma_colunas <- 0
for (i in c(5, 6)) {
  soma_colunas <- soma_colunas + sum(airquality[ , i], na.rm = T)
}
soma_colunas

#break ... next
#break: É usado dentro do loop (while, for e repeat) para interromper a iteração e fluir o controle para fora do loop.
#next: Pula para o início do loop no qual está inserido sem interromper o mesmo.
x <- 1:15
for(val in x){
  if(val == 3){
    break
  }
  print(val)
}

x <- 1:5
for(val in x){
  if(val == 3){
    next
  }
  print(val)
}

#repeat
#Executa o mesmo código repetidas vezes sem uma condição. break é usado para sair da loop.
x <- 1
repeat{
  print(x)
  x = x + 1
  if(x == 6){
    break
  }
}


#Família Apply
#A família apply é composta por um conjunto de funções que pertencem nativamente ao R (pacote base).
#Essas funções são uma alternativa para as funções de loop tradicionais.
#Neste tópico irei apresentar as seguintes funções: apply() | lapply() | sapply() | tapply() | mapply()
# Cria um vetor com os nomes de 20 marcas de bebidas.
bebidas <- c("Brahma","Cacildis","Heineken","Skol","Corona", "BudLight","DeBron","Budweiser","Ekäut","SnowBeer",
            "Bavária","Bohemia","Crystal","Kaiser", "Itaipava", "Schin","Antarctica","Amstel","Colorado","Capunga")
set.seed(100) # Garante que os números gerados serão reproduzíveis (determinísticos).
precos <- runif(20, min = 2, max = 10)  # Gera 20 números aleatórios da distribuição uniforme entre 2 e 10. Esses números representam os preços das bebidas.
vendas <- runif(20, min = 20, max = 100)  # Gera 20 números aleatórios da distribuição uniforme entre 20 e 100. Esses números representam o total de vendas para cada bebida.
estoque <- sample(c(20:50), size = 20, replace = TRUE) # Seleciona aleatoriamente 20 valores do intervalo entre 20 e 50, com reposição (valores podem se repetir). Esses valores representam o estoque total de cada bebida.
# criação de um dataset
dataset_loja <- data.frame(id_produto = c(1:20), Bebidas = bebidas, Preco = precos, Total_vendas = vendas, 
                            Total_estoque = estoque)
head(dataset_loja)

#apply()
# apply(X, MARGIN, FUN, ...)
#Aplica uma função a um array (matriz ou data frame) a partir de uma margem especificada.
#x = dataset_loja[ , -c(1,2)] : As colunas que serão aplicadas a função, ou seja, todas com exceção da 1 e 2. 
#margin = 2 : Define a dimensão na qual a função será aplicada. MARGIN = 1 aplica a função às linhas. MARGIN = 2 aplica a função às colunas.
#FUN = sum : A função que será aplicada.
apply(X = dataset_loja[ , -c(1,2)], MARGIN = 2, FUN = sum)

#lapply()
# lapply(X, FUN, ...)
#Similar ao apply(), porém é aplicável a outros objetos como listas, vetores e data frames. Além disso, retorna uma lista obrigatoriamente.
lapply(X = dataset_loja[,-c(1,2)], FUN = sum)

#sapply()
# sapply(X, FUN, ...)
#Similar ao lapply(), porém a saída geralmente é simplificada, sendo apenas um vetor.
sapply(X = dataset_loja[,-c(1,2)], FUN = sum)

#Como faço para obter as classes ou os tamanhos das colunas usando o sapply?
sapply(X = dataset_loja[,-c(1,2)], FUN = class)
sapply(X = dataset_loja[,-c(1,2)], FUN = length)

#tapply()
# tapply(X, INDEX, FUN, ...)
#Função com o objetivo de aplicar funções em grupos diferentes(e.x.: fator).
dataset_loja$fornecedores <- sample(c('Fornecedor 1', 'Fornecedor 2', 'Fornecedor 3', 'Fornecedor 4'), 
                                    size = 20, replace = TRUE)
head(dataset_loja)
#aplica a média dos Preços nos diferentes grupos de Fornecedores
#calcula a média dos Preços das bebidas agrupadas por seus respectivos fornecedores no dataset_loja
tapply(dataset_loja[, "Preco"], dataset_loja[,"fornecedores"], mean)

#mapply()
# mapply(FUN, ...)
#Esta é uma versão multivariada do sapply() e recebe como argumentos uma função e um conjunto de argumentos. 
#A função é aplicada em cada um dos argumentos sequencialmente.
mapply(FUN = function(x, y, z){ (x * y) + z }, dataset_loja[,c("Preco")], dataset_loja[,c("Total_estoque")], 
       dataset_loja[,c("Total_vendas")])


# Funções

#Para criar uma função é necessário utilizar a seguinte estrutura:
#nome_da_função<-function(arg1, arg2, ...){
#  comando 1
#  ...
#  comando n
#  return(resultado)
# }

#O uso da função é dado por:
# nome_da_funcao(arg1, arg2, ...)

#Função que calcula a média
media <- function(dados){
  med <- sum(dados) / length(dados)
  return(med)
}
x <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
media(x)

# Definindo argumentos

#As funções em R podem receber qualquer tipo de argumentos, como caracteres, listas e até mesmo outras funções.
sub <- function(x, y){
  return(x - y)
}
#Ao evocar a função esses argumentos podem ser organizados de duas formas:
#Utilizando o nome dos argumentos em qualquer ordem.
sub(x = 15, y = 10)
sub(y = 10, x = 15)
#Utilizando a ordem dos argumentos, mas omitindo os nomes.
sub(15, 10)

#Nem sempre necessitamos alterar todos os parâmetros de uma função. 
#Nestes casos, podemos criar parâmetros padrões que só são alterados quando o usuário solicita.
sub <- function(x, y = 100){
  return(x - y)
}

sub(50)
sub(50, 200)

# Variáveis locais e globais

#Variáveis criadas dentro de uma função não são acessadas no ambiente global.
sub <- function(x, y){
  return(x - y)
}

sub(100, 50)
y

#Para atualizar um objeto do escopo global de dentro da uma função utiliza-se o operador '<<-'.
sub <- function(x, y){
  y <<- y
  return(x - y)
}

sub(100, 50)
y

# O argumento '…'

#Esse argumento indica que pode ser passado um número indefinido de parâmetros e que, geralmente, estes serão repassados 
#para outras funções.
addPercent <- function(x, mult = 100, ...){
  percent <- round(x * mult, ...)
  paste(percent, '%', sep = "")
}

addPercent(c(0.1556, 0.3333, 0.8, 56), digits = 2)

#Um aspecto prático

#Quando você cria uma função para usar em sua análise, geralmente a cria e a armazena na parte superior do seu script.
#No entanto, muitas funções na parte superior do seu código podem torná-lo denso e difícil de ler.
#É uma boa prática criar scripts do R separados com funções relacionadas que você possa utilizar posteriormente.
#Você pode chamar essas funções usando a função source(<<nome do arquivo>>), na parte superior do seu script, 
#da mesma maneira que chama um pacote R.
#O R carregará essas funções na memória e você poderá usá-las.

