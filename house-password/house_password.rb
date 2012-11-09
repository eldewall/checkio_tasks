class HousePassword

    def initialize(password)
        @password = password
    end

    def valid_length?
        @password.length >= 10
    end
        
    def has_one_digit?
        valid = false
        @password.chars.to_a.each { |c| valid = is_digit?(c) }
        valid
    end

    def has_one_upper?
        valid = false
        @password.chars.to_a.each { |c| valid = is_upper?(c) }
        valid
    end

  private

    def is_upper?(char)
        char == char.upcase
    end

    def is_lower?(char)
        char == char.downcase
    end

    def is_digit?(char)
        char.to_i.to_s == char
    end
end
