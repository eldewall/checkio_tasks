class HasUpperCaseValidator

    def initialize
        @is_valid = false
    end

    def validate(char)
       @is_valid = is_upper?(char) unless @is_valid 
    end

    def valid?
        @is_valid
    end

  private
    def is_upper?(char)
        char.upcase == char
    end
end
