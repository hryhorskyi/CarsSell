module Management
  class Output < Assistant
    def initialize cars, count
      @cars = cars
      @count = count
    end
  
    def call
      puts
      puts "-" * 20
      puts "Statistic:\n"
      puts "Total Quantity: #{@cars.size} car(s)."
      puts "Requests quantity: #{@count}"
      puts "-" * 20

      puts "Results:\n"
      @cars.each do |car|
        car.each do |key, value|
          puts "#{key} #{value}"
        end
        puts "-" * 20
      end
    end
  end
end
