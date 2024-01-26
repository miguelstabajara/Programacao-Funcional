--Exercício 1:
{-Usando esta função, escreva um programa em Haskell que solicita ao usuário digitar
uma frase, lê a frase (uma linha) da entrada padrão e testa se a string lida é um
palíndrome, exibindo uma mensagem apropriada.-}

module Main where
main::IO()
main = do
  putStrLn "Digite uma frase"
  frase<-getLine
  if frase==reverse frase then putStr "É um palindromo" else putStr "Não é um palindromo"

  --Exercício 2:
  {-Escreva um programa que solicita ao usuário três números em ponto flutuante, lê os
números, e calcula e exibe o produto dos números.-}

  module Main where
main::IO()
main = do
  putStrLn "Digite três números em ponto flutuante"
  n1<-readLn::IO Float
  n2<-readLn::IO Float
  n3<-readLn::IO Float
  putStr(show(n1*n2*n3))

  --Exercício 3:
  {-Escreva um programa em Haskell que solicita ao usuário uma temperatura na escala
Fahrenheit, lê esta temperatura, converte-a para a escala Celsius e exibe o resultado.
Para fazer a conversão, defina uma função celsius :: Double -> Double que
recebe a temperatura na escala Fahrenheit e resulta na temperatura correspondente
na escala Celsius.-}

  module Main where
celsius::Double->Double
celsius f = (5/9)*(f-32)
main::IO()
main = do
  putStr "Digite a temperatura em farenheit"
  aux<-readLn::IO Double
  let c = celsius aux
  putStr "Temperatura em farenheit: "
  putStrLn (show aux)
  putStr "Temperatura em celsius: "
  putStrLn(show c)

  --Exercício 4
{-Faça uma função que receba três notas de um aluno, e calcule e mostre a média
aritmética das notas e a situação do aluno.-}

  module Main where
main::IO()
main = do
  putStrLn "Escreva suas tres notas"
  n1<-readLn::IO Double
  n2<-readLn::IO Double
  n3<-readLn::IO Double
  let media = (n1+n2+n3)/3

  if media<3 then putStr "Reprovado" else if(media>=3&&media<7) then putStr "Exame especial" else putStr "Aprovado"

  --Exercício 5
  {-Crie um programa que leia a idade de uma pessoa e informe a sua classe eleitoral: não
eleitor abaixo de 16 anos; eleitor obrigatório entre 18 (inclusive) e 65 anos; eleitor
facultativo de 16 até 18 anos e acima de 65 anos (inclusive). -}

  module Main where
eleitor::Int->String
eleitor n|n<16 = "Não eleitor"
        |n>=18&&n<65 = "Eleitor obrigatorio"
        |(n>=16&&n<=18)||n>=65="Eleitor facultativo"

main::IO()
main = do
  putStrLn "Insira sua idade"
  n1<-readLn::IO Int
  let str = eleitor n1
  putStr str

  --Exercício 6
  {-Faça um programa que apresente um menu, o qual permita ao usuário escolher a opção
desejada, dentre:
1. Salvar uma frase em um arquivo texto
2. Imprimir o conteúdo do arquivo texto
3. Sair
A seguir, o usuário deve digitar uma opção desejada, a qual executará a ação solicitada.
Teste a opção inválida. O menu deve ser repetido infinitamente.-}

module Main where

main::IO()
main = do
  putStrLn "Escolha uma opção abaixo:"
  putStrLn "   1-Salvar uma frase em um arquivo"
  putStrLn "   2-Imprimir conteudo de um arquivo"
  putStrLn "   3-Sair"
  opcao<-readLn::IO Int
  putStrLn ""
  conteudo<-readFile "arq.txt"
  
  case opcao of
    1 -> do
          frase<-getLine
          writeFile "arq.txt" frase
          main
    2 -> do
          conteudo<-readFile "arq.txt"
          putStrLn conteudo
          main
    3 -> putStr "Saindo"
    _ -> putStrLn "Opção invalida"

