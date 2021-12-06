module Management
  class Search < Assistant   
    def initialize cars, requests
      @cars = cars
      @requests = requests
    end
      
    def call
      @cars.select! { |car| car['make'].capitalize == @requests[:make] } unless @requests[:make].empty?
      @cars.select! { |car| car['model'].capitalize == @requests[:model] } unless @requests[:model].empty?
      @cars.select! { |car| car['year'] >= @requests[:year_from] } if @requests[:year_from] > 0
      @cars.select! { |car| car['year'] <= @requests[:year_to] } if @requests[:year_to] > 0
      @cars.select! { |car| car['price'] >= @requests[:price_from] } if @requests[:price_from] > 0
      @cars.select! { |car| car['price'] <= @requests[:price_to] } if @requests[:price_to] > 0    
      @cars
    end 
  end
end
