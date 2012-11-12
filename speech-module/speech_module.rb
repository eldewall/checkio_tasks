class SpeechModule
    
    def initialize
        @low = ["one", "two", "three", "four", "five", "six", "seven", "eight",
                "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                "sixteen", "seventeen", "eighteen", "nineteen"]

        @tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty",
                 "ninety"]

        @hundred = " hundred "
        @thousand = "thousand"
    end


    def interpret(number)
        return "one thousand" if number == 1000

        answer = []
        
        hundred = SpeechModule.number_on_position(number, 100) if number > 99
        answer << @low[hundred - 1] + " hundred" if hundred
       
        tens = SpeechModule.number_on_position(number, 10) if number > 20
        answer << @tens[tens - 2] if tens

        single = SpeechModule.number_on_position(number, 1)
        answer << @low[single -1] if single > 0

        answer.join(' ')
    end

    def self.number_on_position(num, pos)
        ((num % (pos * 10)) - num % pos) / pos
    end
end
