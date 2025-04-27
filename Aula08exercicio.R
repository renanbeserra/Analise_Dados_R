# Aula 08 - Exercícios

# Manipulação Avançada

#Você está encarregado de analisar os resultados de um experimento que testa os efeitos de diferentes formas de cafeína 
#em uma medida de desempenho. No experimento, 100 participantes receberam chá verde ou café, em doses de 1 ou 5 porções.
#Eles então realizaram um teste cognitivo, onde as mais altas pontuações(scores) indicam melhor desempenho.

#1.Carregue o conjunto de dados de https://raw.githubusercontent.com/ndphillips/ThePiratesGuideToR/master/data/caffeinestudy.txt 
#como um novo data frame chamado cafeína.
cafeina <- read.table("https://raw.githubusercontent.com/ndphillips/ThePiratesGuideToR/master/data/caffeinestudy.txt")
head(cafeina)

#2.Calcular a idade média para cada sexo.
aggregate(x = age ~ gender,
          FUN = mean,
          data = cafeina
          )

#3.Calcule a idade média para cada bebida.
aggregate(x = age ~ drink,
          FUN = mean,
          data = cafeina
          )

#4.Calcule a idade média para cada nível combinado de gênero e bebida.
aggregate(x = age ~ gender + drink,
          FUN = mean,
          data = cafeina
          )
#gender    drink      age
#1 female   coffee 25.25000 #média de idade das mulheres que bebem café
#2   male   coffee 25.18182 #média de idade dos homens que bebem café
#3 female greentea 23.72727 #média de idade das mulheres que bebem chá
#4   male greentea 24.75000 #média de idade das homens que bebem chá

#5.Calcular a pontuação (score) mediana para cada idade.
aggregate(x = score ~ age,
          FUN = median,
          data = cafeina
          )

#6.Para homens apenas, calcule a pontuação máxima para cada idade.
aggregate(x = score ~ age,
          FUN = max,
          subset = gender == "male",
          data = cafeina
          )

#7.Calcule, para cada nível da variável bebida, a média, a mediana, o máximo e o desvio padrão das pontuações.
cafeina %>%
  group_by(drink) %>%
  summarise(
    media_score = mean(score),
    mediana_score = median(score),
    maximo_score = max(score),
    desvio_score = sd(score)
  )

#8.Somente para mulheres acima de 20 anos, calcule para cada nível combinado de bebida (drink) e copos (cups), a média, 
#a mediana, o máximo e o desvio padrão das pontuações.
cafeina %>%
  group_by(drink, cups) %>%
  filter(gender == "female" & age > 20) %>%
  summarise(
    media_score = mean(score),
    median_score = median(score),
    maximo_score = max(score),
    desvio_score = sd(score)
  )
#pontuação(média, mediana, máximo e o desvio padrão) das mulheres acima de 20 anos que bebem 1 ou 5 porções de café ou chá verde
  #drink     cups media_score median_score maximo_score desvio_score
  #<chr>    <int>       <dbl>        <dbl>        <dbl>        <dbl>
#1 coffee       1        9.40         8.67         14.2         2.46  
#2 coffee       5       59.8         58.7          73.6         6.15
#3 greentea     1       22.1         20.6          29.5         4.48
#4 greentea     5       38.6         38.4          45.1         4.71


#Você está encarregado de analisar um conjunto de dados que contém casos de tuberculose(TB) relatados entre 1995 e 2013,
#ordenados por país, idade e sexo. O recurso mais exclusivo desses dados é o seu sistema de codificação. 
#As colunas de três a vinte e três codificam quatro partes separadas de informações em seus nomes de coluna:
#As três primeiras letras de cada coluna indicam se a coluna contém casos novos ou antigos de TB.
#As próximas duas letras descrevem os tipos de casos que estão sendo contados.
#A sexta letra descreve o sexo dos pacientes com tuberculose.
#Os números restantes descrevem a faixa etária dos pacientes com TB.

#1.Carregue o conjunto de dados de http://stat405.had.co.nz/data/tb.csv como um novo dataframe chamado TB.
TB <- read.csv(file = "http://stat405.had.co.nz/data/tb.csv")
head(TB)

#2.Observe que o conjunto de dados TB é desordenado de várias maneiras. 
#Primeiramente, mova os valores das colunas 3 até 23 para uma única coluna chamada de “Informacao”. Dica use o gather().
TB <- TB %>%
  gather(
    key = "informacao", 
    value = "valor", 
    3:23
  )
head(TB)

#3.Divida os conteúdos da variável “informacao” em cada sublinhado(”_”). Dica use o separate() e chame as colunas 
#resultantes de "caso", "tipo" e "sexofaixa".
TB <- TB %>%
  separate(
    col = "informacao",
    into = c("caso", "tipo", "sexofaixa"),
    sep = "_"
  )

head(TB)

#4.Por fim, divida a variável que contém o sexo e a faixa etária ("sexofaixa”) de modo a criar uma coluna de sexo e 
#uma coluna de faixa.
TB <- TB %>%
  separate(
    col = "sexofaixa",
    into = c("sexo", "faixa"),
    sep = "1"
  )
