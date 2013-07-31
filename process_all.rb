
#
# Usa os arquivos que ja foram baixados e gera os dados em JSON ou XML
#

require './linha_onibus'
require 'json'

bad_files = ["data/263-63.html", "data/346-91.html", "data/180-5.html"]

files = Dir.glob("data/*.html") - bad_files

files.map! do |f|
    l = LinhaOnibus.new(f)
    l.valido ? l : nil
end

files.compact!

# To JSON
json = "[ #{files.map(&:to_json).join(",\n")} ]"
puts json

# TO XML
# json = "[ #{files.map(&:to_json).join(",\n")} ]"
# require 'active_support/core_ext'
# puts JSON.parse(json).to_xml