require "set"

class GraphNode
    attr_accessor :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end

    def self.bfs(starting_node, target_value)
        visited = Set.new
        queue = [starting_node]
        until queue.empty?
            #p queue
            visited.add(queue[0].value)
            #p visited
            if queue[0].value == target_value
                return queue[0]
            end
            queue += queue[0].neighbors.select { |neighbor| !visited.include?(neighbor.value) }
            queue.shift
        end
        return nil
    end
    
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p GraphNode.bfs(a, "f")

