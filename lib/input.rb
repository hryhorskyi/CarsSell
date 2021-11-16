def getting_searching_conditions(conditions)
  got_conditions = {}

  puts 'Please select search conditions:'

  conditions.each do |condition|
    puts "Please choose #{condition}: "

    answer = gets.chomp 

    unless answer.empty?
      if (condition.include? 'year') || (condition.include? 'price')
        answer = answer.to_i
      end
    end

    got_conditions[condition] = answer
  end

  got_conditions
 end

def get_option(message = '')
  puts(message)
  
  opt = gets.chomp
end
