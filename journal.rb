# frozen_string_literal: true
#!/usr/bin/ruby
require 'systemd/journal'
require 'set'
j = Systemd::Journal.new
ip_addresses = Set.new

# Only display entries from SSHD with priority 6.
j.filter(_EXE: '/usr/sbin/sshd', priority: 6)
j.each do |entry|
  if entry.message.match('Failed password for root from')
    root = entry.message.split(' ')[5]
    ip_addresses << root
  elsif
  entry.message.match('Failed password for invalid user')
    invalid = entry.message.split(' ')[7]
    ip_addresses << invalid unless invalid.match('81.97.43.189')
  end
end

j.close # Close open files

# Print the unique IP addresses
ip_addresses.each do |ip|
  puts ip
  system("firewall-cmd --zone=drop --add-source=#{ip}")
end

