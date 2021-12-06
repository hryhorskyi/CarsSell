module Management
  class Statistic < Assistant 
    def initialize requests, data = 'db/searches.yml'
      @requests = requests
      @data = data
      @searches = []
      @count = []
    end
	  
    def call	  
      YAML::load_stream(File.open(@data)){ |doc|
        if doc["Total quantity"] && doc["Search times"]
          doc = doc.except("Total quantity", "Search times")
        end
        @searches << doc   	
      }	
       
      @searches.each do |item|		
        if @requests == item
          @count << item
        end
      end
      @count = @count.size
    end	  
  end
end
