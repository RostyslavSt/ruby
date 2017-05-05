require 'byebug'
class TicTak
	attr_accessor :field, :sizeField, :continueGame
	def initialize
		@field = []
		@sizeField = 0
		@continueGame = true
	end
	
	def setField #create field with custom parameters
		puts "Please enter the size of field"
		@sizeField = gets.chomp.to_i
		@sizeField.times do |item|
			@field[item] = []
			@sizeField.times do |item2|
				@field[item][item2] = " "
			end	
		end
	end

	def showField #to show field in console
		@field.each do |line|
			line.each do |elem|
				print "|#{elem}|"
			end
			print "\n"
		end
	end

	def checkCoordinate currentPlayer, coordName #to enter and chek coordinates
		puts "Enter coordinate #{coordName} = "
		coordValue = gets.chomp.to_i
		while coordValue > @sizeField || coordValue <= 0 do
			puts "Coordinate #{coordValue} is out from range. Enter number from 1 to #{@sizeField}"
			puts "Step by player - #{currentPlayer}"
			puts "Enter coordinate #{coordName} = "
			coordValue = gets.chomp.to_i
		end
		return coordValue
	end

	def checkHorizontal? #checking for gorizontal 
		value = true
		@field.each do |item|
		value = true
		item.each_with_index do |item2, index|
				if item[0] != item2 || item[0] == " "
					value = false
				end	
			end	
			if value == true 
				puts value
				puts item.to_s
				return value
			end		
		end
		return value
	end

	def checkVertical? #checking for vertical 
		value = true
		@sizeField.times do |index|
			value = true
			sizeField.times do |index2|
				if @field[0][index] != @field[index2][index] || @field[index2][index] == " "
					value = false
				end
			end
			if value == true
				return value
			end
		end
		return value
	end
		
	def dioganal_1? # checking dioganal "\"
		value = true
		@field.size.times do |index|
			if @field[0][0] != @field[index][index] || @field[0][0] == " "
				value = false
				return false
			end
		end
		return value
	end

	def dioganal_2? # checking dioganal "/"
		k = @field.size - 1
		value = true
		@field.size.times do |index|
			if @field[0][-1] != @field[index][k] || @field[0][-1] == " "
				value = false
				return false
			end
			k -= 1
		end
		return value
		
	end
	
	def step currentPlayer # making step by one player
		puts "Step by player - #{currentPlayer}"
		x = checkCoordinate(currentPlayer, "x") - 1
		y = checkCoordinate(currentPlayer, "y") - 1
		# puts @field[x][y]
		while @field[x][y] == "X" || @field[x][y] == "0" do
			puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			puts "This cell is already filled"
			puts "Please, enter coordinates once more"
			puts "Step by player  - #{currentPlayer}"
			x = checkCoordinate(currentPlayer, "x") - 1
			y = checkCoordinate(currentPlayer, "y") - 1
		end
		@field[x][y] = "#{currentPlayer}"
		if checkHorizontal? || checkVertical? || dioganal_1? || dioganal_2?
			puts "PLAYER #{currentPlayer} WIN!!!"
			@continueGame = false
		end
	end

	def startGame #the logic of the game
		puts "HELLO!"
		puts "let's get ready to rumble!!!!"
		puts "-----------------------------"
		setField
		showField
		counter = 0
		maxCountSteps = @field.size**2
		while counter <= maxCountSteps do
			currentPlayer = "X"
			step(currentPlayer)
			counter += 1
			if @continueGame == false
				showField
				break
			end
			
			if counter >= maxCountSteps
				puts "Победила дружба!!!"
				showField
				break
			end
			currentPlayer = "0"
			showField
			step(currentPlayer)
			counter += 1
			if @continueGame == false
				showField
				break
			end
			if counter >= maxCountSteps
				puts "Победила дружба!!!"
				showField
				break
			end
			showField
			
		end
	end
end

system "clear"
gameNew = TicTak.new
gameNew.startGame