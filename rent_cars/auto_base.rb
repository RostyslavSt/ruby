require 'byebug'
# require 'faker'
require './car.rb'
require './user_card.rb'
require './card_record.rb'

class AutoBase
	attr_accessor 	:name,
					:cars_base,
					:user_cards,
					:auto_base_account
					
	def initialize(name)
		@name 				= name
		@cars_base 			= []
		@user_cards 		= []
		@auto_base_account 	= 2000
	end

	#------------------------------------
	def add_cars(cars)
		cars.each do |car|
			@cars_base << car
		end	
	end

	def add_car(car)
		@cars_base << car
	end

	#------------------------------------
  def buy_cars
    while @auto_base_account > 100
      car = get_car
      try_buy(car)
    end
  end

  def try_buy(car)
    return false if @account_base < car.cost
    @cars_base << car
    @account_base -= car.cost
  end
  #------------------------
  def all_cars_info
    @cars_base.each do |car|
      car.to_s
    end
  end

  def find_car_by(by, value)
    @cars_base.find do |car|
      value == car.send(by.to_sym)
    end
  end

  def find_all_cars_by(by, value)
    @cars_base.find_all do |car|
      value == car.send(by.to_sym)
    end
  end
  #-------------------------

  def rental(car_id, user_id, car_number)
    user_card = find_user_card(user_id)
    car      = find_car_by(:id, car_id)
    unless car_present?(car)
      puts 'Car not present!'
      return   
    end
    # if debt?(user_card)
    #   please_pay(user_card.user_current_sum)
    # else
      user_card.make_record(user_id, car_number, car_id)
      car.change_status
    # end
  end

  def return_car(car_id, user_id)
    user_card = find_user_card(user_id)
    car = find_car_by(:id, car_id)
    user_card.remove_record(car_id)
    car.change_status
  end

 #  def debt?(user_card)
 #    # user_card.update_info
 #    return true if user_card.has_debt?
 #    false
	# end
 #  end

  def find_user_card(user_id)
    @user_cards.find { |card| card.id == user_id }
  end

  def pay(user_id, sum)
    user_card = find_user_card(user_id)
    user_card.add_to_sum(sum)
    @auto_base_account += sum
  end

  def add_user(last_name, passport)
    card = UserCard.new(last_name, passport)
    @user_cards << card
    card
  end

  def car_present?(car)
    return false if car.nil?
    car.status == :at_parking
  end

  private

    def please_pay(sum)
      puts "Пожалуйста погасите задолженость #{sum} грн."
    end

    # def get_car
    #   mark   	 = Faker::Company.name
    #   model      = Faker::Color.color_name
    #   number     = Faker::PhoneNumber.subscriber_number
    #   cost     	 = Faker::Commerce.price
    #   Car.new(mark, model, number, cost)
    # end

	
end


