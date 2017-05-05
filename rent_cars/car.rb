class Car
	attr_accessor   :mark,
					:model,
					:car_number,
					:status,
					:id,
					:cost
	@@car_count = 0				
	def initialize(mark, model, car_number, cost)
		@@car_count += 1
		@id = @@car_count
		@mark 	= mark
		@model 	= model
		@car_number = car_number
		@status = :at_parking
		@cost = cost
	end

	def change_status
	    case @status
	    when :at_parking
	      @status = :rent
	    when :rent
	      @status = :at_parking
	    end
  	end

  	def to_s
	    puts "=============CAR №#{@id}==============="
	    puts "Mark: #{@mark}"
	    puts "Model: #{@model}"
	    puts "Number: #{@car_number}"
	    puts "Status: #{@status}"
	    puts "Cost: #{@cost}"
	    puts '======================================='
	    puts
  	end
end


