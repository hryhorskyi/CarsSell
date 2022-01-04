# frozen_string_literal: true

module Management
  class Sort < Assistant
    def initialize(cars, requests)
      @cars = cars
      @requests = requests
    end

    def call
      direction_of_sorting = @requests[:sort_direction] == 'asc' ? 1 : -1

      if @requests[:sort_option] == 'price'
        @cars.sort_by { |car| [direction_of_sorting * car['price']] }
      else
        @cars.sort_by { |car| [direction_of_sorting * Time.strptime(car['date_added'], '%d/%m/%y').to_i] }
      end
    end
  end
end
