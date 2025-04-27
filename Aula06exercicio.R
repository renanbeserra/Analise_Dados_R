# Aula 06 - Exercícios

# APOSTILA

#Baixe o dataset Gapminder https://www.dropbox.com/scl/fi/r7fbpij3jxwix0ape3l2x/gapminderDataFiveYear.txt?rlkey=n5eud5hk90v5dm2iaa4c34zl2&e=1&dl=0 
#e responda as questões a seguir.
linhas <- read.delim("C:\\Users\\renan\\Documents\\mestrado\\gapminderDataFiveYear.txt")
head(linhas)
#Usando quantificadores, encontre todos os países com ee, mas não eee, em seu nome.
unique(linhas$country)  # Verificar a coluna de países. Opcional, só pra ver os nomes disponíveis

#Extrair os nomes únicos dos países
paises <- unique(linhas$country)
#Selecionar países com "ee" mas não com "eee"
paises[grepl('ee', paises) & !grepl('eee', paises)]
#ou
grep(pattern = 'ee[^eee]', paises, value = T)

#Encontre os nomes de países que: começam com “South”, termina com “land” 
#e que tenham uma palavra no nome que começa com “Ga”.
paises <- unique(linhas$country)

south <- grep(pattern = '^South', paises, value = T) ; south
land <- grep(pattern = 'land$', paises, value = T) ; land
ga <- grep(pattern = '\\bGa', paises, value = T) ; ga

juntos <- (c(south, land, ga))
juntos

#ou

paises <- unique(linhas$country)
juntos <- paises[grepl('^South', paises) | grepl('land$', paises) | grepl('\\bGa', paises)] ; juntos

#Encontre todos os países que usam pontuação em seu nome.
paises <- unique(linhas$country)
pont <- paises[grepl('[[:punct:]]', paises)] ; pont
#ou
grep(pattern = '[[:punct:]]', paises, value = T)

#Façam a função clean.text () que recebe uma string e:
#Mantém apenas caracteres alfanuméricos. Remove todos os espaços. Converte para minúsculas e retorna a string formatada. 
#Por exemplo, clean.text ("Coeur d'Alene") deve retornar coeurdalene.
clean.text <- function(entrada){
  # Remover caracteres não alfanuméricos
  formata <- gsub("[^a-zA-Z0-9]", "", entrada)
  
  # Remover espaços
  formata <- gsub(" ", "", formata)
  
  # Converter para minúsculas
  formata <- tolower(formata)
  
  return(formata)
}

clean.text("Coeur d'Alene")

#Encontre os países com a letra “i” ou “t” e que terminam com “land”. 
#Além disso, substitua “land” por “LAND” usando o conceito de retrovisor.
paises <- unique(linhas$country)

# Filtrar os países que contêm "i" ou "t" e terminam com "land"
filtro <- grep(pattern = "[i|t]land$", paises, value = T) ; filtro

# Substituir "land" por "LAND" usando o retrovisor
#Substitui "land" por "LAND" usando o conceito de retrovisor (\\1). 
#O \\U converte o grupo capturado em letras maiúsculas (compatível com o parâmetro perl = TRUE).
substitui <- gsub("(land)$", "\\U\\1", filtro, perl = T) ; substitui


#ATIVIDADE

#Dado o vetor com valores de medidas de comprimento em metros v<-c(20,30,4,934,1077,22), submeta a função paste() 
#que apenas adiciona a unidade metro (‘m’) após cada número do vetor. Note que não pode haver espaço entre o número 
#e a unidade de medida. Além disso,  use aspas simples e remova todos os espaços em banco do comando.
v<-c(20,30,4,934,1077,22)
paste(v, 'm', sep='')
paste0(v, 'm')

#Copie o poema "No Meio do Caminho" de Drummond  através do link: 
#https://www.culturagenial.com/poema-no-meio-do-caminho-de-carlos-drummond-de-andrade/. 
#Note que tem que ser copiado e colado exatamente como está no site (sem o título). 
#Calcule e submeta a quantidade de caracteres totais, incluindo os espaços em branco e as quebras de linha(‘\n’).
poema <- "No meio do caminho tinha uma pedra
tinha uma pedra no meio do caminho
tinha uma pedra
no meio do caminho tinha uma pedra.

