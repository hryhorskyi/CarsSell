def read_data(file_name)
  nil unless File.exist?(file_name)

	cars_list = YAML.load_file(file_name)
end
