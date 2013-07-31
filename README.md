EPTC Linhas
==============

Alguns scrappers e dados das linhas da EPTC em Porto Alegre

## Para pegar os dados

* Veja a sessão de [downloads]()

## Para mexer no código e gerar os dados

**Aviso**: Este código é feio e tosco, mas ele só reflete a estrutura do HTML do site da EPTC. No final de contas perdi uns bons minutos tentando driblar os acentos e outras coisas usando expressões regulares e depois perdi mais uns bons minutos editando alguns arquivos na mão. Se precisar de ajuda, dê um toque.

Só para programadores corajosos

#### Passos

    $ ruby download_all.rb # baixa todas paginas
    $ ruby check_all.rb # ve se todas paginas baixaram bem (senao apague a pagina ruim e rerode o primeiro)
    $ ruby process_all.rb # extrai os dados (modifique o codigo para pegar JSON ou XML)