def quicksort(numbers, l, h) 
	pivot_index = choose_pivot(numbers, l, h)
	swap(numbers, pivot_index, h)
	marker_index = l
	for i in l..h
		if numbers[i] < numbers[h]
			swap(numbers, i, marker_index)	
			marker_index += 1
		end
	end
	swap(numbers, h, marker_index)
	if l < marker_index
		quicksort(numbers, l, marker_index)
	end
	if marker_index + 1 < h
		quicksort(numbers, marker_index + 1, h)
	end
	numbers
end

def swap(numbers, from, to)
	if from != to 
		tmp = numbers[from]
		numbers[from] = numbers[to]
		numbers[to] = tmp
	end
end

def choose_pivot(numbers, l, h)
	l + rand(h - l)
end

numbers = File.foreach("test.txt").to_a.map { |e| e.to_i }

puts quicksort(numbers, 0, numbers.count - 1)

