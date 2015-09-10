require 'pry'



class BinarySearchTree
  attr_reader :size
  
  class Node
    attr_accessor :value, :left, :right
    def initialize(value, left=nil, right=nil)
      @value = value
      @left = left
      @right = right
    end
  end

  def initialize(values=[])
    @root = nil
    @size = 0
    if values.length > 0
      ## TODO: Add the values from the array to the tree
    end
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
      @size += 1
    else
      insert_internal(value, @root)
    end

    self
  end

  def to_s()
    print_internal(@root, 0)
  end

  def find(value)
    node = find_internal(value, @root)
    node.nil? ? nil : node.value
  end

  def delete(value)
    delete_internal(value, @root)
  end

  private
    def insert_internal(value, node)
      if value <= node.value 
        if node.left.nil?
          node.left = Node.new(value)
          @size += 1
        else
          insert_internal(value, node.left)
        end
      else
        if node.right.nil?
          node.right = Node.new(value)
          @size += 1
        else
          insert_internal(value, node.right)
        end
      end
    end

    def print_internal(node, tab_count)
      unless node.nil?
        tab_count.times {|n| print "     "}
        puts node.value
        tab_count.times {|n| print "     "}
        if node.left.nil?
          puts " left: nil"
        else
          puts " left:"
          print_internal(node.left, tab_count + 1)
        end

        tab_count.times {|n| print "     "}

        if node.right.nil?
          puts " right: nil"
        else
          puts " right:"
          print_internal(node.right, tab_count + 1)
        end
      end
    end

    def find_internal(value, node)
      # p node.right.value
       p self.size

      # if node.value === value
      #   return node
      # end
      
      a = node.right
      b = node.left
      i = 0
      
      for i in 0..self.size
      
      if !a.value
       a = node 
      elsif a.value === value
        return a
      else
        node = node.right
      end
      
      if !b.value
      b = node
      elsif b.value === value
        return b
      
      else
        node = node.left
  
      end
      i += 1
      end
    end
  

    # def delete_internal(value, node)
    # end

end
#### Example usage
 tree = BinarySearchTree.new
 tree.insert("galvanize").insert("apple").insert("pie").insert("pizza").insert("pi")
# puts tree.to_s
# p tree.size  #should equal 5
 p tree.find("pi") #should return "apple"
# tree.find("apples")  # should return nil
