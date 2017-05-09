$LOAD_PATH << './lib'
require 'words'
dictionary = Dictionary.new
dictionary.load_file 'dictionary.txt'
