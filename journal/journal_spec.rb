# frozen_string_literal: true
require_relative 'my_script' # Replace 'my_script' with the actual filename

RSpec.describe 'MyScript' do
  describe '#parse_journal_entries' do
    it 'adds the root IP address to ip_addresses set' do
      journal_entry = instance_double(Systemd::Journal::Entry)
      allow(journal_entry).to receive(:message).and_return('Failed password for root from 192.168.1.10')
      allow(Systemd::Journal).to receive(:new).and_return([journal_entry])

      script = MyScript.new
      script.parse_journal_entries

      expect(script.ip_addresses).to include('192.168.1.10')
    end

    it 'adds the invalid user IP address to ip_addresses set' do
      journal_entry = instance_double(Systemd::Journal::Entry)
      allow(journal_entry).to receive(:message).and_return('Failed password for invalid user from 192.168.1.20')
      allow(Systemd::Journal).to receive(:new).and_return([journal_entry])

      script = MyScript.new
      script.parse_journal_entries

      expect(script.ip_addresses).to include('192.168.1.20')
    end

    it 'does not add IP address 81.97.43.189 to ip_addresses set' do
      journal_entry = instance_double(Systemd::Journal::Entry)
      allow(journal_entry).to receive(:message).and_return('Failed password for invalid user from 81.97.43.189')
      allow(Systemd::Journal).to receive(:new).and_return([journal_entry])

      script = MyScript.new
      script.parse_journal_entries

      expect(script.ip_addresses).not_to include('81.97.43.189')
    end
  end
end


