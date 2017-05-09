require 'minitest/autorun'
require 'dictionary'

class TestDictionary < MiniTest::Test
  def setup
    @dict = Dictionary.new
  end

  def test_insert_word
    @dict.insert_word('helloword')
    assert_equal 1, @dict.root_node.children.count
    assert_equal({'h' => 4}, @dict.root_node.children.first.value)

    @dict.insert_word('pelloword')
    assert_equal 2, @dict.root_node.children.count
    assert_equal({'p' => 7}, @dict.root_node.children.last.value)
  end
end