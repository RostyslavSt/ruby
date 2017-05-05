require './fish.rb'

class Pike < Fish
	attr_reader :type

	def initialize x, y
		super x, y
		@type = "щ"
	end

	def reproduction
		Pike.new(x, y)
	end

	def decrease_weight
		@weight -= 0.5
	end

	def eat neighbor_fish
		return if neighbor_fish.is_a? Pike
		puts "nyam, nyam..."
		@weight += neighbor_fish.weight
		neighbor_fish.die
	end
		

	

end