# frozen_string_literal: true
 class StringAnalyzer
    def has_vowels?(str)
      !!(str =~ /[aeio]+/i)
    end
 end

class IsPostCode
  def is_postcode?(str)
    !!(str =~ /^[A-Z]{1,2}[0-9]{1,2}[A-Z]{0,1} [0-9][A-Z]{2}$/)
  end
end
