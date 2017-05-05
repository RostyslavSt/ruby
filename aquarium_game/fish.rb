require "byebug"
class Fish
	attr_reader :gender, :age, :weight, :x, :y
	GENDER = [:male, :female]

	def initialize x, y
		@age = 1
		@gender = GENDER.sample
		@weight = rand(1..4)
		@x = x
		@y = y
	end

	def move coordinates
		@x = coordinates[:x]
		@y = coordinates[:y]	
	end

	def want_to
		x = @x + rand(-1..1)
		y = @y + rand(-1..1)
		{ x: x, y: y }
	end

	def add_weight wght
		@weight += wght
	end

	def increase_age
		@age += 1		
	end

	def can_reproduce?(fish)
		self.is_a?(fish.class) && 
		gender != fish.gender && age > 3 && 
		fish.age > 3
	end

	def die
		@weight = 0
	end


end

