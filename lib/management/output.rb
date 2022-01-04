# frozen_string_literal: true

module Management
  class Output < Assistant
    def initialize(cars, count, requests)
      @cars = cars
      @count = count
      @requests = requests
    end

    def call
      print_statistic
      print_cars
    end

    private

    def print_statistic
      rows_statistic = []
      rows_statistic << [I18n.t('print.total').colorize(:green), @cars.size.to_s.colorize(:light_blue)]
      rows_statistic << [I18n.t('print.requests').colorize(:green),
                         (@count[@requests][:req_count]).to_s.colorize(:light_blue)]
      table = Terminal::Table.new(title: I18n.t('print.statistic'), rows: rows_statistic)
      puts table
    end

    def print_cars
      rows = []
      @cars.each do |car|
        car.each do |key, value|
          rows << [I18n.t("print.#{key}").to_s.colorize(:green), value.to_s.colorize(:light_blue)]
        end
        rows << :separator
      end
      table = Terminal::Table.new(title: I18n.t('print.searched'),
                                  headings: [I18n.t('print.rule'), I18n.t('print.desc')], rows: rows)
      puts table
    end
  end
end
