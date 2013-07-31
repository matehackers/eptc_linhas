EPTC Linhas
==============

Alguns scrappers e dados das linhas da EPTC em Porto Alegre

Por enquanto pegando código das tabelas horárias das linhas EPTC.

## Para pegar os dados

* Veja a sessão de [downloads](http://matehackers.org/doku.php?id=eptc_linhas&#tabelas_horarias)

## Para mexer no código e gerar os dados

**Aviso**: Este código é feio e tosco, mas ele só reflete a estrutura do HTML do site da EPTC. No final de contas perdi uns bons minutos tentando driblar os acentos e outras coisas usando expressões regulares e depois perdi mais uns bons minutos editando alguns arquivos na mão. Se precisar de ajuda, dê um toque.

Só para programadores corajosos!

#### Passos

    # baixa todas paginas
    $ ruby download_all.rb

    # ve se todas paginas baixaram bem (senao apague a pagina ruim e rerode o primeiro)
    $ ruby check_all.rb

    # extrai os dados (modifique o codigo para pegar JSON ou XML)
    $ ruby process_all.rb

#### Normalizado dados

Para gerar arquivos mais legíveis eu recomendo usarem o [xmllint](http://xmlsoft.org/xmllint.html) ou [jsonlint](https://github.com/zaach/jsonlint) nos arquivos gerados.