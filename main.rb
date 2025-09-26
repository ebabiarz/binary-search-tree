require './lib/tree'
require './lib/node'

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts ""
puts ""
test.pretty_print
puts ""
puts ""

test.insert(6)

puts ""
puts ""
test.pretty_print
puts ""
puts ""