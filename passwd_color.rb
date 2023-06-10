#!/usr/bin/ruby
# frozen_string_literal: true
require 'csv'

# ANSI escape sequences for formatting and color
HEADER_BOLD = "\e[1m"
COLOR_GREEN = "\e[32m"
RESET_COLOR = "\e[0m"

array = []

CSV.foreach("/etc/passwd", headers: false, col_sep: ":") do |row|
  array << row unless row[0].match(/^#/)
end

name_length = 0
full_length = 0

array.each do |item|
  nlength = item[0].length
  name_length = nlength if nlength > name_length

  flength = item[4].length
  full_length = flength if flength > full_length
end

printf("%s%-#{name_length}s %4s %-#{full_length}s %s%s\n", HEADER_BOLD, 'User', 'UID', 'Full Name', 'Shell', RESET_COLOR)

array.each do |user|
  printf("%s%-#{name_length}s %4s %-#{full_length}s %s%s\n", COLOR_GREEN, user[0],user[2], user[4], user[6], RESET_COLOR)
end
# frozen_string_literal: true