Nunca me esquecerei desse acontecimento
na vida de minhas retinas tão fatigadas.
Nunca me esquecerei que no meio do caminho
tinha uma pedra
tinha uma pedra no meio do caminho
no meio do caminho tinha uma pedra."

nchar(poema)

#Dado o vetor de strings  txt = c("eeer","3ca1n","fg","can","man","sigmean","fa3nta","fan"), 
#submeta a expressão regular que deve ser escrita no atributo ‘pattern’ da função 
#grep(pattern= " ", txt, value= TRUE) de modo que ela retorne as palavras: "can", "man" e "fan".
txt = c("eeer","3ca1n","fg","can","man","sigmean","fa3nta","fan")
# ^ — início da string
# [cmf] — captura qualquer uma das letras c, m ou f
# an — exatamente os caracteres "an" na sequência
# $ — fim da string
grep(pattern= "^[cmf]an$", txt, value= TRUE)

#Dado a string txt = "eeer3GHJca1nfgSigmanfaUIOntafan",  qual a expressão regular que deve ser adicionada no 
#atributo ‘pattern’ da função str_extract_all(string=string,pattern=" ") para que ela extraia apenas números e 
#letras maiúsculas. Note que você precisa carregar o pacote  stringr. Também use o Regex.
library(stringr)
txt = "eeer3GHJca1nfgSigmanfaUIOntafan"
# A-Z → corresponde a todas as letras maiúsculas
# 0-9 → corresponde a todos os dígitos numéricos
# Os colchetes [] indicam uma classe de caracteres
str_extract_all(string = txt, pattern = "[A-Z0-9]")

#Responda a questão anterior com o POSIX.
str_extract_all(string = txt, pattern = "[[:upper:][:digit:]]")

#Dado a string txt = "tttyUFRPE19PPGIAkjgkjghk2j34j321UFRPEcapdPPGIA", qual a expressão regular que deve ser 
#adicionado no atributo ‘pattern’ da função str_extract_all(string=txt,pattern=" "), para que ela extraia os 
#padrões "UFRPE19PPGIA"  e "UFRPEcapdPPGIA".
txt = "tttyUFRPE19PPGIAkjgkjghk2j34j321UFRPEcapdPPGIA"
# UFRPE — corresponde literalmente à string "UFRPE"
# .*? — corresponde a qualquer sequência de caracteres, de forma não gulosa (ou seja, para no primeiro "PPGIA" encontrado)
# PPGIA — corresponde literalmente à string "PPGIA"
str_extract_all(string = txt, pattern = "UFRPE.*?PPGIA")

#Copie o discurso de Marthin Luther King Jr. do seguinte link: 
#https://www.dropbox.com/scl/fi/72sxh749yicv5iuzhzva5/Dream.txt?rlkey=ju5a34vbblhx5yxqlham5wrk5&dl=0. 
#Qual a expressão regular trás "negro", "negros", "Negro", "Negros", "negra", "negras", "Negra" e "Negras"?
discurso <- "Eu estou contente em unir-me com vocês no dia que entrará para a história como a maior demonstração pela liberdade na história de nossa nação.

Cem anos atrás, um grande americano, na qual estamos sob sua simbólica sombra, assinou a Proclamação de Emancipação. Esse importante decreto veio como um grande farol de esperança para milhões de escravos negros que tinham murchados nas chamas da injustiça. Ele veio como uma alvorada para terminar a longa noite de seus cativeiros.
Mas cem anos depois, o Negro ainda não é livre.
Cem anos depois, a vida do Negro ainda é tristemente inválida pelas algemas da segregação e as cadeias de discriminação.
Cem anos depois, o Negro vive em uma ilha só de pobreza no meio de um vasto oceano de prosperidade material. Cem anos depois, o Negro ainda adoece nos cantos da sociedade americana e se encontram exilados em sua própria terra. Assim, nós viemos aqui hoje para dramatizar sua vergonhosa condição.

