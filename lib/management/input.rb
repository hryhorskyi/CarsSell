# frozen_string_literal: true

module Management
  class Input < Assistant
    def initialize
      @name = { make: '', model: '' }
      @numeric = { year_from: '', year_to: '',
                   price_from: '', price_to: '' }
      @sort_rules = { sort_option: '', sort_direction: '' }
    end

    def call
      puts I18n.t('search.select')

      requests = {}
      requests.merge(input_user_name, input_user_numeric, input_user_sort)
    end

    def input_name(text)
      puts I18n.t(text)
      gets.strip.capitalize
    end

    def input_numeric(text)
      puts I18n.t(text)
      gets.to_i
    end

    def input_sort(text)
      puts I18n.t(text)
      gets.strip.downcase
    end

    def input_user_name
      @name.each { |key, _| @name[key] = input_name("search.#{key}") }
      @name
    end

    def input_user_numeric
      @numeric.each { |key, _| @numeric[key] = input_numeric("search.#{key}") }
      @numeric
    end

    def input_user_sort
      @sort_rules.each { |key, _| @sort_rules[key] = input_sort("sort.#{key}") }
      @sort_rules
    end
  end
end
