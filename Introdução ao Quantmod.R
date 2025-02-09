#Autoras: Alexsandra Carvalho (https://www.linkedin.com/in/alexsandrabispocarvalho/); e
#Jennifer Do �(https://www.linkedin.com/in/jennifer-do-e/)

# Instalando o pacote
install.packages("quantmod")
# Ativando
library(quantmod)

# Criando um vetor aleat�rio de pre�os de abertura e fechamento.
abertura <- c(10.3,10.01,9.99,10.01,10.5)   # Criando uma matriz 1x5 de pre�oos de abertura.
fechamento <- c(9.9,9.8,10.2,10.5,10.8)     # Criando uma matriz 1x5 de pre�os de fechamento.

# Para visualiza��o.
abertura
fechamento

Delt(abertura)                   # Calculando a varia��o percentual dos pre�os de abertura.
Delt(fechamento)                 # Calculando a varia��o percentual dos pre�os de fechamento.

Delt(abertura,type='arithmetic') # Usando a varia��o padr�o.
Delt(abertura,type='log')        # Usando a Varia��o logar�tmica


Delt(abertura,fechamento)        # Calculando a varia��o percentual entre a abertura e o fechamento do mercado. 

# Como o type n�o foi informado, o defaut (aritm�tico) � usado.
# Como k n�o foi informado, assume-se o default k=0.

# Obtendo dados das a��es usando getSymbols
getSymbols(Symbols= 'BBDC3.SA',       # Baixando dados da a��o do Banco do Bradesco
           from='2020-01-01',         # Inicio da s�rie em 01/01/2020
           to='2021-01-01',           # Fim da s�rie em 01/01/2021. � poss�vel substituir pela fun��o "sys.date" que retorna o dia atual.
           src = 'yahoo', verbose=F)  # Fonte: Yahoo Finance

# Removendo NA's
na.omit(BBDC3.SA)

# Visualizando os seis primeiros valores
head(BBDC3.SA)

# Visualizando os seis ultimos valores valores
tail(BBDC3.SA)

#Plotando o gr�fico da s�rie
plot(BBDC3.SA)

#Retorns Mensais
periodReturn(BBDC3.SA, period='monthly', subset=NULL, type='arithmetic', leading=TRUE) 
#'montly' pode ser substituido por "daily", "weekly", "quarterly" e "yearly"
# type pode ser escolhido entre "arithmetic" e "log"

#Outra forma de calcular:

#Retornos diários
dailyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retornos semanais 
weeklyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retornos mensais
monthlyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retornos trimestrais
quarterlyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retornos anual
annualReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)
yearlyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retorno em 2020
periodReturn(BBDC3.SA,period='yearly',subset='2020') 

# Salvando o Retorno Anual em um objeto
retorno_diario <- dailyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

# Calculando o retorno entre datas espec�ficas
# Criando uma janela com os dados entre datas e salvando em um objeto � parte
r <- window(retorno_diario, start = '2020-01-01',  end= '2020-05-31',)

# Omitindo dados faltantes
na.omit(r)

#Baixando dados de distribui��o de dividendos e salvando num objeto
dividendos <- getDividends("BBDC3.SA", from = "2020-01-01", to = Sys.Date(), 
                           env = parent.frame(), src = "yahoo", auto.assign = FALSE,
                           auto.update = FALSE, verbose = FALSE, split.adjust = TRUE,
                           curl.options = list())

# Baixando e salvando dados de desdobramento em um objeto

desdobramentos <- getSplits("BBDC3.SA", from = "2000-01-01", to = Sys.Date(), env = parent.frame(), 
                            src = "yahoo", auto.assign = FALSE, auto.update = FALSE, verbose = FALSE, curl.options = list())

# Ap�s baixar a s�rie, usamos o comando head() para vizualisar os primeiros valores
head(BBDC3.SA) 

#Criando um objeto com os pre�os ajustados
BBDC3.SA.a <- adjustOHLC(BBDC3.SA)
head(BBDC3.SA.a)













