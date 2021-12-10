module Management
  class Statistic < Assistant 
    def initialize requests
      @requests = requests
      @data = 'db/searches.yml'
      @searches = []
      @count = []
    end
	  
    def call	
      YAML::load_stream(File.open(@data)){ |doc|
        if doc["Total quantity"] && doc["Requests quantity"]
          doc = doc.except("Total quantity", "Requests quantity")
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
