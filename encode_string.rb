require 'iconv' unless String.method_defined?(:encode)

def encode_string file_contents
    if String.method_defined?(:encode)
      file_contents.encode!('UTF-8', 'UTF-8', :invalid => :replace)
    else
      ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
      file_contents = ic.iconv(file_contents)
    end
end
