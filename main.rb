require './lib/tree'
require './lib/node'

test = Tree.new(Array.new(15) { rand(1..100)})

puts ""
puts test.pretty_print
puts ""

if test.balanced? == true
  puts "The tree is balanced"
else
  puts "The tree is not balanced"
end

puts ""
puts "Level Order"
p test.level_order
puts ""
puts "Preorder"
p test.preorder
puts ""
puts "Postorder"
p test.postorder
puts ""
puts "In Order"
p test.inorder

test.insert(153)
test.insert(245)
test.insert(642)
test.insert(103)

puts ""
puts test.pretty_print

puts ""
if test.balanced? == true
  puts "The tree is balanced"
else
  puts "The tree is not balanced"
end
puts ""

test.rebalance

puts test.pretty_print

puts ""
if test.balanced? == true
  puts "The tree is balanced"
else
  puts "The tree is not balanced"
end

puts ""
puts "Level Order"
p test.level_order
puts ""
puts "Preorder"
p test.preorder
puts ""
puts "Postorder"
p test.postorder
puts ""
puts "In Order"
p test.inorder