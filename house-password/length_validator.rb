class LengthValidator

    def initialize(valid_length)
        @valid_length = valid_length
        @current = 0
    end

    def valid?
        @current >= @valid_length
    end

    def validate(char)
        @current += 1
    end
end
