require_relative 'my_script'

RSpec.describe 'MyScript' do
  describe '#read_file_content' do
    it 'reads the first line of the file' do
      file_path = 'sample.txt'
      content = "welcome ruby\n"
      file_double = double('file')
      allow(file_double).to receive(:first).and_return(content)
      allow(File).to receive(:open).with(file_path).and_yield(file_double)

      result = MyScript.read_file_content(file_path)

      expect(result).to eq('welcome ruby')
    end
  end
end




