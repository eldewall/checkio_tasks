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
        hundred  = (number / 100) - 1 if number >= 100
        
        answer = ''
        answer += @low[hundred] + @hundred if hundred
        

        answer
    end
end
