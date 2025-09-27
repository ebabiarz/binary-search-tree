require './lib/tree'
require './lib/node'

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts ""
puts ""
test.pretty_print
puts ""
puts ""

p test.preorder {|value| value + 2}

# p test.level_order {|value| value + 2}

# p test.level_order

# p test.find(23)
# puts ""
# puts ""
# p test.find(57)

# test.delete(3)

# puts ""
# puts ""
# test.pretty_print
# puts ""
# puts ""

# test.insert(3)

# puts ""
# puts ""
# test.pretty_print
# puts ""
# puts ""

# test.delete(1)

# puts ""
# puts ""
# test.pretty_print
# puts ""
# puts ""

# test.insert(1)

# puts ""
# puts ""
# test.pretty_print
# puts ""
# puts ""

# test.delete(67)

# puts ""
# puts ""
# test.pretty_print
# puts ""
# puts ""