require 'yaml'
require './aquarium'

# system ('clear')
config = YAML.load_file("./config2.yml")
horizontal_size 	= config["config"]["horizontal_size"]
vertical_size 		= config["config"]["vertical_size"]
initial_crucians 	= config["config"]["initial_crucians"]
initial_pikes		= config["config"]["initial_pikes"]

aquarium = Aquarium.new(vertical_size, horizontal_size)

initial_pikes.times do
	aquarium.fish_list << Pike.new(rand(1..aquarium.height), rand(1..aquarium.width))
end
initial_crucians.times do
	aquarium.fish_list << Crucian.new(rand(1..aquarium.height), rand(1..aquarium.width))
end
aquarium.start_game

