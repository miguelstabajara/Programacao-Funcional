{-1. O fatorial duplo de um número natural n é o produto de todos os números de 1 (ou 2)
até n, contados de 2 em 2. Por exemplo, o fatorial duplo de 8 é 8 × 6 × 4 × 2 = 384, e
o fatorial duplo de 7 é 7 × 5 × 3 × 1 = 105. Defina uma função para calcular o fatorial
duplo usando recursividade.-}

module Main where
main::IO()
fatorialD::Int->Int
fatorialD n|n==1 = 1
          |n==2 = 2
          |n>0 = fatorialD(n-2)*n
main = do
  let c = fatorialD 8
  putStrLn (show c)

{-2. Defina duas funções recursivas que calculam o quociente e o resto da divisão inteira
de dois números naturais usando subtrações sucessivas.-}

module Main where
main::IO()
quociente::Int->Int->Int
quociente n d|n<d = 0
            |n>=d = 1+quociente(n-d)(d)
resto::Int->Int->Int
resto n d|n<d = n
          |n>=d = resto(n-d)(d)
main = do
  let q = quociente(24)(5)
  let r = resto(24)(5)
  putStrLn (show q)
  putStrLn (show r)

{-3. Defina uma função recursiva para calcular a potência de um número, considerando que
o expoente é um número natural. Utilize o método das multiplicações sucessivas.-}

module Main where
main::IO()
pow::Float->Float->Float
pow b e|e==0 = 1
        |e>0 = b*pow(b)(e-1)
main = do
  let q = pow(2)(4)
  putStrLn (show q)

{-4. Considere o operador nand, que devolve True se ao menos um dos argumentos é False.
(a) Defina a função nand utilizando if then else;
(b) Defina a função nand utilizando guardas;
(c) Defina a função nand utilizando correspondência de padrões;-}

main::IO()
nandIf::Bool->Bool->Bool
nandIf n1 n2 = if n1==True&&n2==True then False else True

nandG::Bool->Bool->Bool
nandG n1 n2|n1==True&&n2==True = False
            |otherwise = True

nandCas::Bool->Bool->Bool
nandCas True True = False
nandCas _ _ = True
main = do
  let q = nandIf(True)(False)
  let r = nandG(True)(True)
  let p = nandCas(False)(True)
  putStrLn (show q)
  putStrLn (show r)
  putStrLn (show p)