De certo modo, nós viemos à capital de nossa nação para trocar um cheque. Quando os arquitetos de nossa república escreveram as magníficas palavras da Constituição e a Declaração da Independência, eles estavam assinando uma nota promissória para a qual todo americano seria seu herdeiro. Esta nota era uma promessa que todos os homens, sim, os homens negros, como também os homens brancos, teriam garantidos os direitos inalienáveis de vida, liberdade e a busca da felicidade. Hoje é óbvio que aquela América não apresentou esta nota promissória. Em vez de honrar esta obrigação sagrada, a América deu para o povo negro um cheque sem fundo, um cheque que voltou marcado com fundos insuficientes.

Mas nós nos recusamos a acreditar que o banco da justiça é falível. Nós nos recusamos a acreditar que há capitais insuficientes de oportunidade nesta nação. Assim nós viemos trocar este cheque, um cheque que nos dará o direito de reclamar as riquezas de liberdade e a segurança da justiça.

Nós também viemos para recordar à América dessa cruel urgência. Este não é o momento para descansar no luxo refrescante ou tomar o remédio tranqüilizante do gradualismo.
Agora é o tempo para transformar em realidade as promessas de democracia.
Agora é o tempo para subir do vale das trevas da segregação ao caminho iluminado pelo sol da justiça racial.
Agora é o tempo para erguer nossa nação das areias movediças da injustiça racial para a pedra sólida da fraternidade. Agora é o tempo para fazer da justiça uma realidade para todos os filhos de Deus.

Seria fatal para a nação negligenciar a urgência desse momento. Este verão sufocante do legítimo descontentamento dos Negros não passará até termos um renovador outono de liberdade e igualdade. Este ano de 1963 não é um fim, mas um começo. Esses que esperam que o Negro agora estará contente, terão um violento despertar se a nação votar aos negócios de sempre

. Mas há algo que eu tenho que dizer ao meu povo que se dirige ao portal que conduz ao palácio da justiça. No processo de conquistar nosso legítimo direito, nós não devemos ser culpados de ações de injustiças. Não vamos satisfazer nossa sede de liberdade bebendo da xícara da amargura e do ódio. Nós sempre temos que conduzir nossa luta num alto nível de dignidade e disciplina. Nós não devemos permitir que nosso criativo protesto se degenere em violência física. Novamente e novamente nós temos que subir às majestosas alturas da reunião da força física com a força de alma. Nossa nova e maravilhosa combatividade mostrou à comunidade negra que não devemos ter uma desconfiança para com todas as pessoas brancas, para muitos de nossos irmãos brancos, como comprovamos pela presença deles aqui hoje, vieram entender que o destino deles é amarrado ao nosso destino. Eles vieram perceber que a liberdade deles é ligada indissoluvelmente a nossa liberdade. Nós não podemos caminhar só.

E como nós caminhamos, nós temos que fazer a promessa que nós sempre marcharemos à frente. Nós não podemos retroceder. Há esses que estão perguntando para os devotos dos direitos civis, Quando vocês estarão satisfeitos?

Nós nunca estaremos satisfeitos enquanto o Negro for vítima dos horrores indizíveis da brutalidade policial. Nós nunca estaremos satisfeitos enquanto nossos corpos, pesados com a fadiga da viagem, não poderem ter hospedagem nos motéis das estradas e os hotéis das cidades. Nós não estaremos satisfeitos enquanto um Negro não puder votar no Mississipi e um Negro em Nova Iorque acreditar que ele não tem motivo para votar. Não, não, nós não estamos satisfeitos e nós não estaremos satisfeitos até que a justiça e a retidão rolem abaixo como águas de uma poderosa correnteza.

