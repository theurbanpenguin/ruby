# frozen_string_literal: true
require_relative 'mymod'
postcode_checker = IsPostCode.new
result = postcode_checker.is_postcode?("PE2 9QN")
puts result

