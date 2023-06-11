# frozen_string_literal: true
require_relative 'mymod'

describe IsPostCode do
  context "Testing the is_postcode method with correct and incorrect codes" do
    it "A correct UK postcode will return true" do
      pcode = "W1A 4WW"
      postcode_checker = IsPostCode.new
      message = postcode_checker.is_postcode?(pcode)
      expect(message).to eq true
    end
    it "A incorrect UK postcode will return false" do
      pcode = "W1A 4W4"
      postcode_checker = IsPostCode.new
      message = postcode_checker.is_postcode?(pcode)
      expect(message).to eq true
    end
  end
end



