import Data.Char

{-1.Defina uma função que retorne uma tupla-3 (tripla) contendo o caractere fornecido
como entrada, o mesmo caractere em letras minúsculas ou maiúsculas, e o seu número
da tabela ASCII.-}

converte::Char->(Char,Char,Int)
converte b = (toLower b,toUpper b,ord b)

{-Crie uma função que receba os coeficientes de uma equação do segundo grau 𝑎𝑥 ²+𝑏𝑥+𝑐 na forma (𝑎, 𝑏, 𝑐) e 
retorne as raízes desta equação. Trate o caso de raízes imaginárias, indicando um erro. -}

raiz::(Float,Float,Float)->(Float,Float)
raiz (a,b,c)|delta>0 = ((-b+sqrt(delta))/2*a,(-b-sqrt(delta))/2*a)
            |delta<0 = (0,0)
            |delta==0 = (-b/2*a,-b/2*a)
    where delta = b*b-4*a*c 

{-3. Seja uma quantidade de registros de pessoas, em que três argumentos definem cada
registro. Os argumentos são nome, idade e sexo de uma dada pessoa.
a) Crie um novo tipo para definir uma Pessoa.
b) Cadastre algumas pessoas quaisquer, usando uma função pessoa, que receba um
número de índice (1, 2, 3, 4...) e retorne a pessoa correspondente ao índice, usando
casamento de padrões.
c) Reescreva a mesma função do item b), usando guardas.
d) Crie uma função que receba uma pessoa e retorne sua idade.
e) Crie uma função recursiva que some as idades de todas as pessoas cadastradas.
Dica: use a função do item d).
f) Crie uma função que retorne a média da idade de todas as pessoas dentre a pessoa
do registro 1 até o registro n, que é o número passado como argumento nesta
função. Dica: use a função do item e). -}
type Nome = String
type Idade = Int
type Sexo = String

type Pessoa = (Nome,Idade,Sexo)

pessoa::Float->Pessoa
pessoa 1 = ("Carla",19,"Mulher")
pessoa 2 = ("Vanessa",25,"Mulher")
pessoa 3 = ("Matheus",19,"Homem")
pessoa 4 = ("Miguel",22,"Homem")
pessoa 5 = ("Julia",24,"Mulher")
pessoa 6 = ("Não registrada",0,"")

retornoCasamento::Float->Pessoa
retornoCasamento 1 = pessoa 1 
retornoCasamento 2 = pessoa 2
retornoCasamento 3 = pessoa 3
retornoCasamento 4 = pessoa 4
retornoCasamento 5 = pessoa 5
retornoCasamento _ = pessoa 6

retorno::Float->Pessoa
retorno x|x==1 = pessoa 1
                    |x==2 = pessoa 2 
                    |x==3 = pessoa 3 
                    |x==4 = pessoa 4
                    |x==5 = pessoa 5 

selecIdade::Pessoa->Int
selecIdade(a,b,c) = b

somaIdade::Float->Float
somaIdade n|n==1 = selecIdade(pessoa 1)
            |n>1 = somaIdade(n-1)+selecIdade(pessoa n)

mediaIdade::Float->Float
mediaIdade n = (somaIdade n)/n


