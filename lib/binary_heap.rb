require "rubygems"
require "colorize"

class BinaryHeap
	attr_accessor :heap
	def initialize 
		@heap = []
	end

	def insert value
		@heap << value
		heap_take_up @heap.length-1
	end	

	def remove_last
		raise ArgumentError, "não há o que remover" if @heap.length == 0
		max = @heap[0]
		@heap[0] = @heap[@heap.length-1]
		@heap[@heap.length-1] = max
		@heap.pop
		heap_max 0
		max
	end	
	
	def heap_take_up i
		j = parent i
		if i > 0
			if @heap[j] < @heap[i]
				@heap[j], @heap[i] = @heap[i], @heap[j]
				heap_take_up j
			end	
		end	
	end	

	def heap_max i
		left = left_child(i)
		right = right_child(i)
		if left < @heap.length
			if @heap[left] > @heap[i] 
				higher = left
			else
				higher = i
			end
		end
		if right < @heap.length 
			higher = right if @heap[right] > @heap[higher]
		end
		if higher != i && !higher.nil?
			@heap[i], @heap[higher] = @heap[higher], @heap[i]
			heap_max higher
		end	
	end	

	def is_heap(vector = [])
		unless vector.length == 0
			return true if vector.length == 1
			vector.each_with_index do |p, i|
				return false if vector[parent(i)] < vector[i]
			end
			return true
		end
	end

	def parent i
		(i/2).to_i
	end	

	def left_child i
		(2*i)
	end	

	def right_child i
		(2*i)+1
	end	

	def to_s
		s = []
		n = 1
		sp = " "
		s << "#{sp*(@heap.length-1)}#{@heap[0]}\n"
		@heap.each_with_index do |p, i| 
			if (2**i)%(i+2) == 0
				s << "#{sp*(@heap.length/n)}#{p < @heap[parent(i)] ? p : p.to_s.red}\n"
			else
				if i+1 < @heap.length && @heap.length != 0
					s << "#{sp*(n/(n/2))}" if parent(i) != parent(i+1)
				end	
				s << "#{sp*(@heap.length/n)}#{p < @heap[parent(i)] ? p : p.to_s.red}#{sp*(@heap.length/(n))}" if i != 0
			end
			n *= 2 if ((2**i)%(i+2)) == 0 || i == 0
		end
		if is_heap(@heap)
			s << "\nit's all right =D\n".green
		else
			s << "\noh fuckin'shit there's something wrong here =(\n".red
		end
		s << "\n\nnivels: #{n}"
		s.to_s
	end	

end
