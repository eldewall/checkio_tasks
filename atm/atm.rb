class ATM 
    attr_reader :balance

    def initialize(balance)
        @balance = balance
    end

    def withdraw(amount)
        Array(amount).each { |amount| draw(amount) }
    end

    def commision(amount)
       0.5 + (amount * 0.01)
    end

    def draw(amount)
        if valid_amount(amount) 
            @balance -= amount + commision(amount)
            @balance = @balance.floor
        end
    end

    def valid_amount(amount)
        amount % 5 == 0 && ((amount + commision(amount)) <= @balance)
    end
end
