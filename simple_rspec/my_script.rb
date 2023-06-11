# frozen_string_literal: true
# my_script.rb

module MyScript
  def self.read_file_content(file_path)
    File.foreach(file_path).first.chomp
  end

  def self.write_to_file(file_path, content)
    File.open(file_path, 'w') do |file|
      file.puts(content)
    end
  end
end


