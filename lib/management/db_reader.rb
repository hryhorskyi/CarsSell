module Management
  class DBReader < Assistant
    def initialize file_name
      @file_name = file_name
    end

    def call
      return unless File.exist?(@file_name)

      YAML.load_file(@file_name)
    end
  end
end
