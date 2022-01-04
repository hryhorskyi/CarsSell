# frozen_string_literal: true

module Management
  class Menu < Assistant
    def initialize
      @file_name = 'db/cars.yml'
      @file_searches = 'db/searches.yml'
    end

    def call
      select_lang
      printer('print.welcome')
      show_menu
    end

    private

    def select_lang
      puts('Choose the language en or ua')
      lang = gets.chomp.downcase

      lang = 'en' if lang != 'ua'
      I18n.default_locale = :"#{lang}"
    end

    def search_car
      Management::App.call(@file_name, @file_searches)
    end

    def show_car
      Management::ShowCar.call
    end

    def printer(text)
      puts I18n.t(text)
    end

    def menu
      printer('print.menu_option')
      (1..4).each do |i|
        printer("print.menu_#{i}")
      end
      @menu_option = gets.chomp
    end

    def select_option
      case @menu_option
      when '1' then search_car
      when '2' then show_car
      when '3' then printer('print.help')
      when '4' then printer('print.menu_end')
                    exit
      else printer('print.menu_error')
      end
    end

    def show_menu
      menu
      loop do
        select_option
        menu
      end
    end
  end
end
