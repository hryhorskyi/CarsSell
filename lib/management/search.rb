# frozen_string_literal: true

module Management
  class Search < Assistant
    def initialize(cars, requests)
      @cars = cars
      @requests = requests
    end

    def call
      match_name
      match_year
      match_price
      @cars
    end

    def match_name
      @cars.select! { |car| car['make'].capitalize == @requests[:make] } unless @requests[:make].empty?
      @cars.select! { |car| car['model'].capitalize == @requests[:model] } unless @requests[:model].empty?
    end

    def match_year
      @cars.select! { |car| car['year'] >= @requests[:year_from] } if (@requests[:year_from]).positive?
      @cars.select! { |car| car['year'] <= @requests[:year_to] } if (@requests[:year_to]).positive?
    end

    def match_price
      @cars.select! { |car| car['price'] >= @requests[:price_from] } if (@requests[:price_from]).positive?
      @cars.select! { |car| car['price'] <= @requests[:price_to] } if (@requests[:price_to]).positive?
    end
  end
end
