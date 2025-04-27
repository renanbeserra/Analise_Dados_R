# Aula 08 - Teoria

# Manipulação Avançada

# Introdução

#Nesta aula iremos aprender funções avançadas que permitem manipular facilmente grandes volumes de dados e 
#obter estatísticas desses dados. e.x.:merge()eaggregate()

# merge(): Combinando Dados

#Uma das tarefas mais comuns de gerenciamento de dados é mesclar (ou combinar) dois conjuntos de dados juntos.
#Exemplo:
#Imagine que você conduziu um estudo em que 5 participantes receberam uma pontuação de 1 a 5 em uma tarefa de 
#avaliação de riscos. Podemos representar esses dados em um data frame chamado risco.survey:
risco.survey <- data.frame("ID.part" = c(1, 2, 3, 4, 5), "av.risco" = c(3, 4, 5, 3, 1))
risco.survey

#Agora,imagine que,em um segundo estudo, você fez os participantes completar em uma pesquisa sobre seu nível de 
#felicidade (em uma escalade 0 a 100). Podemos representar esses dados em um novo dataframe chamado felicidade.survey:
felicidade.survey <- data.frame("ID.part" = c(4, 2, 5, 1, 3), "feli.score" = c(20, 40, 50, 90, 53))
felicidade.survey

#Agora, gostaríamos de combinar esses dados em um data.frame para que as duas pontuações da pesquisa para cada 
#participante estejam contidas em um único objeto.Para fazer isso, use merge().
#x,y -> Dois dataframes para serem mesclados.
#by -> Especifica as colunas usadas para a mesclagem.
#all -> Um valor lógico que indica se deve ou não incluir linhas com valores não correspondentes de by.

#O argumento chave em merge() é o by.
#Esse argumento by especifica como as linhas devem ser correspondidas durante a mesclagem.
#Geralmente, a mesclagem é feita através dos identificadores únicos como nomes ou números de identificação.
#Vamos combinar nossa pesquisa de risco e felicidade usando merge ().
#Como queremos corresponder as linhas pela coluna ID.part, especificaremos by = "ID.part".
#Além disso, como queremos incluir linhas com valores potencialmente não correspondentes, incluiremos “all = TRUE”.
combinado.survey <- merge(x = risco.survey, y = felicidade.survey, by = "ID.part", all = T)
combinado.survey

# aggregate(): Agregação Agrupada

#A função aggregate() divide um dataframe x em subconjuntos, cria um sumário estatístico para cada um desses 
#subconjuntos e retorna o resultado de uma forma conveniente.
#Estrutura geral do aggregate()
aggregate(x = dv ~ iv, #dv é a variável e iv é o grupo
          FUN = fun, #A função que você deseja aplicar
          data = df #O objeto dataframecontendo dve iv
          )

#Vamos usar o aggregate () no conjunto de dados ChickWeight para responder à pergunta "Qual é o peso médio das 
#galinhas para cada dieta?"
head(ChickWeight)
#Calcule o peso médio para cada dieta
#A função aggregate irá agregar ou agrupar os pesos por dieta(1, 2, 3, 4) e calcular a média delas.
aggregate(x = weight ~ Diet, #dv(variável) é o peso, iv(grupo) é a Dieta
          FUN = mean, # Calcula a média de cada grupo
          data = ChickWeight # O dataframeé o ChickWeight
          )

#Qual foi a temperatura média de NY para os meses do estudo descrito no dataset airquality ?
#A função aggregate irá agregar ou agrupar as temperaturas por mês(5, 6, 7, 8, 9) e calcular a média delas.
head(airquality)
aggregate(x = Temp ~ Month,
          FUN = mean,
          data = airquality)

#Você também pode incluir um argumento “subset=” dentro da função aggregate() para aplicar uma condição para a 
#criação dos subconjuntos dos dados originais. 
#Por exemplo, se quisesse calcular o peso médio dos frangos para cada dieta, mas somente se os filhotes tivessem 
#menos de 10 dias.
head(ChickWeight)

#Calcule o peso médio para cada dieta
aggregate(x = weight ~ Diet, #DV é peso, IV é Dieta
          FUN = mean, #Calcula a média de cada grupo
          subset = Time < 10, #Só quando os frangos têm menos de 10 semanas
          data = ChickWeight #O dataframe é o ChickWeight
          )

#Qual foi a temperatura média de NY para os meses do estudo descrito no dataset airquality, 
#mas somente para os casos onde o vento foi menor que 10 ?
head(airquality)
aggregate(x = Temp ~ Month,
          FUN = mean,
          subset = Wind < 10,
          data = airquality
          )

# O Pacote dplyr

