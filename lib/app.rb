# frozen_string_literal: true

module Management
  class App < Assistant
    def initialize(file_name, file_searches)
      @file_name = file_name
      @file_searches = file_searches
    end

    def call
      @cars = Management::DBReader.call(@file_name)

      @requests = Management::Input.call

      @searched_cars = Management::Search.call(@cars, @requests)

      @sorted_cars = Management::Sort.call(@searched_cars, @requests)

      @statistics = Management::Statistic.call(@file_searches, @requests, @sorted_cars)

      Management::SaveStat.call(@file_searches, @statistics)

      Management::Output.call(@sorted_cars, @statistics, @requests)
    end
  end
end
