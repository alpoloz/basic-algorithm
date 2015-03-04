require 'set'

def find(links) 
	hashedLinks = links.reduce({}, :merge)
	unvisited = [links[0].keys.first]
	visited = Set.new
	while !unvisited.empty?
		vertex = unvisited.pop
		visited.add(vertex)
		if hashedLinks.has_key?(vertex) 
			unvisited.push(*hashedLinks[vertex].reverse.keep_if{ |v| !visited.include? v})
		end	
	end	
	visited
end


links = File.foreach(ARGV[0]).to_a.map do |e|
	vertices = e.split(" ")
	{vertices[0]=> vertices.drop(1)}
end

puts find(links).to_a