Eu não esqueci que alguns de você vieram até aqui após grandes testes e sofrimentos. Alguns de você vieram recentemente de celas estreitas das prisões. Alguns de vocês vieram de áreas onde sua busca pela liberdade lhe deixaram marcas pelas tempestades das perseguições e pelos ventos de brutalidade policial. Você são o veteranos do sofrimento. Continuem trabalhando com a fé que sofrimento imerecido é redentor. Voltem para o Mississippi, voltem para o Alabama, voltem para a Carolina do Sul, voltem para a Geórgia, voltem para Louisiana, voltem para as ruas sujas e guetos de nossas cidades do norte, sabendo que de alguma maneira esta situação pode e será mudada. Não se deixe caiar no vale de desespero.

Eu digo a você hoje, meus amigos, que embora nós enfrentemos as dificuldades de hoje e amanhã. Eu ainda tenho um sonho. É um sonho profundamente enraizado no sonho americano.

Eu tenho um sonho que um dia esta nação se levantará e viverá o verdadeiro significado de sua crença - nós celebraremos estas verdades e elas serão claras para todos, que os homens são criados iguais.

Eu tenho um sonho que um dia nas colinas vermelhas da Geórgia os filhos dos descendentes de escravos e os filhos dos desdentes dos donos de escravos poderão se sentar junto à mesa da fraternidade.

Eu tenho um sonho que um dia, até mesmo no estado de Mississippi, um estado que transpira com o calor da injustiça, que transpira com o calor de opressão, será transformado em um oásis de liberdade e justiça.

Eu tenho um sonho que minhas quatro pequenas crianças vão um dia viver em uma nação onde elas não serão julgadas pela cor da pele, mas pelo conteúdo de seu caráter. Eu tenho um sonho hoje!
  
  Eu tenho um sonho que um dia, no Alabama, com seus racistas malignos, com seu governador que tem os lábios gotejando palavras de intervenção e negação; nesse justo dia no Alabama meninos negros e meninas negras poderão unir as mãos com meninos brancos e meninas brancas como irmãs e irmãos. Eu tenho um sonho hoje!
  
  Eu tenho um sonho que um dia todo vale será exaltado, e todas as colinas e montanhas virão abaixo, os lugares ásperos serão aplainados e os lugares tortuosos serão endireitados e a glória do Senhor será revelada e toda a carne estará junta.

Esta é nossa esperança. Esta é a fé com que regressarei para o Sul. Com esta fé nós poderemos cortar da montanha do desespero uma pedra de esperança. Com esta fé nós poderemos transformar as discórdias estridentes de nossa nação em uma bela sinfonia de fraternidade. Com esta fé nós poderemos trabalhar juntos, rezar juntos, lutar juntos, para ir encarcerar juntos, defender liberdade juntos, e quem sabe nós seremos um dia livre. Este será o dia, este será o dia quando todas as crianças de Deus poderão cantar com um novo significado.

Meu país, doce terra de liberdade, eu te canto.

Terra onde meus pais morreram, terra do orgulho dos peregrinos,

De qualquer lado da montanha, ouço o sino da liberdade!

E se a América é uma grande nação, isto tem que se tornar verdadeiro.

E assim ouvirei o sino da liberdade no extraordinário topo da montanha de New Hampshire.

Ouvirei o sino da liberdade nas poderosas montanhas poderosas de Nova York.

Ouvirei o sino da liberdade nos engrandecidos Alleghenies da Pennsylvania.

Ouvirei o sino da liberdade nas montanhas cobertas de neve Rockies do Colorado.

Ouvirei o sino da liberdade nas ladeiras curvas da Califórnia.

Mas não é só isso. Ouvirei o sino da liberdade na Montanha de Pedra da Geórgia.

Ouvirei o sino da liberdade na Montanha de Vigilância do Tennessee.

Ouvirei o sino da liberdade em todas as colinas do Mississipi.

Em todas as montanhas, ouviu o sino da liberdade.

E quando isto acontecer, quando nós permitimos o sino da liberdade soar, quando nós deixarmos ele soar em toda moradia e todo vilarejo, em todo estado e em toda cidade, nós poderemos acelerar aquele dia quando todas as crianças de Deus, homens pretos e homens brancos, judeus e gentios, protestantes e católicos, poderão unir mãos e cantar nas palavras do velho spiritual negro:
  
  Livre afinal, livre afinal.

