require 'minitest/autorun'
require 'words'

class TestWords < MiniTest::Test

  def setup
    # The complete solution should include unit tests that at a minimum should
    # include the two provided examples: 6686787825, 2282668687.
    @numbers = [6686787825, 2282668687, 2282668799]
    @dict = Dictionary.new

    # be aware this is heavy
    @dict.load_file File.join __dir__, '..', 'dictionary.txt'
  end

  def test_build
    @numbers.each do |number|
      words_from_number(number).each do |words|
        # make any element of result set to be an array(there can be strings)
        words = [words].flatten

        words.each do |word|
          assert word.size >= 3
        end

        assert_equal number.to_s, result_number(words)
      end
    end
  end

  def words_from_number(number)
    new_words = Words.new(number, @dict)
    new_words.build
  end

  def result_number(words)
    words.join.each_char.inject('') { |acc, char| acc + char_to_digit(char) }
  end

  def char_to_digit(char)
    Dictionary::NUMBERS_MAPPING.detect { |_, v| v.include? char }.first.to_s
  end
end
