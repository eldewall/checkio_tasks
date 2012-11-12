def checkio(number):
    if number == 1000: return 'one thousand' 
    if number == 0: return 'zero'
    
    answer = []

    lows = { 
            1 : "one", 2 : "two", 3 : "three", 4 : "four",
            5 : "five", 6 : "six", 7 : "seven", 8 : "eight",
            9 : "nine", 10 : "ten", 11 : "eleven", 12 : "twelve",
            13 : "thirteen", 14 : "fourteen", 15 : "fifteen",
            16 : "sixteen", 17 : "seventeen", 18 : "eighteen", 
            19 : "nineteen"
          }

    tens = { 20 : "twenty", 30 : "thirty", 40 : "forty" , 50 : "fifty",
             60 : "sixty", 70 : "seventy", 80 : "eighty", 90 : "ninty" }
   
    hundreds = number_on_pos(number, 100)
    ten = number_on_pos(number, 10)
    single = number_on_pos(number, 1)
    
    if hundreds > 0: answer.append(lows[hundreds] + " hundred")

    low = ten * 10 + single
    
    if low > 0:
        if low < 20: 
            answer.append(lows[low])
        else:
            answer.append(tens[ten * 10])
            if single > 0: answer.append(lows[single])

    return ' '.join(str(x) for x in answer)

def number_on_pos(num, pos):
    return ((num % (pos * 10)) - num % pos) / pos
 
if __name__ == '__main__':
        assert checkio(4) == 'four', "First"
        assert checkio(133) == 'one hundred thirty three', "Second"
        assert checkio(12)=='twelve', "Third"
        assert checkio(101)=='one hundred one', "Fifth"
        assert checkio(212)=="two hundred twelve", "Sixth"
        assert checkio(40)=='forty', "Seventh, forty - it is correct"
        assert checkio(10) == 'ten', "extra 2"
        assert checkio(200) == 'two hundred', "extra 3"
        print('All ok')
