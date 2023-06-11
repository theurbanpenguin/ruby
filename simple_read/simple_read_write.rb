# frozen_string_literal: true
# code
FILE_LOCATION = 'sample.txt'
def readfile
  content = File.read(FILE_LOCATION)
  puts content
end

readfile
newcontent = 'hello ruby'
File.write(FILE_LOCATION, newcontent)
readfile