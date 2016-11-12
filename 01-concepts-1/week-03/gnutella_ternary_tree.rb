#!/usr/bin/env ruby


def num_children(depth)
  return 0 if depth == 0
  3 + 3 * num_children(depth - 1)
end

puts "Nodes receiving message from root:"
(1..4).each do |n|
  puts "TTL #{n} => #{num_children(n)}"
end
puts "\n"

#########

ttl = 3
origin_level = 2
levels = 4

puts "From TTL #{ttl} from level #{origin_level}."

origin_children = num_children(levels - origin_level)

parent = 1 # One node reached by message up the tree. TTL now 4
siblings = 2 # 2 nodes reached by message down from root. TTL now 3
siblings_children = siblings * num_children(ttl - 2)

puts origin_children + parent + siblings + siblings_children
