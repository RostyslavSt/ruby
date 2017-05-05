require './fish.rb'

class Crucian < Fish
	attr_reader :type

	def initialize x, y
		super x, y
		@type = "к"
	end

	def reproduction
		Crucian.new(x, y)
	end

	
end

