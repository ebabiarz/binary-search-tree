require './lib/tree'
require './lib/node'

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts ""
puts ""
test.pretty_print
puts ""
puts ""

p test.balanced?

test.insert(10000)
test.insert(6000)
test.insert(5000)
test.insert(2)

puts ""
puts ""
test.pretty_print
puts ""
puts ""

p test.balanced?