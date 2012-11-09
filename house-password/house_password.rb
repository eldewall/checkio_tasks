class HousePassword

    def initialize(password)
        @password = password
    end

    def valid_length?
        @password.length >= 10
    end
        
    def has_one_digit?
        valid = false

        @password.chars.to_a.each do |c|
            valid = is_digit?(c)
            break if valid
        end
        
        valid
    end

    def valid?
        has_one_upper? && has_one_lower? && has_one_digit? && valid_length?
    end

    def has_one_upper?
        valid = false
        @password.chars.to_a.each do |c|
            valid = !is_digit?(c) && is_upper?(c)
            break if valid
        end

        valid
    end

    def has_one_lower?
        valid = false
        @password.chars.to_a.each do |c|
            valid = !is_digit?(c) && is_lower?(c)
            break if valid
        end

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
