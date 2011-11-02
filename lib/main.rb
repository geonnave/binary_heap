require "binary_heap"

bheap = BinaryHeap.new

values = []

(1..15).each { |i| values << i}

# values << 30
# values << 29
# values << 29
# values << 21
# values << 19

values.each_with_index do |v, i|
	puts "insert #{v}" 
	bheap.insert v
	# gets
	puts bheap
end	



puts "remove last"
bheap.remove_last
puts bheap

puts "insert 50"
bheap.insert 50
puts bheap
