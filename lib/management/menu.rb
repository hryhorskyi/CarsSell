# frozen_string_literal: true

module Management
  class Menu < Assistant
    def initialize
      @file_name = 'db/cars.yml'
      @file_searches = 'db/searches.yml'
      @logged = false
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
      @logged ? choose_logged : choose_unlogged
    end

    def choose_unlogged
      (1..6).each do |i|
        printer("print.menu_#{i}")
      end
      @menu_option = gets.chomp
    end

    def choose_logged
      (1..5).each do |i|
        printer("print.menu_a#{i}")
      end
      @menu_option = gets.chomp
    end

    def select_option
      @logged ? logged_menu : unlogged_menu
    end

    def unlogged_menu
      case @menu_option
      when '1' then search_car
      when '2' then show_car
      when '3' then printer('print.help')
      when '4' then log_in
      when '5' then sign_up
      when '6' then printer('print.menu_end')
                    exit
      else printer('print.menu_error')
      end
    end

    def logged_menu
      case @menu_option
      when '1' then search_car
      when '2' then show_car
      when '3' then printer('print.help')
      when '4' then log_out
      when '5' then printer('print.menu_end')
                    exit
      else printer('print.menu_error')
      end
    end

    def sign_up
      @user_signup = Management::UserSignUP.call
      welcome(@user_signup)
    end

    def log_out
      printer('print.goodbye')
      puts @user_signup
      @logged = false
    end

    def log_in
      @user_login = Management::UserLogIN.call
      welcome(@user_login)
    end

    def welcome(user_parametres)
      if user_parametres == false
        printer('print.incorrect_params')
      else
        printer('print.welcome_')
        puts user_parametres
        @logged = true
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
