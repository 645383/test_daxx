require 'node'

class Dictionary
  attr_accessor :root_node

  NUMBERS_MAPPING = {
      2 => %w(a b c),
      3 => %w(d e f),
      4 => %w(g h i),
      5 => %w(j k l),
      6 => %w(m n o),
      7 => %w(p q r s),
      8 => %w(t u v),
      9 => %w(w x y z),
  }

  def initialize(root = nil)
    @root_node = Node.new(root)
  end

  def load_file(file_name)
    idx = 0
    File.readlines(file_name).each_with_index do |word, i|
      idx = i
      insert_word(word.strip!)
    end
    puts "#{idx} lines read from #{file_name}"
  end

  def insert_word(word)
    node = root_node

    i = 0
    word.downcase.each_char do |char|
      number = select_number(char)
      value = {char => number}
      fin = i == word.size - 1
      node = insert(node, value, fin)
      i += 1
    end
  end

  def select_number(char)
    NUMBERS_MAPPING.select { |_, v| v.include?(char) }.keys.first
  end

  def insert(node, value, fin)
    if node.children.empty?
      new_node = Node.new(value, fin)
      node.children << new_node
      new_node
    elsif nested_node = node.get_node_by_value(value)
      nested_node
    else
      new_node = Node.new(value, fin)
      node.children << new_node
      new_node
    end
  end
end
