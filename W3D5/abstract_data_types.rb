# Exercise 1 -----------------------------------------------------------------------------------------
class Stack
  def initialize
    # create ivar to store stack here!
    @stack = Array.new
  end

  def push(el)
    # adds an element to the stack
    @stack.push(el)
  end

  def pop
    # removes one element from the stack
    @stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @stack[-1]
  end
end

# demo_stack = Stack.new
# p demo_stack
#  demo_stack.push("First task")
#  demo_stack.push("Second task")
#  demo_stack.push("Third task")
# p demo_stack.inspect
# p demo_stack.peek
# p demo_stack.pop
# p demo_stack.peek

# Exercise 2 -----------------------------------------------------------------------------------------

class Queue
    def initialize
      @queue = Array.new
    end
  
    def enqueue(el)
      @queue.push(el)
    end
  
    def dequeue
      @queue.shift
    end
  
    def peek
      @queue[0]
    end
  end

# demo_queue = Queue.new
# p demo_queue.enqueue("First task")
# p demo_queue.enqueue("Second task")
# p demo_queue.enqueue("Third task")

# p demo_queue.peek
# p demo_queue.dequeue
# p demo_queue.peek


# Exercise 3 -----------------------------------------------------------------------------------------

class Map
    def initialize
        @map = Array.new { Array.new()}
    end

    def set(k, v)
        @map.each_with_index do |ele, index|
            if ele[0] == k
                @map[index][1] = v
                return
            end
        end
        @map << [k, v]
    end

    def get(key)
        @map.each do |ele|
            if ele[0] == key
                return ele[1]
            end
        end
        return nil
    end

    def delete(key)
        @map.each_with_index do |ele, index|
            if ele[0] == key
                @map.delete_at(index)
                return
            end
        end
        return nil
    end

    def show
        p @map
    end
end

# demo_map = Map.new
# p demo_map.set("a", 1)
# p demo_map.set("b", 2)
# p demo_map.show

# p demo_map.set("a", 3)
# p demo_map.show

# p demo_map.get("a")

# p demo_map.delete("a")
# p demo_map.show
require "byebug"
class Node

    attr_reader :value
    def initialize(value, children=[])
        @value = value
        @children = children
    end


    def dfs(target=nil, &prc)
        prc ||= Proc.new {|node| node.value == target}
        return self if prc.call(self)

        @children.each do |child|
            result = child.dfs(&prc)
            return result unless result.nil?
        end
        nil
    end

end


b = Node.new("b")
c = Node.new("c")
a = Node.new("a", [b, c])
debugger
p a.dfs("b")