head(TB)
TB
tail(TB)


# Lista

#Instale e carregue o pacote dplyr. Em seguida use o seguinte comando para carregar os dados que irá trabalhar: 
#df=data.frame(Theoph). Note que Wt: é o peso do sujeito (kg); Dose: é a dose de teofilina administrada por via oral 
#ao indivíduo (mg / kg); Time: é o tempo desde a administração do medicamento quando a amostra foi coletada (h); 
#e conc: é concentração de teofilina na amostra(mg / L). Responda as questões abaixo usando exclusivamente 
#o pacote dplyr. Também use um dos padrões a seguir: filter(dataset,<<>>) ou dataset%>%filter(<<>>).
install.packages("dplyr")
library(dplyr)

df = data.frame(Theoph)
head(df)

#Qual o comando seleciona apenas a coluna Dose de df ? Ao submeter a resposta remova todos os espaços em branco.
select(df,Dose)

#Qual o comando apresenta os dados para as doses maiores que 5 mg/kg ? 
#Ao submeter a resposta remova todos os espaços em branco.
df%>%filter(Dose>5)
#ou
filter(df,Dose>5)

#Qual o comando seleciona as linhas de 10-20 ?
#Dica: use o "slice". Ao submeter a resposta remova todos os espaços em branco.
df%>%slice(10:20)

#Qual comando apresenta os dados para as doses maiores que 5 
#e cujo o tempo desde a administração do medicamento (Time) é maior que a média do mesmo? 
#Use apenas um único comando. Ao submeter a resposta remova todos os espaços em branco.
df%>%filter(Dose>5,Time>mean(Time))
#ou
df%>%filter(Dose>5&Time>mean(Time))

#Qual comando organiza df por peso (decrescente) ? Ao submeter a resposta remova todos os espaços em branco.
df%>%arrange(desc(Wt))

#Qual comando organizar df por peso (crescente) e tempo (decrescente) ?
#Ao submeter a resposta remova todos os espaços em branco.
df%>%arrange(Wt,desc(Time))

#Qual comando cria uma nova coluna chamada "tendencia" que é igual à Time-mean(Time)? 
#Ao submeter a resposta remova todos os espaços em branco.
df%>%mutate(tendencia=Time-mean(Time))

#Qual comando apresenta a maior concentração de teofilina ? Não use nenhum nome para a coluna resultante. 
#Ao submeter a resposta remova todos os espaços em branco.
df%>%summarise(max(conc))

#Para os exercícios abaixo, usaremos dois conjuntos de dados relacionados aos tempos de atraso de vôos do 
#Bureau of Transportation Statistics dos EUA (X673598238_T_ONTIME_REPORTING e L_UNIQUE_CARRIERS.csv_). 
#Para carregar os dados é importante que vocês usem os seguintes argumentos: quote="\"", sep = "," . 
#Note que a extensão ".csv_" está correta. O data frame do arquivo (X673598238_T_ONTIME_REPORTING)  
#possui apenas informações da companhia aérea por código. No entanto, queremos saber os nomes das companhias aéreas. 
#Assim, faça o merge dos datasets "X673598238_T_ONTIME_REPORTING" e "L_UNIQUE_CARRIERS.csv_" 
#através das colunas "OP_UNIQUE_CARRIER" e "Code". Em seguida, responda as questões abaixo.
voo <- read.csv(file = "L_UNIQUE_CARRIERS.csv", quote = "\"", sep = ",")
atraso <- read.csv(file = "673598238_T_ONTIME_REPORTING.csv", , quote = "\"", sep = ",")
head(voo)
head(atraso)

voo_atraso <- merge(x = voo, y = atraso, by.x = "Code", by.y = "OP_UNIQUE_CARRIER")
#voo_atraso <- merge(x = atraso, y = voo, by.x = "OP_UNIQUE_CARRIER", by.y = "Code")
head(voo_atraso)

#Qual companhia teve o maior atraso ?
voo_atraso %>% 
  filter(DEP_DELAY_NEW == max(DEP_DELAY_NEW, na.rm = T)) %>%
  select(Description, DEP_DELAY_NEW)
#ou
voo_atraso %>%
  filter(!is.na(DEP_DELAY_NEW)) %>%
  filter(DEP_DELAY_NEW == max(DEP_DELAY_NEW, na.rm = TRUE)) %>%
  select(Description, DEP_DELAY_NEW)

#Qual companhia atrasa mais na média ?
voo_atraso %>%
  group_by(Description) %>%
  summarise(media_atraso = mean(DEP_DELAY_NEW, na.rm = T)) %>%
  arrange(desc(media_atraso)) %>%
  slice(1)

#Qual companhia atrasa menos na média ?
voo_atraso %>%
  group_by(Description) %>%
  summarise(media_atraso = mean(DEP_DELAY_NEW, na.rm = T)) %>%
  arrange(media_atraso) %>%
  slice(1)

