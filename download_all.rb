#!/bin/env ruby
# encoding: utf-8

#
# Faz download de todas as páginas baseado no arquivo 'linhas.txt'
#

def download number
    return if File.exists? "data/#{number}.html"
    system "wget -O data/#{number}.html --post-data 'Tipo=TH&Linha=#{number}&Veiculo=1&Sentido=0&Logradouro=0' http://www.eptc.com.br/EPTC_Itinerarios/Cadastro.asp"
end

bus_table = IO.read('linhas.txt').split(/\n/)

bus_table.each do |b|
    puts "Downloading #{b.chomp.inspect}"
    download b.chomp
end
