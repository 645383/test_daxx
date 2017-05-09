require 'dictionary'

class Words
  attr_accessor :number, :dictionary, :words

  DIGIT_SIZE = 10
  MIN_WORD_SIZE = 3

  def initialize(number, dictionary)
    @number = number
    @dictionary = dictionary
    @words = []
  end

  def build
    digits = number.to_s.chars.map(&:to_i)
    search(dictionary.root_node, digits)
    words.uniq
  end

  private

  def search(node, digits, subset = {}, word = '', key = '')
    digit = digits.first
    child_nodes = node.children.select { |c| c.value.key(digit) }
    subset = subset.clone

    child_nodes.each do |child_node|
      value = child_node.value.key(digit)
      new_word = word + value
      new_key = key + digit.to_s

      if digits.count > 1
        sub_digits = digits[1..(digits.count - 1)]

        if child_node.fin? && new_word.size >= MIN_WORD_SIZE && digits.size > MIN_WORD_SIZE
          add_to_subset subset, new_word, new_key
          # start search new word from the root
          search(dictionary.root_node, sub_digits, subset)

          # continue search same word combinations
          search(child_node, sub_digits, subset, new_word, new_key)
        elsif subset.count != 0
          search(child_node, sub_digits, subset, new_word, new_key)
        end

        search child_node, sub_digits, {}, new_word, new_key
      else
        if subset.count != 0 && child_node.fin?
          add_to_subset subset, new_word, new_key
          add_to_words(subset)
        else
          @words << new_word if new_word.size == DIGIT_SIZE
        end
      end
    end

    nil
  end

  def add_to_subset(subset, word, key)
    if !subset[key].nil?
      subset[key] = subset[key] + [word]
    else
      subset[key] = [word]
    end
  end

  def squash_subset(subset)
    if subset.count > 1
      if subset.keys.last[subset.keys[subset.count - 2]]
        subset.delete(subset.keys[subset.count - 2])
        squash_subset(subset)
      end
    end
  end

  def add_to_words(subset)
    squash_subset(subset)
    return unless subset.keys.join == @number.to_s

    result = get_combinations(subset)
    if result.count > 1
      @words += result
    elsif result.first.count == 1
      @words << result.flatten.first
    else
      @words << result.first
    end
  end

  def get_combinations(subset)
    result = []
    while subset.values.any? { |arr| arr.count > 1 }
      result << subset.values.map do |v|
        if v.count > 1
          v.pop
        else
          v.first
        end
      end
    end

    # add last combination
    result << subset.values.flatten
    result
  end
end
