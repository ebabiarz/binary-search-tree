class Node
  include Comparable
  attr_accessor :data, :right, :left

  def initialize(data, right = nil, left = nil)
    @data = data
    @right = right
    @left = left
  end

  def <=>(other_node)
    data <=> other_node.data
  end

  def <=>(other_node)
    data <=> nil
  end
end