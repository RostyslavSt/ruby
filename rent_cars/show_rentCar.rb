require 'byebug'
# require 'faker'
require './car.rb'
require './auto_base.rb'
require './user_card.rb'
require './card_record.rb'

cars = [Car.new('Toyota','Camry','5522', 4888),
		Car.new('Skoda','A7','4412', 5543),
		Car.new('Subaru','Legacy','1188', 44554),
		Car.new('Mazda','CX-5','2111', 3444),
		Car.new('NIssan','Teada','0987', 21115)
		]

#создаем автобазу
atl = AutoBase.new('Atlant') 

#Заполняем автобазу машинами
atl.add_cars(cars)  

#Выводим на консоль информацию о машинах
atl.all_cars_info 

#находим машину по марке
subaru = atl.find_car_by(:mark, 'Subaru')  
puts "Машина найдена: "
puts subaru.to_s

#создаем пользователя машины
atl.add_user('Conor', 'MN 223-234') 

#создаем пользователя машины
atl.add_user('Thompson', 'KK 998-555') 

#Текущее данные пользователя (до проката)
puts atl.user_cards[0].print_user_card

# берем машину в прокат
atl.rental(1,1,'1188') 
puts "Пользователь взял автомобиль в прокат."
puts "Ждем 5 секунд чтобы начислился долг за пользование авто (1 сек = 100 грн)....."

#для проверки программы - стоимость аренды авто:  1 секунда - 100 грн.
sleep 5 

#возвращаем машину
atl.return_car(1,1) 
puts "Пользователь вернул машину."

#Выводим информацию по пользователю для проверки долга.
puts atl.user_cards[0].print_user_card 

#Пользователь оплачивает 200 грн. долга
atl.pay(1,200) 

# проверяем увеличение счета автосалона
puts "После оплаты пользователем долга, счет автосалона составляет: #{atl.auto_base_account}" 

#проверяем списание долга в 200 грн. у пользователя
puts atl.user_cards[0].print_user_card 


 


