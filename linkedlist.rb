class LinkedList
  attr_accessor :head, :tail, :newNode, :index, :value
  def initialize
  @index = 1
  @head = nil
  @tail = nil
  end
  def append(value)
    @newNode = Node.new(value, @index)
    if @head.nil?
      @head = @newNode
      @tail = @newNode
    else
      @tail.next_node = @newNode
      @tail = @newNode
    end
    @index += 1
  end
  def to_s
    vals = []
    current_node = @head
    while current_node != nil
      vals <<  current_node.value
      current_node = current_node.next_node
    end
   vals
  end
  def prepend1(value)
    @newNode = Node.new(value, @index)
    @newNode.next_node = @head
    @head = @newNode
    @index += 1
  end
  def size
    size = 0
    current_node = @head
    while current_node != nil
      size += 1
      current_node = current_node.next_node
    end
     size
  end
  def head
    return @head.value
  end
  def tail
    return @tail.value
  end
  def at(index)
    current_node = @head
    while current_node != nil
      if current_node.index == index
        return current_node.value
      end
      current_node = current_node.next_node
    end
  end
  def pop
    current_node = @head
    while current_node != nil
      if current_node.next_node.next_node == nil
        current_node.next_node = nil
        return
      end
      current_node = current_node.next_node
    end
  end
  def contains?(value)
    current_node = @head
    while current_node != nil
      found = false
      if current_node.value == value
        found = true
        return found
      else
        found = false
      end
      current_node = current_node.next_node
    end
    return found
  end
  def find(value)
    current_node = @head
    while current_node != nil
      if current_node.value == value
        return current_node.index
      end
      current_node = current_node.next_node
    end
    nil
  end
  def remove_at(index)
    current_node = @head
    while current_node != nil
     p current_node.index
      if current_node.index + 1 == index 
        current_node.next_node  = current_node.next_node.next_node
      end
      current_node = current_node.next_node
    end
  end
  def insert_at(value, index)
    current_node = @head
    @newNode = Node.new(value, @index)
    while current_node != nil
     p current_node.index
      if current_node.index + 1 == index 
        @newNode.next_node = current_node.next_node
        current_node.next_node  = @newNode
      end
      current_node = current_node.next_node
    end
  end
end
class Node 
  attr_accessor :index, :value, :next_node

  def initialize(value = nil, next_node = nil, index)
    @value = value
    @next_node = nil
    @index = index
  end
end
list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
puts list.to_s
 puts list.size
 puts list.head
 puts list.tail
 p list.at(4)
 p list.index
 p list.pop
 puts list.to_s
 puts list.contains?('hamster')
  puts list.find('dog')
 list.remove_at(3)
  list.insert_at("fish", 5)
puts list.to_s

