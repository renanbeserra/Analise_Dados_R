# AULA 06 - TEORIA

# Strings e Expressões Regulares

# Funções básicas de Manipulação de Strings

#Imprime textos
print('Eu Amo a Ruralinda')

#Imprime e concatena textos
cat('Eu', 'Amo', 'a', 'Ruralinda')
cat('Eu Amo a Ruralinda')
print('Eu', 'Amo', 'a', 'Ruralinda')

#Concatena textos
paste('Eu', 'Amo', 'a', 'Ruralinda')
paste('Eu', 'Amo', 'a', 'Ruralinda', sep = '_')

#Desconcatena textos
texto <- 'Eu Amo a Ruralinda'
strsplit(texto, split = ' ')

#Altera caixa do texto
texto <- 'eu AMO a Ruralinda'
toupper(texto)  # Maiúsculo
tolower(texto)  # Minúsculo

#Remove espaços em branco
library(stringr)
texto <- ' Eu Amo a Ruralinda '
str_trim(texto)

#Substitui textos
texto <- 'Eu Amo a Ruralinda'
gsub('Ruralinda', 'UFRPE', texto)

#Obtém partes do texto
texto <- 'Eu Amo a Ruralinda'
substr(texto, 1, 8)

#Retorna quantidade de caracteres
texto <- 'Eu Amo a Ruralinda'
nchar(texto)

# Expressões Regulares
#Expressão Regular (Regex -abreviatura mais difundida na internet) é um conjunto de símbolos 
#(metacaracteres) que identifica um padrão de texto.
#Ou seja, por meio do Regex é possível identificar quaisquer textos ou fragmentos, desde que haja um 
#conhecimento prévio sobre a estrutura (padrão) para encontrá-los.
#À primeira vista (segunda, terceira ...), a sintaxe do Regex pode parecer um pouco confusa.
#A Regex não é uma linguagem de programação.
#Pode até parecer algum tipo de linguagem de programação, mas são regras que fazem com que o 
#computador faça o que queremos.

#Funções Relacionadas a Regex

#Na base do R, bem como no pacote “stringr”, muitas funções usam expressões regulares. 
#Abaixo, destaco as principais.

#Detecta a presença ou ausência de um padrão em uma string:
grep(..., value = FALSE)
stringr::str_detect()

#Extrai os padrões correspondentes de uma string :
grep(..., value = TRUE)
stringr::str_extract()
stringr::str_extract_all()

#Localiza um padrão dentro de uma string e retorna a posição (ou posições) correspondente(s):
regexpr()
gregexpr()
stringr::str_locate()
string::str_locate_all()

#Substitue um padrão:
gsub()
stringr::str_replace()
stringr::str_replace_all()

#Divide uma string usando um padrão:
strsplit()
stringr::str_split()

#Metacaracteres
#Os metacaracteres são os símbolos que, combinados, definem um padrão (pattern) para casar (match) um texto.
#Os metacaracteres que compõem umaER são:
#. ? * + ^ $ | [ ] { } ( ) \
#Eles podem ser divididos em 4 tipos:
#Especificadores
#Quantificadores
#Âncoras
#Agrupamento

#Especificadores

#Define o que você quer.
#. (Ponto): literalmente “qualquer coisa”;
#[ ] (Lista): lista de caracteres de acordo com seu conteúdo;
#\(Escape): torna os metacaracteres em texto quando os antecedem;

#Ponto"."
#Combina com tudo, exceto uma nova linha.
letras <- c("^ab", "ab", "abc", "abd", "abe", "ab 12")
grep("ab.", letras, value = TRUE)

#Lista"[]"
#Os colchetes representam uma lista de caracteres, onde os mesmos são usados para combinar APENAS um dos 
#vários caracteres.
#Também podemos usar “-” dentro dos colchetes para especificar um intervalo de caracteres.
texto <- c("Eu", "Amo", "a", "Rural")
grep(pattern = "[Aal]", texto, value = TRUE)

