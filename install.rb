#!/usr/bin/ruby
system("sudo apt-get update")
packages = %w(build-essential ruby-full fake-package)
successfully_installed = []

packages.each do |install|
  system("sudo apt-get install -y #{install}")
  if $?.success?
    successfully_installed << install
  else
    puts "Error: Package does not exist - #{install}"
  end
end

puts "Packages installed: #{successfully_installed.inspect}"# frozen_string_literal: true

