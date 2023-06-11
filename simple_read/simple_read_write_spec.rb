require_relative 'my_script' # Replace 'my_script' with the actual filename

RSpec.describe 'MyScript' do
  describe '#read_file_content' do
    it 'reads the first line of the file and checks for "welcome ruby"' do
      allow(File).to receive(:foreach).and_yield("welcome ruby\n")
      script = MyScript.new
      first_line = script.read_file_content

      expect(first_line).to eq('welcome ruby')
    end

    it 'reads the second line of the file and checks for "hello ruby"' do
      allow(File).to receive(:foreach).and_yield("some other content\n", "hello ruby\n")
      script = MyScript.new
      second_line = script.read_file_content

      expect(second_line).to eq('hello ruby')
    end
  end
end


