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