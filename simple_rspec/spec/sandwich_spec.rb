# frozen_string_literal: true
Sandwich = Struct.new(:taste, :topping)
RSpec.describe 'An ideal sandwich' do
  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])
    taste = sandwich.taste
    expect(taste).to eq('delicious')
  end
end