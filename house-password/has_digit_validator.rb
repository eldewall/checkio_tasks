class HasDigitValidator

    def initialize
        @is_valid = false
    end

    def validate(char)
       @is_valid = is_digit?(char) unless @is_valid 
    end

    def valid?
        @is_valid
    end

  private
    def is_digit?(char)
        char.to_i.to_s == char
    end
end
