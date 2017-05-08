class Dictionary
  attr_accessor :root_node

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
    word.each_char do |ch|
      node = insert(node, ch)
    end
  end

  def insert(node, value)
    if node.children.empty?
      new_node = Node.new(value)
      node.children << new_node
      new_node
    elsif nested_node = node.get_node_by_value(value)
      nested_node
    else
      new_node = Node.new(value)
      node.children << new_node
      new_node
    end
  end

  def search()

  end
end

class Node
  attr_accessor :value, :children

  def initialize(value, children=[])
    @value = value
    @children = children
  end

  def get_node_by_value(value)
    children.detect { |node| node.value == value }
  end
end

