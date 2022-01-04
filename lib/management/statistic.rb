# frozen_string_literal: true

module Management
  class Statistic < Assistant
    def initialize(data, requests, cars)
      @data = data
      @requests = requests
      @cars = cars
    end

    def call
      statistics = YAML.load_file(File.open(@data)) || {}

      if statistics[@requests]
        statistics[@requests][:req_count] += 1
      else
        statistics[@requests] = { result: @requests, req_count: 1, cars_count: @cars.size }
      end

      statistics
    end
  end
end