#O pacote dplyr (A Grammar of Data Manipulation) é hoje um dos pacotes mais utilizados para esta manipulação avançada 
#de dataframes. Ele disponibiliza diversas funções que são “equivalentes” às funções básicas do R, mas com melhorias 
#que nos poupam tempo e deixam o código muito mais fácil de interpretar.
#As funções do dplyr são todas em formas de verbo que são razoavelmente auto-explicativas.
#Vamos ver aqui as seis principais funções que, em conjunto, permitem fazer bastante coisa.

#Pacote
install.packages("dplyr")
library(dplyr)

# filter()
#Seleciona linhas específicas, de acordo com uma condição que se deseja.
filter(airquality, Temp < 70, Wind > 14)

# select()
#Utilizado na seleção de variáveis (colunas).
head(select(airquality, Temp, Wind))

# mutate()
#Usada para criar novas variáveis.
#O grande diferencial dessa função em relação à função base do R, é que podemos utilizar variáveis criadas dentro do 
#próprio comando.
df <- mutate(airquality, 
             celsius = (airquality$Temp - 32) / 1.8
             )
head(df)

# arrange()
#Utilizada para ordenar as colunas (semelhante a função order()).
head(arrange(df, celsius))

# summarise() e group_by()
#A função summarise() transforma um vetor (e.g.:, um vetor de preços) em um único número de acordo com uma função 
#(e.g.:, preço médio ou preço mediano).
#Geralmente ela é utilizada em conjunto da função group_by().
summarise(airquality,
          maxfahrenheit = max(Temp),
          Contador = n()
          )

temp_by_month <- group_by(airquality, Month) ; temp_by_month
summarise(temp_by_month,
          maxfahrenheit = max(Temp)
          )

# operador %>% (chamado de pipe)
#Até agora talvez você não tenha visto muita vantagem em utilizar odplyr.
#A grande vantagem do pacote e das funções em formas de verbo aparece quando concatenamos várias operações 
#em sequência com o auxílio do operador %>%.
airquality %>%
  group_by(Month) %>%
  filter(Temp > 80) %>%
  summarise(
    SomaTemp = sum(Temp),
    mediaWind = mean(Wind)
  )


# O pacote tidyr

#O pacote tidyr dispõe de funções úteis para deixar os seus dados no formato que você precisa para a análise.
#Ou seja, utilizamos para deixá-los tidy.
#Esse pacote se integra perfeitamente com o dplyr, usando o conector %>%, e tem a sintaxe de suas funções bastante 
#intuitiva. As principais funções são gather(), spread(), unite() e separate().

#Pacote
install.packages("tidyr")
library(tidyr)

# gather()
#Cada coluna deve ser uma única variável e cada linha deve ser uma única observação.
#Essa função é usada para união de colunas, no caso em que informações de uma mesma variável estão divididas em 
#diferentes colunas.
#A primeira coluna possuirá o nome das colunas antigas, enquanto a segunda possuirá os valores relacionados as mesmas.

#Transformando o nome das linhas em colunas
head(USArrests)
USArrests$State <- rownames(USArrests)
head(USArrests)

df1 <- USArrests %>%
  gather(
    key = "tipo_crime", 
    value = "valor",
    -State
         )
head(df1)

#A “chave” corresponde a coluna que guardará o nome das colunas antigas (categorias).
#O “value” corresponde a coluna que guardará os valores para cada uma das antigas colunas.
#-State: exclui a coluna State desse processo de transformação, mantendo-a como está. 
#Corresponde as colunas que desejamos combinar.

# spread() ATUALIZADO PARA: pivot_wider() 
#Essa função é essencialmente o inverso da gather(). 
#Ela espalha uma variável nas colunas.
#Uma desfaz o que a outra faz.
df2 <- df1 %>%
  spread(
    key = "tipo_crime",
    value = "valor"
  )
head(df2)

#Use a função spread() para decompor a variável spray em relação a count do dataset InsectSprays.
head(InsectSprays)

# Veja os dados antes
head(InsectSprays)

# Adicionando um identificador único por grupo de spray
df_id <- InsectSprays %>%
  group_by(spray) %>%
  mutate(id = row_number())

# Aplicando spread
df_spray <- df_id %>%
  spread(
    key = spray, 
    value = count
    )

head(df_spray)

#ou

df_wider <- df_id %>%
  pivot_wider(
    names_from = spray, 
    values_from = count
    )

head(df_wider)


# unite().
#Transforma várias colunas em uma só usando um operador.
#É muito utilizada para montar relatórios finais ou tabelas para análise visual.
head(df2)
df3 <- df2 %>%
  unite(
    col = "Murder_Assault",
    Murder, 
    Assault,
    sep = "_"
    )
head(df3)

# separate()
#O separate() é usado para separar duas variáveis que estão em uma mesma coluna.
#É muito normal virem variáveis juntas em uma única coluna, cabe avaliar quando vale a pena separá-las.
df4 <- df3 %>%
  separate(
    col = "Murder_Assault",
    into = c("Murder", "Assault"),
    sep = "_"
  )
head(df4)

