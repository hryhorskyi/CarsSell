require 'yaml'
require 'date'
require_relative 'lib/read_db.rb'
require_relative 'lib/input.rb'
require_relative 'lib/search.rb'
require_relative 'lib/sort.rb'
require_relative 'lib/output.rb'

SEARCHING_CONDITIONS = %w[make model year_from year_to price_from price_to]

file_name = "#{File.dirname(__FILE__)}/db/cars.yml"

cars_list = read_data(file_name)

rules = getting_searching_conditions(SEARCHING_CONDITIONS)

searched_cars = search(cars_list, rules)

sorted_cars = sorting(searched_cars)

output = output_cars(sorted_cars)
