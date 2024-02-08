module MiguelSotoTabajara (main) where
--import System.Random
import System.IO (stdout, hFlush)

jogo::Int->Int->Int->IO()
jogo x y z|x>y=imprimeMaior x y z
            |x<y=imprimeMenor x y z
            |otherwise = ganhou x z

ganhou::Int->Int->IO()
ganhou x z = do
    putStr "Seu palpite de "
    putStr (show x)
    putStrLn " está correto!"
    putStr "Parabéns! Você acertou em "
    putStr (show z)
    putStrLn " tentativas."
    f<-readFile "highscore.txt"
    if read f>z then putStrLn "Você bateu seu recorde" else putStr " "
    if read f>z then writeFile "highscore.txt" (show z) else putStr " "
    putStrLn "\nDeseja jogar novamente?(s para sim, qualquer coisa para sair): "
    p <- getLine
    if p=="s" then recomeçar else putStr "\nObrigado por jogar o jogo da adivinhação!"

recomeçar::IO()
recomeçar = do
    putStr "\n"
    putStrLn "Estou pensando em um número de 1 a 100. Tente adivinhar\n"
    let z = 1
    y<-randomRIO(1,100)::IO Int
    putStr "Tentativa "
    putStrLn (show z)
    putStr "Digite seu palpite: "
    putStrLn " "
    x <- readLn::IO Int
    jogo x y z

imprimeMenor::Int->Int->Int->IO()
imprimeMenor x y z = do
    putStr "Seu palpite de "
    putStr (show x)
    putStrLn " está abaixo do número correto\n"
    let p = z+1
    putStr "Tentativa "
    putStrLn (show p)
    putStr "Digite seu palpite: "
    putStrLn " "
    k <- readLn::IO Int
    jogo k y p

imprimeMaior::Int->Int->Int->IO()
imprimeMaior x y z = do
    putStr "Seu palpite de "
    putStr (show x)
    putStrLn " está acima do número correto\n"
    let p = z+1
    putStr "Tentativa "
    putStrLn (show p)
    putStr "Digite seu palpite: "
    putStrLn " "
    k <- readLn::IO Int
    jogo k y p

main::IO()
main = do 
        putStrLn "Bem vindo ao Jogo de Adivinhação!"
        putStrLn "Escolha a opção que deseja acessar."
        putStrLn "1-Iniciar jogo"
        putStrLn "2-Versão do jogo"
        putStrLn "3-Ver seu record"
        putStrLn "4-Sair do jogo"
        opcao<-readLn
        case opcao of
            1 -> do
                putStrLn "\nEstou pensando em um número de 1 a 100. Tente adivinhar\n"
                let z = 1
                y<-randomRIO(1,100)::IO Int
                putStr"Tentativa "
                putStrLn (show z)
                putStr "Digite seu palpite: "
                putStrLn " "
                x <- readLn::IO Int
                jogo x y z

            2 ->do 
                putStrLn "\nVersão 1.0"
                putStrLn "Desenvolvedor: Miguel Tabajara\n"
            
            3 ->do
                f<-readFile "highscore.txt"
                putStr "\nSeu record é: "
                putStrLn f
                putStrLn " "
            
            4-> putStr "\nObrigado por jogar o Jogo da Adivinhação!"

            _ -> putStrLn "\nOpção inválida.\n"

        if opcao /= 4 then main else putStr " "




    


