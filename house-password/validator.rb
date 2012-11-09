class Validator

    protected

        def is_down?(char)
            char.downcase == char
        end

        def is_digit?(char)
            char.to_i.to_s == char
        end

        def is_upper?(char)
            char.upcase == char
        end
end