Agradeço ao Deus todo-poderoso, nós somos livres afinal."

# \b — Indica uma fronteira de palavra, garantindo que a correspondência ocorra no início ou no fim de uma palavra completa.
# [Nn] — Corresponde tanto a "N" quanto a "n", tornando a busca case-insensitive para a primeira letra.
# egr — Corresponde exatamente à sequência de caracteres "egr".
# [ao] — Corresponde a "a" ou "o", permitindo capturar as variações de gênero ("negra"/"negro").
# s? — O ? torna o "s" opcional, capturando tanto o singular quanto o plural ("negro"/"negros").
# \b — Outra fronteira de palavra para assegurar que a correspondência termine no final da palavra.

str_extract_all(string = discurso, pattern = "\\b[Nn]egr[ao]s?\\b")

#Qual das opções abaixo correspondem a regexp "a(ab)*a" ?
# a — Começa com a letra a
# (ab)* — Pode ter zero ou mais repetições do padrão "ab"
# a — Termina com a letra a
txt <- "abababa"
str_extract_all(string = txt, pattern = "a(ab)*a")
txt <- "aaba" 
str_extract_all(string = txt, pattern = "a(ab)*a")
txt <- "aabbaa" 
str_extract_all(string = txt, pattern = "a(ab)*a")
txt <- "aba" 
str_extract_all(string = txt, pattern = "a(ab)*a")
txt <- "aabababa"
str_extract_all(string = txt, pattern = "a(ab)*a")

#Qual das opções abaixo correspondem a regexp "ab+c?" ?
# a — a string deve começar com a letra "a"
# b+ — deve ter uma ou mais letras "b" em seguida
# c? — pode ter zero ou uma letra "c" (ou seja, o "c" é opcional)
txt <- "abc"
str_extract_all(string = txt, pattern = "ab+c?")
txt <- "ac"
str_extract_all(string = txt, pattern = "ab+c?")
txt <- "abbb"
str_extract_all(string = txt, pattern = "ab+c?")
txt <- "bbc"
str_extract_all(string = txt, pattern = "ab+c?")

#Qual das opções abaixo correspondem a regexp "a.[bc]+" ? 
# a → A string deve começar com a letra "a"
# . → Qualquer único caractere (exceto quebra de linha)
# [bc]+ → Uma ou mais ocorrências de "b" ou "c"
txt <- "abc"
str_extract_all(string = txt, pattern = "a.[bc]+")
txt <- "abbbbbbbb"
str_extract_all(string = txt, pattern = "a.[bc]+")
txt <- "azc"
str_extract_all(string = txt, pattern = "a.[bc]+")
txt <- "abcbcbcbc"
str_extract_all(string = txt, pattern = "a.[bc]+")
txt <- "ac"
str_extract_all(string = txt, pattern = "a.[bc]+")
txt <- "asccbbbbcbcccc"
str_extract_all(string = txt, pattern = "a.[bc]+")

#Qual das opções abaixo correspondem a regexp "abc|xyz" ? 
# O operador | significa "ou"
# Então a expressão casa com exatamente: "abc" ou "xyz" 
txt <- "abc"
str_extract_all(string = txt, pattern = "abc|xyz")
txt <- "xyz"
str_extract_all(string = txt, pattern = "abc|xyz")
txt <- "abc|xyz"
str_extract_all(string = txt, pattern = "abc|xyz")

#Qual das opções abaixo correspondem a regexp "[a-z]+[\.\?!]" ?
# [a-z]+ → uma ou mais letras minúsculas consecutivas
# [\\.\\?!] é uma classe de caracteres que aceita ponto ., interrogação ? ou exclamação !
# Importante: A regex não aceita letras maiúsculas, nem outras pontuações.
textos <- c("battle!", "Hot", "green", "swamping.", "jump up.", "undulate?", "is.?")
grep(pattern = "[a-z]+[\\.\\?!]", textos, value = TRUE)
str_extract_all(string = textos, pattern = "[a-z]+[\\.\\?!]")

