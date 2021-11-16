def output_cars(cars)
  if cars.empty?
    puts 'Nothing is founded'
    exit
  end

  puts "------------------------------"
  puts 'Results:'
  puts
  
  cars.each do |item|
    item.each_pair do |key, val|
      puts key.capitalize + ': ' + val.to_s
    end

    puts 
    puts "------------------------------"
    puts
  end
end
