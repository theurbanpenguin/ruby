#!/usr/bin/ruby
# frozen_string_literal: true
require 'csv'
array = []

CSV.foreach("/etc/passwd", headers: false, col_sep: ":") do |row|
  array << row unless row[0].match(/^#/)
end

name_length = 0
full_length =0
array.each do |item|
  nlength = item[0].length
  name_length = nlength if nlength > name_length
  flength = item[4].length
  full_length = flength if flength > full_length
end

printf("%-#{name_length}s %4s %-#{full_length}s %s\n", 'User', 'UID', 'Full Name', 'Shell')

array.each do |user|
  printf("%-#{name_length}s %4s %-#{full_length}s %s\n", user[0], user[2], user[4], user[6])
end