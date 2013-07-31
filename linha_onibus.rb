#!/bin/env ruby
# encoding: utf-8

#
# Estrutura de dados e codigo para extrair os dados
#   Uma das coisas mais feias do mundo, mas foi necessário por causa
#   do layout da pagina
#

require './encode_string'

class Object
    def hashify
        hash = {}
        instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
        hash
    end
end

class HorarioOnibus
    attr_accessor :nome, :divisoes, :n_divisoes
    attr_accessor :minimo, :maximo, :medio
end

class LinhaOnibus
    attr_accessor :horarios, :consorcio, :nome, :codigo, :valido

    NAME_REGEXP = "[-0-9a-zA-Z \/().]+?"
    DAYS_REGEXP = "(Dias .teis)|(S.bados)|(Domingos)"

    def initialize filename

        content = encode_string(IO.read(filename))

        if /Nenhum registro encontrado!/.match(content)
            @valido = false
            return
        end

        m = /<B>(#{NAME_REGEXP})-(#{NAME_REGEXP})<\/B>/.match(content)

        @codigo = m[1].strip
        @nome = m[2].strip
        @consorcio = /<B>Cons.rcio:([a-zA-Z]+)<br>/.match(content)[1]

        @horarios = get_times(content)
        @valido = true
    end

    def get_times content

        names = content.scan /<B>(#{NAME_REGEXP})<\/B><\/font><\/div><table |#{DAYS_REGEXP}/
        times = []
        nums = []

        time_tables = content.scan(/<table .*?>(.*?)<\/table>/)
        i_times = content.scan(/(m.nimo|m.ximo|m.dio): ([0-9]+)/).map{|i| i[1].to_i}

        time_tables.shift # the first table is useless (the name of the line)
        time_tables.each do |e|
            nums << e.join.scan(/[0-9][0-9]:[0-9][0-9]/)
        end
        nums.select! {|n| n.size > 0 } # remove empty

        i = 0
        cur_name = nil
        names.each do |n|
            if n[0]
                cur_name = n.compact!.first.strip
            else
                times[i] = HorarioOnibus.new
                times[i].nome = "#{cur_name} - #{n.compact!.first}"
                times[i].divisoes = nums[i]
                times[i].n_divisoes = nums[i].size
                times[i].minimo = i_times.shift
                times[i].medio = i_times.shift
                times[i].maximo = i_times.shift
                i += 1
            end
        end

        return times
    end

    def to_json
        hash = self.hashify
        hash["horarios"] = hash["horarios"].map(&:hashify)
        hash.delete('valido')
        hash.to_json
    end

    # def to_yaml
    #     hash = self.hashify
    #     hash["horarios"] = hash["horarios"].map(&:hashify)
    #     hash.delete('valido')
    #     hash.to_yaml
    # end

end
