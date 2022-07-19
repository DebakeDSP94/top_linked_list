#frozen_string_literal :true

require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head == nil
      new_node.next_node = @tail
      @head = new_node
    else
      current = @head
      new_node.next_node = @tail
      until current.next_node == nil
        current = current.next_node
      end
      current.next_node = new_node 
    end
  end

  def prepend(value)
    current = @head
    new_node = Node.new(value, @head)
    @head = new_node
    new_node.next_node = current
  end

  def size
    count = 0
    current = @head
    until current.nil?
      count +=1
      current = current.next_node
    end
    count
  end

  def head
    current = @head
    puts "The first node in the list contains #{current.value}"
    current
  end

  def tail
    current = @head
    until current.next_node == nil
      current = current.next_node
    end
    puts "The last node in the list contains #{current.value}"
    current
  end

  def pop
    current = @head
    prev = nil
    until current.next_node == nil
      prev = current
      current = current.next_node
  end
  prev.next_node = nil
  puts "last element of list removed. It contained #{current.value}"
  current
end

def at(index)
  current = @head
  index.times do
    current = current.next_node
  end
  puts "node at index #{index} contains #{current.value}"
  current
end

  def contains?(value)
    exists = false
    current = @head
    until current.next_node == nil
      current = current.next_node
      if current.value == value
        exists = true
      end
    end
    puts "#{value} is in the list" if exists == true
    puts "#{value} was not found" if exists == false
    exists
  end

  def find(value)
    current = @head
    index = 0
    until current.next_node == nil || current.value == value
      index +=1
      current = current.next_node
      index = nil if current.next_node == nil
    end
    puts "found #{value} at node #{index}"
  end

  def to_s
    current = @head
    until current.nil?
      print "( #{current.value} ) -> "
      current = current.next_node
    end
    puts 'nil'
  end

  # extra credit

  def insert_at(value, index)
    puts "Node does not exist at that index" if index > size
    return if index > size
    new_node = Node.new(value)
    current = @head
    (index - 1).times do
      current = current.next_node
    end
    new_node.next_node = current.next_node
    current.next_node = new_node
    puts "inserted the node at index: #{index}"
  end

  def remove_at(index)
    puts "Nodes does not exist at that index" if index > size
    return if index > size
    current = @head
    prev = nil
    index.times do
      prev = current
      current = current.next_node
    end
    prev.next_node = current.next_node
    puts "removed the node at index: #{index} It contained #{current.value}"
    current
  end
end

list = LinkedList.new
list.append('first_node')
list.append('second one')
list.append('third one')
list.prepend('new_first')
list.to_s
list.contains?('first_node')
list.find('new_first')
list.at(2)
puts list.size
list.head
list.tail
list.pop
list.insert_at('inserted node', 2)
list.insert_at('inserted', 5)
list.to_s
list.append('last node')
list.to_s
list.remove_at(3)
list.to_s


