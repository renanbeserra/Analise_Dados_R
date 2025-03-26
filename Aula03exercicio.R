# AULA 03 EXERCÍCIO

# Crie um diretório de trabalho chamado: ”Meu RCurso”.
# Rode o RStudio e mude o seu diretório para ”Meu RCurso”.
setwd("G:\\Meu Drive\\MESTRADO UFRPE (RURAL)\\Disciplinas\\Computação para Análise de Dados (CPAD)\\Exercícios\\Meu RCurso")

# Use o R para os seguintes cálculos: 334+456, 900/45, 899-844 e 73*73
soma = 334 + 456
soma

div = 900 / 45
div

subt = 899 - 844 
subt

mult = 73 * 73
mult

# Atribua o valor 133 para X e o valor 36 para Y.
x <- 133
y <- 36

# Adicione a soma de X e Y a Z e apresente o valor de Z na tela.
z <- x + y
z

# Calcule a raiz quadrada de Z e o logaritmo do resultado da raiz quadrada.
raiz = sqrt(z)
raiz
logar = log(raiz)
logar

# Veja para que o comando demo() serve. Na linha de comando, tente demo(graphics). 
demo()
demo(graphics)

# Veja os objetos criados usando a função ls().
ls()

# Delete alguns desses objetos usando rm().
rm(x, div, soma)

# Delete todos os objetos rm(list = ls()).
rm(list = ls())


# Atribua o valor 133 para X e o valor 36 para Y. Em sequência, adicione a soma de X e Y a Z.  
# Depois, calcule a raiz quadrada de Z e o logaritmo natural do resultado da raiz quadrada. 
# Por fim, arredonde o resultado para zero dígitos.  Qual o valor resultante ? Note que a resposta é um número inteiro.
x <- 133 
y <- 36 
z <- x + y
raiz = sqrt(z)
logar = log(raiz)
round(logar, digits = 0)

# Pesquise a respeito da “sequência de Fibonacci”  (a sequência inicia com ZERO) e 
# obtenha os cinco primeiros números dessa sequência. Qual o logarítimo natural da soma desses cinco números? 
# (Observação: use a função round() para arredondar a resposta de modo que ela tenha apenas três casas decimais)
soma <- sum(0, 1, 1, 2, 3)
logar_soma <- log(soma)
round(logar_soma, digits = 3)

# Dada a função f(x) = sin(x) + x. Calcule o valor da derivada de primeira ordem de f(x) quando x=2. 
# (Observação: use a função round() para arredondar a resposta de modo que ela tenha apenas três casas decimais)
x <- 2
f2 <- sin(x) + x
round(f2, digits = 3)

f02 <- round(f02 <- sin(x) + x, digits = 3)
f02

# Calcule o factorial de 10. Com o resultado em mãos, calcule o logaritmo de base 10 desse resultado. 
# (Observação: use a função round() para arredondar a resposta de modo que ela tenha apenas duas casas decimais)
fat <- factorial(10)
log10_fat <- log10(fat)
round(log10_fat, digits = 2)

flog <- round(log10(factorial(10)), digits = 2)
flog

# Suponha que a velocidade da luz seja  c = 300000000 m/s. A equação da equivalência massa-energia de Einstein 
# é dada como E=m*c^2, sendo ‘m’ a massa e ‘c’ a velocidade da luz. 
# Calcule o logarítmo natural do valor da energia originada de um objeto de 10Kg. 
# (Observação: use a função round() para arredondar a resposta de modo que ela tenha apenas duas casas decimais)
c = 300000000
m = 10
E = m * c ^ 2
energia = round(log(E), digits = 2)
energia

c = 300000000
m = 10
E = m * c ^ 2
E
l = log(E)
l
arr = round(l, digits = 2)
arr

# Crie um vetor de dados com o seguinte comando da linguagem R:  v<-c(2,5,7,8,9). 
# Agora tome o seguinte polinômio f(x) = x^3 + x^2 + x. 
# Calcule a média dos valores gerados pela função f(x) 
# quando você substituir a variável ‘x’ do polinômio pelo vetor ‘v’.
v <- c(2, 5, 7, 8, 9)
fv = v^3 + v^2 + v
fv
media = mean(fv)
media
