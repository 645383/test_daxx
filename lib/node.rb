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
