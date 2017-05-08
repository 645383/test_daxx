class Dictionary
  attr_accessor :root_node, :words

  DIGIT_SIZE = 10
  MIN_WORD_SIZE = 3
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
    @words = []
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

  def build_words(number)
    digits = number.to_s.chars.map(&:to_i)
    search root_node, digits
  end

  def search(node, digits, subset = [], word = '')
    digit = digits.first
    child_nodes = node.children.select { |c| c.value.key(digit) }

    child_nodes.each do |n_node|
      value = n_node.value.key(digit)
      new_word = word + value

      if digits.count > 1
        sub_digits = digits[1..(digits.count - 1)]

        if n_node.fin? && new_word.size >= MIN_WORD_SIZE && digits.size > MIN_WORD_SIZE
          subset += [new_word]

          # start search new word from the root
          search(root_node, sub_digits, subset)

          # continue search same word combinations
          search(n_node, sub_digits, subset, new_word)
        elsif subset.count != 0
          search(n_node, sub_digits, subset, new_word)
        end

        search n_node, sub_digits, [], new_word
      else
        if subset.count != 0
          subset += [new_word] if n_node.fin?
          squash_subset(subset)

          if subset.count == 1
            @words << subset.first if subset.first.size == DIGIT_SIZE
          else
            @words << subset if subset.join.size == DIGIT_SIZE
          end
        else
          @words << word + value if new_word.size == DIGIT_SIZE
        end
      end
    end

    nil
  end

  def squash_subset(subset)
    if subset.count > 1
      if subset.last[subset[subset.count - 2]]
        subset.delete(subset[subset.count - 2])
        squash_subset(subset)
      end
    end
  end
end

class Node
  attr_accessor :value, :fin, :children

  def initialize(value, fin = false, children=[])
    @value = value
    @fin = fin
    @children = children
  end

  def get_node_by_value(value)
    children.detect { |node| node.value == value }
  end

  def fin?
    fin
  end
end
