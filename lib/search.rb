def search(cars_list, search_cond)
  search_results = []

  cars_list.each do |item|
    k = 0

    item.each_pair do |key, val|
      if key == 'make' || key == 'model'
        if val.to_s.casecmp(search_cond[key]) == 0 || search_cond[key].empty?
          k += 1
        else 
          k = 0
        end 
      end

      if key == 'year' || key == 'price'
        if search_cond[key + '_from'].to_s.empty? || val >= search_cond[key + '_from']
          k += 1
        else 
          k = 0
        end

        if search_cond[key + '_to'].to_s.empty? || val <= search_cond[key + '_to']
          k += 1
        else 
          k = 0
        end     
      end 
    end

    if k == 6
      search_results << item
    end 
  end

  search_results
end
