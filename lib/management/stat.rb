# frozen_string_literal: true

module Management
  class SaveStat < Assistant
    def initialize(data, statistics)
      @data = data
      @statistics = statistics
    end

    def call
      File.open(@data, 'w') { |file| file.write(@statistics.to_yaml) }
    end
  end
end
