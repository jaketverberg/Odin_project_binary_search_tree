class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end


class Tree
  attr_accessor :root, :data

  def initialize(array)
    @data = array.sort.uniq
    @root = build_tree(@data)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = (arr.size - 1) / 2
    node = Node.new(arr[mid])
    node.left = build_tree(arr[0...mid])
    node.right = build_tree(arr[(mid+1)..-1])

    node
  end

  def insert(value, current = @root)
    return Node.new(value) if current.nil?
    return current if current.data == value

    current.right = insert(value, current.right) if current.data < value
    current.left = insert(value, current.left)   if current.data > value

    current
  end

  def min_value_node(node = @root)
    node = node.left until current.left.nil?

    node
  end

  def delete(value, current=@root)
    return current if current.nil?

    current.left = delete(value, current.left)   if value < current.value
    current.right = delete(value, current.right) if value > current.value

    if current.left.nil?
      temp = current.right
      current = nil
      return temp
    end

    if current.right.nil?
      temp = current.left
      current = nil
      return temp
    end

    temp = min_value_node(current.right)
    current.value = temp.value
    current.right = delete(temp.value, current.right)

    return current
  end

  def find(value, current = @root)
    until current.nil? || current.value == value
      current = current.left if current.value > value
      current = current.right if current.value < value
    end

    current
  end

  def level_order(queue = [@root])
    until queue.empty?
      node = queue.shift
      yield(node) if block_given?
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
  end

  def inorder(node = @root)
    return if node.nil?

    inorder(node.left)
    print "#{node.data} "
    yield(node) if block_given?
    inorder(node.right)
  end

  def preorder(node = @root)
    return if node.nil?

    print "#{node.data} "
    yield(node) if block_given?
    preorder(node.left)
    preorder(node.right)
  end

  def postorder(node = @root)
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    print "#{node.data} "
    yield(node) if block_given?
  end

  def height(node = @root)
    return -1 if node.nil?
    left = height(node.left)
    right = height(node.right)
    return [left, right].max + 1
  end

  def depth(node = @root, parent = @root, edges = 0)
    return 0 if node == parent
    return -1 if parent.nil?

    if node < parent.data
      edges += 1
      depth(node, parent.left, edges)
    elsif node > parent.data
      edges += 1
      depth(node, parent.right, edges)
    else
      edges
    end
  end

  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)

    false
  end

  def rebalance
    @root.data = inorder_array
    @root = build_tree(@root.data)
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  # create inorder array of tree

  def inorder_array(node = @root, array = [])
    unless node.nil?
      inorder_array(node.left, array)
      array << node.data
      inorder_array(node.right, array)
    end
    array
  end
end

def pretty_print(node = root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end

private

# create inorder array of tree

def inorder_array(node = @root, array = [])
  unless node.nil?
    inorder_array(node.left, array)
    array << node.data
    inorder_array(node.right, array)
  end
  array
end

# Driver script

array = Array.new(15) { rand(1..100) }
bst = Tree.new(array)

bst.pretty_print

puts bst.balanced? ? 'Your Binary Search Tree is balanced.' : 'Your Binary Search Tree is not balanced.'

puts 'Level order traversal: '
puts bst.level_order

puts 'Preorder traversal: '
puts bst.preorder

puts 'Inorder traversal: '
puts bst.inorder

puts 'Postorder traversal: '
puts bst.postorder

10.times do
a = rand(100..150)
bst.insert(a)
puts "Inserted #{a} to tree."
end

bst.pretty_print

puts bst.balanced? ? 'Your Binary Search Tree is balanced.' : 'Your Binary Search Tree is not balanced.'

puts 'Rebalancig tree...'
bst.rebalance

bst.pretty_print

puts bst.balanced? ? 'Your Binary Search Tree is balanced.' : 'Your Binary Search Tree is not balanced.'

puts 'Level order traversal: '
puts bst.level_order

puts 'Preorder traversal: '
puts bst.preorder

puts 'Inorder traversal: '
puts bst.inorder

puts 'Postorder traversal: '
puts bst.postorder