#Qual das opções abaixo correspondem a regexp "[a-zA-Z]*[^,]=" ? 
# [a-zA-Z]*    → zero ou mais letras (maiúsculas ou minúsculas)
# [^,]         → um caractere que NÃO seja uma vírgula
# =            → seguido exatamente de um sinal de igual
txt <- c("Butt=", "BotHEr", "=Ample", "FIdDlE7h=", "Brittle =", "Other.=")
str_extract_all(string = txt, pattern = "[a-zA-Z]*[^,]=")
grep(pattern = "[a-zA-Z]*[^,]=", txt, value = T)

#Qual das opções abaixo correspondem a regexp "[a-z][\.\?!]\s+[A-Z]" ? 
txt <- c("A. B", "c! d", "e f", "g.   H", "i?  J", "k L")
grep(pattern = "[a-z][\\.\\?!]\\s+[A-Z]", txt, value = T)
str_extract_all(string = txt, pattern = "[a-z][\\.\\?!]\\s+[A-Z]")

#Qual das opções abaixo correspondem a regexp "(very )+(fat )?(tall|ugly) man" ?
txt <- c("very fat man", "fat tall man", "very very fat ugly man", "very very very tall man")
grep(pattern = "(very )+(fat )?(tall|ugly) man", txt, value = T)
str_extract_all(string = txt, pattern = "(very )+(fat )?(tall|ugly) man")

#Qual das opções abaixo correspondem a regexp "<[^>]+>" ? 
txt <- c("<an xml tag>", "<opentag> <closetag>", "</closetag>", "<>", "<with attribute='77'>")
grep(pattern = "<[^>]+>", txt, value = T)

#Baixe o dataset Gapminder  através do seguinte comando: 
#aux<- read.delim("https://www.dropbox.com/s/4yr2woj8r1p5sbn/gapminderDataFiveYear.txt?dl=1") 
#Após isso, responda as questões a seguir.
aux <- read.delim("https://www.dropbox.com/s/4yr2woj8r1p5sbn/gapminderDataFiveYear.txt?dl=1")
head(aux)
#Usando as expressões regulares, encontre todos os países que possuem uma palavra "and" em seu nome, 
#exemplo "Blulu and Blele".  Abaixo submeta apenas a expressão regular.  Dica: para evitar repetições dos 
#países use os níveis. 
# \\b → âncora de limite de palavra em regex.
# and → exatamente a palavra "and".
# \\band\\b garante que "and" não está colado com outras letras (ex: não casa com Thailand, mas casa com Trinidad and Tobago).
paises <- unique(aux$country) # Extrair nomes únicos de países
paises
grep(pattern = "\\band\\b", paises, value = T)
#ou
grep(pattern = "\\band\\b", unique(aux$country), value = T)

#Encontre os nomes de países que: (i) começam com “Ba”; (ii) terminam com “land”; e (iii) tenham uma palavra no 
#nome que começa com “Ga” (dica: veja \b). Após isso, submeta o total de países encontrados para os itens anteriores. 
#Note que apenas um único número será submetido.  Dica: para evitar repetições dos países uso os níveis. 
# Começam com "Ba"	"^Ba"	^ âncora de início
# Terminam com "land"	"land$"	$ âncora de fim
# Palavra que começa com "Ga"	"\\bGa\\w*"	\\b início de palavra, \\w* resto da palavra
aux <- read.delim("https://www.dropbox.com/s/4yr2woj8r1p5sbn/gapminderDataFiveYear.txt?dl=1")

paises <- unique(aux$country)

ba <- grep(pattern = "^Ba", paises, value = T) ; Ba
land <- grep(pattern = "land$", paises, value = T) ; land
ga <- grep(pattern = "\\bGa\\w*", paises, value = T) ; Ga

totalPaises <- unique(c(ba, land, ga))
length(totalPaises)
