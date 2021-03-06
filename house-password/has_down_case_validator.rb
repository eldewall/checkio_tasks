require_relative 'validator'

class HasDownCaseValidator < Validator

    def initialize
        @is_valid = false
    end

    def validate(char)
       @is_valid = !is_digit?(char) && is_down?(char) unless @is_valid 
    end

    def valid?
        @is_valid
    end

end
