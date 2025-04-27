# Aula 07 - Teoria

# Manipulação básica

# Carregar, Limpar, Manipular e Exportar Dados

# Como Organizar os Dados Inicialmente

# Fluxograma para Manipular Dados Reais:
#1.Importe seus dados
#2.Verifique, limpe e prepare seus dados (pode ser de até 80% do seu projeto)
#3.Conduza suas análises
#4.Exporte seus resultados
#5.Limpe o ambiente R e feche a sessão

# Como os Dados Devem Estar Organizados:
#Colunas devem conter variáveis.
#As linhas devem conter observações, medidas, casos, etc.
#Use a primeira linha para os nomes das variáveis.
#Insira NA (em maiúsculas) em células que representam valores ausentes.
#Você deve evitar nomes (ou campos ou valores) que contenham espaços.
#Armazene dados como arquivos .csv ou .txt, pois eles podem ser facilmente lidos em R.
#Todos os valores de uma mesmo variável precisam está na mesma coluna.

# Importar Dados

# Download de Arquivos:
#Primeiramente, é necessário setar o diretório através dos comandos de setwd() e getwd().
fileURL <- "https://www.dropbox.com/s/c6nhu4v7yq9pyto/Snail_feeding.csv?dl=1"
download.file(fileURL, destfile= "G:\\Meu Drive\\MESTRADO UFRPE (RURAL)\\Disciplinas\\Computação para Análise de Dados (CPAD)\\Exercícios\\Snail_feeding.csv", method= "curl")
list.files("G:\\Meu Drive\\MESTRADO UFRPE (RURAL)\\Disciplinas\\Computação para Análise de Dados (CPAD)\\Exercícios\\")

# Importação de Dados:
#Geralmente, os dados importado em R são arquivos ASCII.
#Esses arquivos são aqueles cuja extensões são: .txt, .dat ou .csv.
#Existem várias funções para importa arquivos em R.
#Iremos abordar apenas as funções read.table() eread.csv().
#Lembre-se de usar o getwd() e setwd() para definir o diretório de trabalho.
#Para se ler um arquivo .txt no R utiliza-se a seguinte função:

v1 <- read.table("pica-pau.txt", header = TRUE, sep = "", dec = ".")
#Esse comando importa os dados e salva ele no objeto V1.
#No argumento da função se headeré TRUE significa que o conjunto de dados da primeira linha da tabela é o nome da variável.
#sep significa como o conjunto de dados do R é separado.
#sep = "," quando as entradas são separadas por VÍRGULA.
#sep = "nt" quando as entradas são separadas por TAB.
#sep = "" quando as entradas são separadas por ESPAÇO.
#dec: Determina o separador decimal; O default é ".".

#Se o dado estiver no formato csv, existe uma alternativa para read.table(), que é a função read.csv().
#A vantagem é que todos os parâmetros da função já estão setados “corretamente”.
#Assim, só é necessário o seguinte comando:
v1 <- read.csv('viagens.csv')
#O código usando read.table() seria o seguinte:
v1 <- read.table("viagens.txt", header=TRUE, sep=",", dec= ".")

# Checar e Limpar Dados

#Preparar e limpar os dados para análises é essencial e muitas vezes consome mais tempo do que as próprias análises estatísticas.
#Não é comum que os dados brutos estejam no formato correto e sem erros.
#A limpeza de dados é o processo de identificação e correção de quaisquer problemas, para que os dados possam ser analisados com facilidade.
#Dessa forma, vamos usar um conjunto de dados que contém amostras sobre o comportamento de alimentação dos caracóis marinhos.
#Será apresentado como importar, checar, limpar e exportar tais dados usando o R.

#Primeiramente, é necessário definir o diretório.
setwd('C:\\Users\\renan\\Documents\\mestrado')
setwd('G:\\Meu Drive\\MESTRADO UFRPE (RURAL)\\Disciplinas\\Computação para Análise de Dados (CPAD)\\Exercícios\\')

#Importe a amostra de dados:
# header=T: informa que a primeira linha do arquivo contém nomes de variáveis
# strip.white=T: remove espaços em branco antes ou depois dos dados que podem ter sido inseridos por engano durante a entrada de dados.
# na.strings="": substitui as células vazias por NA (dados ausente em R).
Caracol_data <- read.csv(file = 'Snail_feeding.csv')
head(Caracol_data)

#Use o comando str() para checar o status e os tipos de cada variáveis.
str(Caracol_data)

#Colunas extras. Precisam ser removidas...
#Para remover as colunas extras podemos simplesmente escolher as colunas que precisamos usando o comando Caracol_data[m, n].

##Remover as colunas de 1 até 7
Caracol_data <- Caracol_data[, 1:7]
str(Caracol_data)

#A coluna sex possui 5 níveis. Porém deveria ser apenas 2: “female” e “male”.
#É possível checar os níveis de um fator usando os comandos unique() ou level().
unique(Caracol_data$Sex)
levels(Caracol_data$Sex)  # precisa converta para fator

