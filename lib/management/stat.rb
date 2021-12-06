module Management
  class SaveStat < Assistant
    def initialize cars, requests, count, searches = 'db/searches.yml'
      @cars = cars
      @requests = requests
      @count = count
      @searches = searches
    end

    def call
      File.open(@searches, "a") do |file|
        file.write("Total quantity: #{@cars.size}\n", "Requests quantity: #{1 + @count}\n", @requests.to_yaml)
      end
    end
  end
end
