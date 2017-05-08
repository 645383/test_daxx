$LOAD_PATH << '.'
require './dictionary.rb'
d = Dictionary.new
d.load_file '/home/sergii/projects/test_daxx/dictionary.txt'