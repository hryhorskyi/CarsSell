# frozen_string_literal: true

module Management
  class UserSignUP < Assistant
    include BCrypt
    VALID_PASSWORD = /^(?=.*[a-z])(?=.*[A-Z])(?=(?:.*?[@$!%*?&]){2,})[A-Za-z\d@$!%*?&]{8,20}$/
    VALID_EMAIL = /^[a-z\d.]{5,}+@[a-z\d.]+\.[a-z]+/

    def initialize
      @users_db = YAML.load_file('db/users.yml') || []
    end

    def call
      user_params
      return false unless valid_email

      return false unless valid_password

      sign_up_params
      @email
    end

    def user_params
      puts I18n.t('print.email_rules')
      puts I18n.t('print.email')
      @email = gets.chomp

      puts I18n.t('print.password_rules')
      puts I18n.t('print.password')
      @password = gets.chomp
    end

    def add_user
      @users_db << @params
      File.open('db/users.yml', 'w') { |file| file.write(@users_db.to_yaml) }
    end

    def valid_email
      return unless VALID_EMAIL.match?(@email)

      user_uniq?(@email)
    end

    def user_uniq?(email)
      @users_db ? !@users_db.detect { |user| user[:email] == email } : true
    end

    def valid_password
      VALID_PASSWORD.match?(@password)
    end

    def sign_up_params
      @params = { email: @email, password: Password.create(@password) }
      add_user
    end
  end
end
