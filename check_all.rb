#
# Checa se todos arquivos foram baixados direito
#

require 'encode_string'

files = Dir.glob("data/*.html")

files.each do |f|
    present = /HTML/.match(encode_string(IO.read(f)))
    puts f unless present
end