#Qual companhia teve a maior proporção dos atrasos? 
#As linhas que não possuem informações dos atrasos precisam ser removidas.
voo_atraso %>%
  filter(!is.na(DEP_DELAY_NEW)) %>%
  group_by(Description) %>% #Remove linhas sem informações de atraso
  mutate(atraso_ocorreu = ifelse(DEP_DELAY_NEW > 0, 1, 0)) %>%  #Cria uma coluna indicando se houve atraso
  summarise(propor_atraso = sum(atraso_ocorreu) / n()) %>%
  arrange(desc(propor_atraso)) 
# filter ... : Remove as linhas onde a coluna DEP_DELAY_NEW é NA (linhas sem informações de atraso).
# mutatte ... : Cria uma nova coluna atraso_ocorreu onde 1 indica que houve atraso (valores maiores que 0), e 0 
#indica que não houve atraso.
# group_by ... : Agrupa os dados por companhia aérea.
# summarise ... : Calcula a proporção de voos atrasados para cada companhia:
#sum(): conta o número de voos atrasados (soma os valores 1).
#n(): representa o número total de voos para cada companhia.
# arrange ... : Ordena os resultados em ordem decrescente de proporção de atrasos.
# slice(1): Seleciona apenas a primeira linha, que corresponde à companhia com a maior proporção de atrasos.

#Você está encarregado de analisar um conjunto de dados que contém casos de tuberculose (TB) relatados entre 1995 e 2013, 
#ordenados por país, idade e sexo. O recurso mais exclusivo desses dados é o seu sistema de codificação. 
#As colunas de três a vinte e três codificam quatro partes separadas de informações em seus nomes de coluna: 
#(i) As três primeiras letras de cada coluna indicam se a coluna contém casos novos ou antigos de TB. 
#(ii) As próximas duas letras descrevem os tipos de casos que estão sendo contados. 
#(iii) A sexta letra descreve o sexo dos pacientes com tuberculose. 
#Os números restantes descrevem a faixa etária dos pacientes com TB. 
#Carregue o conjunto de dados de http://stat405.had.co.nz/data/tb.csv como um novo dataframe chamado TB. 
#Observe que o conjunto de dados TB é desordenado de várias maneiras. 
#Primeiramente, remova a coluna "new_sp" que contém o total de casos. 
#Em seguida, mova os valores das colunas 3 até 22 para duas colunas chamadas de “Código” e "N_casos". Dica use o gather(). 
#Após isso, divida os conteúdos da variável “Código” em cada sublinhado(”_”). Dica use o separate(),
#e chame as colunas resultantes de "caso", "tipo” e "sexofaixa”. 
#Por fim, divida a variável que contém o sexo e a faixa etária ("sexofaixa”) de modo a criar uma coluna de "sexo" e 
#uma coluna de "faixa". De posse do data frame resultante, responda as questões abaixo.
library(dplyr)
library(tidyr)
# Carregar o conjunto de dados
TB <- read.csv("http://stat405.had.co.nz/data/tb.csv", quote = "\"", sep = ",")
head(TB)

# Remover a coluna "new_sp"
TB <- TB %>% select(-new_sp)
head(TB)

# Transformar colunas 3 a 22 em duas colunas: "Código" e "N_casos"
TB <- TB %>% gather(key = "Código", value = "N_casos", 3:22)
head(TB)

# Separar a coluna "Código" em "caso", "tipo" e "sexofaixa"
TB <- TB %>% separate(Código, into = c("caso", "tipo", "sexofaixa"), sep = "_")
head(TB)

# Separar "sexofaixa" em "sexo" e "faixa etária"
TB <- TB %>% separate(sexofaixa, into = c("sexo", "faixa etária"), sep = "(?<=^[a-zA-Z])")
head(TB)

# Remover valores NA da coluna "N_casos"
TB <- TB %>% filter(!is.na(N_casos))
head(TB)

# Renomear a coluna iso2 para country
TB <- TB %>% rename(país = iso2)
TB <- TB %>% rename(ano = year)
head(TB)

#Qual foi a quantidade de casos para a Tailândia (TH) de pessoas do sexo Masculino?
TB %>% 
  filter(país == "TH", sexo == "m") %>%
  summarise(qtd_casos = sum(N_casos))

#Qual a proporção de casos para os estados unidos (US) ? Não considerar valores NAs da coluna "N_casos".
TB %>%
  filter(país == "US") %>%
  summarise(proporcao = sum(N_casos) / sum(TB$N_casos))

#Qual a quantidade de casos para a faixa etária 2534 do sexo feminino?
TB %>% 
  filter(`faixa etária` == 2534, sexo == "f") %>%
  summarise(qtd_casos = sum(N_casos))

#Qual foi a quantidade de casos para a década de 2000 ? A década de 2000, também referida como anos 2000, 
#compreende o período de tempo entre 1 de janeiro de 2000 e 31 de dezembro de 2009.
TB %>% 
  filter(ano >= 2000 & ano <= 2009) %>%
  summarise(qtd_casos = sum(N_casos))
