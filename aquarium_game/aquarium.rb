require 'byebug'
require './fish.rb'
require './pike.rb'
require './crucian.rb'
class Aquarium
	attr_reader :height, :width
	attr_accessor :fish_list

	def initialize height, width
		@height = height
		@width = width
		@fish_list = []
	end

	def fish_details
		puts "Aquarium Details:"
		@fish_list.each do |fish|
			puts " -Type of fish:#{fish.type}-#{fish.class}," + 
			"coord:(#{fish.x},#{fish.y}), gender:#{fish.gender}," +
			" age:#{fish.age}, weight:#{fish.weight}"
		end
		puts "--------"
	end
	def print_borders
		# puts "Please, enter width and height of aquarium"
		# puts "width: "
		# @width = gets.chomp_to_i
		print_horizontal
		print_vertical
		print_horizontal
	end

	def add_fish (*fish_array)
		@fish_list += fish_array
		@fish_list.flatten!
	end

	def check_results
		fish_list.each do |fish|
			another_fish = who is here(fish.x, fish.y)
			#check who eat
		end
	end

	def who_is_here(x,y)
		#return all fish from this coordinate
		fish_list.select{|fish| fish.x == x && fish.y == y}
	end

	def print_aquarium
		print_horizontal
		@height.times do |x|
			print "      "
			@width.times do |y|
				fish_in_cell = who_is_here(x + 1,y + 1)
				print cell_status(fish_in_cell)
			end
			puts
		end
		print_horizontal

	end

	def cell_status(fish_in_cell)
		case fish_in_cell.size
			when 0
				"~"
			when 1
				fish_in_cell.first.type
			else 
				"*"	
		end
	end


	def statistic
		pikes = fish_list.select {|fish| fish.is_a?(Pike)}
		crucians = fish_list.select {|fish| fish.is_a?(Crucian)}
		puts "============================="
		puts "Number of Pikes: #{pikes.size}"
		puts "Number of Crucians: #{crucians.size}"
		puts "============================="

	end

	def takt count
		@fish_list.delete_if{|fish| fish.weight == 0}

		@fish_list.each do |fish|

			coordinates = fish.want_to
			if valid_coordinates?(coordinates)
				fish.move(coordinates)
			end
			
			if fish.is_a?(Crucian) && (fish.age % 3 == 0) 
				fish.add_weight 0.5
			end
			fish.increase_age

			if fish.is_a?(Pike)  #decrease weight of pike
				fish.decrease_weight
			end
		end
	end

	def check_fishes
		fish_list.each do |fish|
			current_cell = who_is_here(fish.x, fish.y)
			current_cell.each do |inside_fish|
				if fish.respond_to?(:eat)
					fish.eat(inside_fish)
				end
				if fish.can_reproduce?(inside_fish)
					add_fish(fish.reproduction)
					puts "After this takt was born: #{fish.class}"
					
				end
			end
		end
		fish_list.delete_if { |fish| fish.weight == 0}
	end

	def counter_takt? count
		if count % 3 == 0
			return true
		 	else return false
		end
	end

	def start_game
		i = true
		count = 0
		while game_continue_first_cond? && game_continue_second_cond? do
			print_aquarium
			check_fishes
			statistic
			puts "Number of takt #{count}"
			sleep 1.5
			takt(count)
			fish_details
			count += 1
			
		end
	end

	def valid_coordinates? coord
		coord[:x] > 0 && coord[:x] <= @height && coord[:y] > 0 && coord[:y] <= @width
	end

	private
		def print_horizontal
			puts "      #{'=' * @width}"
		end

		def print_vertical
			@height.times do
				puts "|" + (" " * width) + "|"	
			end
		end

		def game_continue_first_cond?
			return true if fish_list.size < (@height * @width)
		end
		def game_continue_second_cond?
			cur_crucians = fish_list.select { |fish| fish.is_a?(Crucian)}.size
			cur_pikes = fish_list.select { |fish| fish.is_a?(Pike)}.size
			return true if (cur_crucians != fish_list.size && cur_pikes != fish_list.size)
		end


end
