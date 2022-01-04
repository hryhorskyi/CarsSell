# frozen_string_literal: true

module Management
  class ShowCar < Assistant
    def initialize
      @file_name = 'db/cars.yml'
      @cars = Management::DBReader.call(@file_name)
    end

    def call
      rows = []
      @cars.each do |car|
        car.each do |key, value|
          rows << [I18n.t("print.#{key}").to_s.colorize(:green), value.to_s.colorize(:light_blue)]
        end
        rows << :separator
      end
      puts Terminal::Table.new(title: I18n.t('print.searched'),
                               headings: [I18n.t('print.rule'), I18n.t('print.desc')], rows: rows)
    end
  end
end
