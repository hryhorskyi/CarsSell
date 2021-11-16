def sorting(cars_list)
  sort_option = get_option('Please choose sort option (date_added|price): ')
  sort_direction = get_option('Please choose sort direction(desc|asc): ')

  if sort_direction.nil?
    sort_direction = ''
  end

  if sort_option.nil?
    sort_option = ''
  end  
  
  case sort_option
    when 'date_added'
      if sort_direction == 'asc'
          cars_list.sort_by! { |car| Date.strptime(car['date_added'], '%d/%m/%y') }
      else
          (cars_list.sort_by! { |car| Date.strptime(car['date_added'], '%d/%m/%y') }).reverse!
      end

    when 'price'
      if sort_direction == 'asc'
          cars_list.sort_by! { |car| car['price'] }
      else
          (cars_list.sort_by! { |car| -car['price'] })
      end
    else
      (cars_list.sort_by! { |car| Date.strptime(car['date_added'], '%d/%m/%y') }).reverse!
    end

  cars_list
end 
