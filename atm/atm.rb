class ATM 
    attr_reader :balance

    def initialize(balance)
        @balance = balance
    end

    def withdraw(amount)
        amount = Array(amount) unless amount.kind_of?(Array)
        amount.each { |amount| draw(amount) }
    end

    def commision(amount)
        (0.5 + (amount * 0.1)).floor
    end

 private
    def draw(amount)
        @balance -= amount if valid_amount?(amount) 
    end

    def valid_amount?(amount)
        amount % 5 == 0 && (amount + commision(amount)) < @balance
    end
end
