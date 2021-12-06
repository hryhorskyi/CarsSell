module Management
  class Input < Assistant 
    def call  
      puts "Please choose search conditions: "
      puts "Please choose the make: "
      make = gets.strip.capitalize
  
      puts "Please choose the model: "
      model = gets.strip.capitalize
  
      puts "Please choose the year_from: "
      year_from = gets.to_i
  
      puts "Please choose the year_to: "
      year_to = gets.to_i
  
      puts "Please choose price_from: "
      price_from = gets.to_i
  
      puts "Please choose price_to: "
      price_to = gets.to_i
  
      puts "Please choose sort option(date/price): "
      sort_options = gets.strip.downcase
  
      puts "Please choose sort direction(desc/asc): "
      sort_direction = gets.strip.downcase
  
      { make: make, model: model, year_from: year_from, year_to: year_to, price_from: price_from, 
        price_to: price_to, sort_options: sort_options, sort_direction: sort_direction }  
    end 
  end
end
