class SpeechModule
    
    def initialize
        @low = ["one", "two", "three", "four", "five", "six", "seven", "eight",
                "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                "sixteen", "seventeen", "eighteen", "nineteen"]

        @tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty",
                 "ninety"]
    end

    def interpret(number)
        return "one thousand" if number == 1000

        answer = []
        
        hundred = SpeechModule.number_on_position(number, 100) if number > 99
        tens = SpeechModule.number_on_position(number, 10)
        single = SpeechModule.number_on_position(number, 1)
 
        answer << @low[hundred - 1] + " hundred" if hundred

        low = (tens * 10) + single
        if low > 0
            if low > 19
                answer << @tens[tens - 2]
                answer << @low[single - 1] if single > 0
            else
                answer << @low[tens * 10 + single - 1]
            end
        end

        answer.join(' ')
    end

    def self.number_on_position(num, pos)
        ((num % (pos * 10)) - num % pos) / pos
    end
end
