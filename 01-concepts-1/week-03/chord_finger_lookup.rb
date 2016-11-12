#!/usr/bin/env ruby

# ith entry at peer with id n is first peer with id >= n + 2^i (mod 2^m)


NODES = [1, 12, 123, 234, 345, 456, 501].sort
M = 9   # Nodes in ring

def finger(n, i)
  (n + (2**i)) % (2**M)
end

class Node
  attr_reader :finger_table

  def initialize(id)
    @id = id
    @finger_table = (1..M).map do |i|
      NODES.find { |e| e >= finger(@id, i) } || NODES.first
    end
  end
end

# p Node.new(234).finger_table
# p Node.new(501).finger_table
# p Node.new(1).finger_table

# q13

p Node.new(501).finger_table.include?(234)
p Node.new(123).finger_table.include?(234)
p Node.new(12).finger_table.include?(234)
p Node.new(456).finger_table.include?(234)
