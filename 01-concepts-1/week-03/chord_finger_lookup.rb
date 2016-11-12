# ith entry at peer with id n is first peer with id >= n + 2^i (mod 2^m)

N = 33  # Own id
M = 8   # Nodes in ring
I = 3   # finger table position

def finger(i)
  (N + (2**i)) % (2**M)
end

(1..M).map do |i|
  puts "#{i} => #{finger(i)}"
end
