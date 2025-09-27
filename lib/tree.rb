class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    sorted_array = merge_sort(array)
    sorted_array = sorted_array.uniq

    return tree_from_sorted_array(sorted_array)
  end

  def tree_from_sorted_array(array, first = 0, last = (array.length - 1))
    if first > last
      return nil
    end

    mid = (first + last)/2
    root = Node.new(array[mid])

    root.left = tree_from_sorted_array(array, first, mid - 1)
    root.right = tree_from_sorted_array(array, mid + 1, last)

    return root
  end

  def insert(data, current_node = @root)

    if current_node == nil
      return Node.new(data)
    elsif current_node.data == data
      return current_node
    elsif current_node.data > data
      current_node.left = insert(data, current_node.left)
    else
      current_node.right = insert(data, current_node.right)
    end

    return current_node
  end

  def delete(data, current_node = @root)
    if current_node == nil
      return current_node
    end

    if current_node.data > data
      current_node.left = delete(data, current_node.left)
    elsif current_node.data < data
      current_node.right = delete(data, current_node.right)
    else
      if current_node.left == nil
        return current_node.right
      elsif current_node.right == nil
        return current_node.left
      end

      succ = get_successor(current_node)
      current_node.data = succ.data
      current_node.right = delete(succ.data, current_node.right)
    end

    return current_node
  end

  def get_successor(current_node)
    current_node = current_node.right

    while current_node != nil && current_node.left != nil
      current_node = current_node.left
    end

    return current_node
  end

  def find(data, current_node = @root)
    if current_node == nil
      return nil
    elsif current_node.data == data
      return current_node
    elsif current_node.data > data
      return find(data, current_node.left)
    else
      return find(data, current_node.right)
    end
  end

  def level_order(current_node = @root, array = [], queue = [])
    
    if current_node != nil
      array << current_node.data
    end

    if current_node.left != nil
      queue.push(current_node.left)
    end

    if current_node.right != nil
      queue.push(current_node.right)
    end

    if queue.empty? == false
      level_order(queue.shift, array, queue)
    end
    
    if block_given?
      adjusted_array = []
      array.each do |element|
        adjusted_array << yield(element)
      end
      return adjusted_array
    else
      return array
    end
  end

  def preorder(current_node = @root, array = [])
    if current_node == nil
      return
    else
      array << current_node.data
    end

    preorder(current_node.left, array)
    preorder(current_node.right, array)

    if block_given?
      adjusted_array = []
      array.each do |element|
        adjusted_array << yield(element)
      end
      return adjusted_array
    else
      return array
    end
  end

  def inorder(current_node = @root, array = [])
    if current_node == nil
      return
    elsif current_node.left == nil
      array << current_node.data
      inorder(current_node.right, array)
    else
      inorder(current_node.left, array)
      array << current_node.data
      inorder(current_node.right, array)
    end

    if block_given?
      adjusted_array = []
      array.each do |element|
        adjusted_array << yield(element)
      end
      return adjusted_array
    else
      return array
    end
  end

  def merge_sort(array)
    if array.length <= 1
      return array
    else
      array_left = merge_sort(array.slice!(0, array.length/2))
      array_right = merge_sort(array)
    end

    array = []

    while array_left.length > 0 && array_right.length > 0
      if array_left[0] < array_right[0]
        array.push(array_left.slice!(0))
      else
        array.push(array_right.slice!(0))
      end
    end

    if array_left.empty?
      array += array_right
    elsif array_right.empty?
      array += array_left
    end

    return array
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end