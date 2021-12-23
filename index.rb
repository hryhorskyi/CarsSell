require_relative 'requiries.rb'

file_name = "#{File.dirname(__FILE__)}/db/cars.yml"
file_searches = "#{File.dirname(__FILE__)}/db/searches.yml"

cars = Management::DBReader.call(file_name)

requests = Management::Input.call

searched_cars = Management::Search.call(cars, requests)

sorted_cars = Management::Sort.call(searched_cars, requests)

statistics = Management::Statistic.call(file_searches,  requests, sorted_cars)

Management::SaveStat.call(file_searches, statistics)

Management::Output.call(sorted_cars, statistics, requests)
