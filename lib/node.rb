# frozen_string_listeral: true

# class is for node in linked list
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @next_node = next_node
    @value = value
  end
end