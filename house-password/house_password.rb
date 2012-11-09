require_relative 'length_validator'
require_relative 'has_upper_case_validator'
require_relative 'has_down_case_validator'
require_relative 'has_digit_validator'

class HousePassword

    def initialize(password)
        @password = password

        @validators = []
        @validators << LengthValidator.new(10)
        @validators << HasUpperCaseValidator.new
        @validators << HasDownCaseValidator.new
        @validators << HasDigitValidator.new
    end

    def valid?
      @validate ||= validate
    end

  private 
    def validate
        @password.chars.to_a.each { |c| @validators.each { |v| v.validate(c) } }
        @validators.map(&:valid?).count(false) == 0
    end
end