numericos= c("123", "27-Abril", "I-II-III", "R 3.0.1")
grep(pattern = "[01]", numericos, value = TRUE) #qualquer um que tenha 0 ou 1
grep(pattern = "[01I]", numericos, value = TRUE) #qualquer um que tenha 0, 1 ou I
grep(pattern = "[0-9]", numericos, value = TRUE) #qualquer dígito de 0 à 9
grep(pattern = "[4-9]", numericos, value = TRUE) #qualquer dígito de 4 à 9
grep(pattern = "[^0-9]", numericos, value = TRUE) #qualquer coisa que não seja um dígito de 0 à 9 
grep(pattern = "[^4-9]", numericos, value = TRUE) #qualquer coisa que não seja um dígito de 4 à 9

#Escape "\"
#O metacaractere escape “\” permite o uso de um metacaratere existente.
texto <- ("Eu.Amo.a.Ruralinda")
gsub(pattern = ".", " ", texto)
gsub(pattern = "\\.", " ", texto)

#Quantificadores

#Indicam quantas vezes um padrão se repete.
# * (Asterisco): qualquer quantidade;
# + (Mais): ao menos uma ocorrência;
# ? (Opcional): no máximo uma ocorrência;
# {n,m} (Chaves): número mínimo e máximo de repetições;

#Asterisco "*"
#Significa “0” vezes ou mais ocorrências de um padrão.
#a: A string deve começar com a letra "a".
#c*: Seguido de zero ou mais ocorrências da letra "c". ​
#b: E terminar com a letra "b".
palavras <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac*b", palavras, value = TRUE)

#Mais "+"
#Significa “1” vez ou mais ocorrências de um padrão.
palavras <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac+b", palavras, value = TRUE)

#Opcional "?"
#Significa no máximo “1”vez.
palavras <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac?b", palavras, value = TRUE)

#Chaves "{n,m}"
#Significa o número de repetições.
palavras <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac{2}b", palavras, value = TRUE)  # aparecerá c 2x
grep("ac{2,}b", palavras, value = TRUE) # aparecerá c 2x ou mais 
grep("ac{2,3}b", palavras, value = TRUE)  # aparecerá c 2x ou 3x

#Âncoras

#Buscam por correspondências em qualquer parte de uma sequência de caracteres.
# ^ (Circunflexo): início da string;
# $ (Cifrão): fim de linha;
# \d (dígito): encontra correspondência com um número;

#Circunflexo "^"
#Busca correspondência no início da string.
palavras <- c("abcd", "cdab", "cabd", "c abd")
grep("ab", palavras, value = TRUE)
grep("^ab", palavras, value = TRUE)

#Cifrão "$"
#Busca correspondência no fim da string.
palavras <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ab$", palavras, value = TRUE)

#Dígito "\d"
palavras <- c("Eu Amo a Rural 2025")
gsub("\\d", "_", palavras)

#Agrupamento

#Define combinações que você quer.
# | (Ou): condicional de ocorrências;
# ( ) (Grupo): conjunto de combinações;
# \1 … \9 (Retrovisor): texto casado por algum grupo (de 1 a 9);

#Ou "|"
#É um operador “ou” que busca correspondências em ambos os lados da barra (|).
palavras <- c("^ab", "ab", "abc", "abd", "abe", "ab 12")
grep("abc|abd", palavras, value = TRUE)

#Grupo "()"
#Os parênteses definem um grupo e o seu conteúdo pode ser visto como um bloco na expressão.
#Todos os metacaracteres quantificadores que vimos anteriormente podem ser usados junto com os grupos.
palavras <- c("ha", "haha", "hahaha", "kkkk")
grep("(ha)+", palavras, value = TRUE)
palavras2 <- c("Bom-dia", "Boa-Noite", "Boa-Tarde")
grep("Boa-(Tarde|Noite)", palavras2, value= TRUE)

