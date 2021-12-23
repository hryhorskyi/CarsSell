module Management
  class Input < Assistant 
    def call  
      puts I18n.t('search.select') 
      puts I18n.t('search.make_ask')
      make = gets.strip.capitalize
  
      puts I18n.t('search.model_ask')
      model = gets.strip.capitalize
  
      puts I18n.t('search.year_from')
      year_from = gets.to_i
  
      puts I18n.t('search.year_to')
      year_to = gets.to_i
  
      puts I18n.t('search.price_from')
      price_from = gets.to_i
  
      puts I18n.t('search.price_to')
      price_to = gets.to_i
  
      puts I18n.t('sort.type')
      sort_options = gets.strip.downcase
  
      puts I18n.t('sort.direction')
      sort_direction = gets.strip.downcase
  
      { make: make, model: model, year_from: year_from, year_to: year_to, price_from: price_from, 
        price_to: price_to, sort_options: sort_options, sort_direction: sort_direction }  
    end 
  end
end