#Para converter “males” ou “Males” em “male” e “female s” em “female” podemos usar os comandos abaixo.
Caracol_data$Sex <- as.factor(Caracol_data$Sex) # converte em fator
levels(Caracol_data$Sex)[2] <- "female"
levels(Caracol_data$Sex)[3] <- "male"
levels(Caracol_data$Sex)[3] <- "male"

#Checando se deu certo.
levels(Caracol_data$Sex)

#Use o comando str()para checar o status e os tipos de cada variáveis.
str(Caracol_data)

# Distance está com o tipo de dado chr, porém, deveria ser apenas uma variável numérica.

#Conversão de fator para numérico
#Assim, devemos primeiro converter para um caractere depois para um numérico, caso não seja chr.
#Se você tentar converter um fator diretamenteem uma variável numérica, os valores se tornarão 
#números que correspondem aos níveis.
#Ao converter para um numérico, você poderá receber uma mensagem de aviso que NAs foram introduzidos porque não foi 
#possível converter de caráter para numérico. Ex.: ‘0.35.
Caracol_data$Distance <- as.character(Caracol_data$Distance)
str(Caracol_data)
Caracol_data$Distance <- as.numeric(Caracol_data$Distance)

#Existem duas formas de resolver esse problema: achar o problema diretamente no datasete corrigir 
#(nem sempre viável) ou criar código para a remoção automática.

#Atualização dos NAs
which(is.na(Caracol_data$Distance))
Caracol_data[682, "Distance"] <- 0.58
Caracol_data[755, "Distance"] <- 0.356452
which(is.na(Caracol_data$Distance))

#Use o comando str() para checar o status e os tipos de cada variáveis.
str(Caracol_data)

#Localizando e removendo dados duplicados
Caracol_data[which(duplicated(Caracol_data)), ] #verifica a linha duplicada mostrando-a por inteira
index <- which(duplicated(Caracol_data)) #guarda o valor da linha duplicada na variável index
Caracol_data <- Caracol_data[-index, ] #remove a linha duplicada e salva no dataset Caracol_data
which(duplicated(Caracol_data)) 
#ou
which(duplicated(Caracol_data)) #verifica a linha duplicada
Caracol_data <- Caracol_data[-733, ] #remove a linha duplicada 733 pelo operador - e salva no dataset Caracol_data
which(duplicated(Caracol_data))

#Checando as estatísticas de cada variável usando a função summary().
summary(Caracol_data)

#Caracóis não vivem abaixo de 2 metros. Deveria ser 1.62...

#Para encontrar profundidades maiores que 2 metros, você pode usar o operator-[] juntamente com a função which():
Caracol_data[which(Caracol_data$Depth > 2), ] #retorna a linha inteira (2 dimensões)
#ou
Caracol_data$Depth[which(Caracol_data$Depth > 2)] #retorna os valores maiores que 2 na coluna Depth existentes (1 dimensão)
#ou
which(Caracol_data$Depth > 2) #retorna a posição (linha)

#Substitua o valor
Caracol_data[8, "Depth"] <- 1.62
summary(Caracol_data)
#ou
Caracol_data[8, 6] <- 1.62
summary(Caracol_data)
#ou 
Caracol_data$Depth[which(Caracol_data$Depth > 2)] <- 1.62
summary(Caracol_data)

#Depois organizar seus dados, é possível verificá-lo rapidamente com alguns comandos:
# summary() fornece estatísticas resumidas para cada variável
# names() retorna os nomes das colunas
# str() fornece a estrutura geral dos seus dados
# head() retorna as primeiras linhas (padrão: 6) do arquivo e o cabeçalho
# tail() retorna as últimas linhas do arquivo e o cabeçalho

#Ordenando dados
#Duas outras operações que podem ser úteis para obter uma visão geral dos seus dados, são sort() e order().

#Ordenando vetores únicos
#ordena de forma crescente somente a coluna Depth
sort(Caracol_data$Depth)

#Ordenando data frame
#ordena de forma crescente a coluna Depth com Temp
Caracol_data[order(Caracol_data$Depth, Caracol_data$Temp), ]

#Ordenando data frame de forma decrescente
#ordena de forma decrescente a coluna Depth com Temp
Caracol_data[order(Caracol_data$Depth, Caracol_data$Temp, decreasing = TRUE), ]

# Exportação de Dados

#Para exportar dados, use as funções write.table () ou write.csv ()
#Verifique ?read.table ou ?read.csv
?read.table  
?read.csv

write.csv(Caracol_data, #Objeto que vcquer exportar
          file = "Caracol_data_limpo.csv", #Nome do arquivo
          row.names = F) #Exclui os nomes das linhas

#Importando Dados de Outros Formatos
#Excel: Pacote xlsx do R
#XML: Pacote XML do R
#JSON: Pacote jsonlite do R