#Retrovisor "\1 … \9"
#O retrovisor permite reutilizar textos de grupos casados com a expressão regular.
#O nome “retrovisor” (backreference) é porque a expressão olha para trás em busca de um trecho já casado .
#Pode-se fazer uso de 9 retrovisores.
#A expressão “(lenta)(mente) é \2 \1” casa com “lentamente é mente lenta”.
#A expressão “([0-9])\1” casa com dois números repetidos, por exemplo: 66, 77, 88, etc.
# Eu: A string deve começar com "Eu".
# (amo): Define um grupo que captura a palavra "amo".
# \1: Refere-se ao primeiro grupo capturado, que é "amo". Isso significa que a palavra "amo" 
#Sdeve aparecer duas vezes consecutivas.
# a Rural: A string deve terminar com "a Rural".
palavras <- c("Eu amo a Rural", "Eu amo amo a Rural")
grep("Eu (amo) \\1 a Rural", palavras, value = T)
# ([0-9]): Define um grupo que captura qualquer dígito de 0 a 9.
# \1\1: Refere-se ao primeiro grupo capturado repetido duas vezes consecutivas. 
#Isso significa que o dígito deve aparecer três vezes consecutivas.
numeros <- c(1,30,344,333,555,3333,33)
grep("([0-9])\\1\\1", numeros, value = T) # aparecerão dígitos repetidos 3x ou mais
grep("([0-9])\\1", numeros, value = T)  # aparecerão dígitos repetidos 2x ou mais
grep("([0-9])\\1\\1\\1", numeros, value = T)  # aparecerão dígitos repetidos 4x ou mais

#POSIX

#Intimamente relacionado às classes de caracteres regex, temos o que é conhecido como 
#classes de caracteres POSIX.
#Em R, as classes de caracteres POSIX são representadas com expressões dentro de colchetes duplos [[ ]].
texto <- "Eu gosto de Cerveja! #cerveja, @cade_minha_cerveja, Eu gosto (v3.2.2) #rr2020"

# remove espaços em branco ou tabs
gsub(pattern = "[[:blank:]]", replacement = "", texto)

# Substitui pontuação por espaços em branco
gsub(pattern = "[[:punct:]]", replacement = "", texto)

# remove caracteres alfanuméricos
gsub(pattern = "[[:alnum:]]", replacement = "", texto)

# Exemplos práticos

#Extrair dígitos de uma sequência de caracteres.
palavra <- "Meu número é 1006781"
gsub(pattern = "[^0-9]", replacement = "", x = palavra)
gsub(pattern = "[^0-5]", replacement = "", x = palavra)

#Retornar o index de um valor, caso o mesmo esteja presente em um vetor.
valores <-c("A1","A2","A3","A4","A5","A6","A7")
grep(pattern = "A1|A4", x = valores, value = F)
grep(pattern = "A1|A4", x = valores, value = T)
grep(pattern = "A1|A4|A5", x = valores, value = F)

#Extrair apenas os valores em pares de valores-chave.
string <-c("G1:E001", "G2:E002", "G3:E003")
gsub(pattern = ".*:", replacement = "", x = string)
gsub(pattern = ":.*", replacement = "", x = string)

#Extrair informações contidas dentro de parênteses de uma string.
library(stringr)
string <- "Oq vai fazer amanhã ? (Estudar CPAD) Ver vídeos (Jogar) (Nadar)"
str_extract_all(string, "\\(.*?\\)")[[1]]
str_extract_all(string, "\\(.*?\\)")
str_extract_all(string, "\\(.*\\)")

#Extair endereços de e-mail de uma determinada string.
library(stringr)
string <- c("ermeson@gmail.com bla bla bla ermeson.andrade@ufrpe.br")
str_extract_all(string = string, pattern = "\\S*@\\S*")
str_extract_all(string = string, pattern = "\\@\\S*")
str_extract_all(string = string, pattern = "\\S*@")




