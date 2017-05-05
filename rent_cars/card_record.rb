require 'byebug'
class CardRecord
	attr_accessor 	:user_id,
					:car_number,
					:time_begin,
					:time_return,
					:status,
					:car_id
	def initialize(user_id, car_number, car_id)
		@user_id 		= user_id
		@car_number 	= car_number
		@time_begin 	= Time.now
		@time_return 	= nil
		@car_id 		= car_id
	end
	

	# начисление суммы долга за пользование авто по формуле
	# 1 секунда стоит 100 грн.
	def sum_for_rent(time_return_car) 			
		@time_return = time_return_car
		((time_return_car - @time_begin) * 100).round(2)   
	end	

end
# 	def check
#     if Time.now > @must_return_at && status != :checked && status != :returned
#       @status = :checked
#       -100
#     else
#       0
#     end
#   end

#   def update_status
#     if Time.now > @must_return_at && status != :checked && status != :returned
#       @status = :returned
#       -100 
#     else
#       @status = :returned
#       0
#     end
#   end
# end


# kk = CardRecord.new(111,3333,2323)
# byebug
# ff = CardRecord.new(111,3333)

