# frozen_string_literal: true

module Management
  class UserLogIN < Assistant
    def initialize
      @users_db = YAML.load_file('db/users.yml')
      @check = false
    end

    def call
      log_in ? @email : @check
    end

    def log_in
      puts I18n.t('print.email')
      @email = gets.chomp

      puts I18n.t('print.password')
      @password = gets.chomp

      @users_db ? @users_db.detect { |user| user[:email] == @email && user[:password] == @password } : false
    end
  end
end
