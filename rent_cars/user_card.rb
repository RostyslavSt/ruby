require 'byebug'
require './card_record.rb'
class UserCard
	attr_accessor	:passport,
					:last_name,
					:user_current_sum,
					:id
					

	attr_reader :records
	@@users_count = 0				
	def initialize(last_name, passport)
		@@users_count 		 += 1
		@id 				  = @@users_count
		@passport			  = passport
		@last_name 			  = last_name
		@user_current_sum	  = 0
		@records			  = []
	end

	def make_record(user_id, car_number, car_id)
	    record = CardRecord.new(user_id, car_number, car_id)
	    @records << record
	    record
  	end

	  def remove_record(car_id)
	    record = @records.find { |record| record.car_id == car_id }
	     @user_current_sum = record.sum_for_rent(Time.now)
	  end

	  def print_user_card
	  	puts "=============INFORMATION ABOUT USER: #{@last_name}==============="
		    puts "Passport: #{@passport}"
		    puts "Last Name: #{@last_name}"
		    puts "Sum to pay fo rent car: #{@user_current_sum}"
		    puts "ID: #{@id}"
		    puts '======================================='
		    puts
	  end

 #  def update_info
 #    @records.each do |record|
 #      @current_sum += record.check
 #    end
 #  end

  def add_to_sum(sum)
    @user_current_sum -= sum
  end

  # def has_debt?
  #   @user_current_sum <= 0
  # end
 

end
# rr = UserCard.new(33333, 'Tompson')
# rr.user_current_sum = 23

# byebug
# qq = UserCard.new(33333, 'Tompson')