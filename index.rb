require_relative 'requiries.rb'

file_name = "#{File.dirname(__FILE__)}/db/cars.yml"

cars = Management::DBReader.call(file_name)

requests = Management::Input.call

searched_cars = Management::Search.call(cars, requests)

sorted_cars = Management::Sort.call(searched_cars, requests)

count = Management::Statistic.call(requests)

Management::SaveStat.call(sorted_cars, requests, count)

Management::Output.call(sorted_cars, count)

