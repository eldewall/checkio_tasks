require 'minitest/spec'
require 'minitest/autorun'

require_relative 'atm'

describe ATM do

    it "has a starting balance" do
        balance = 10
        atm = ATM.new(balance)
        atm.balance.must_equal balance
    end 

    describe "task examples" do
        before do
            @atm = ATM.new(120)
        end

        it "example 1" do
            @atm.withdraw([10,20,30])
            @atm.balance.must_equal 57
        end

        it "example 2" do
            @atm.withdraw([200, 10])
            @atm.balance.must_equal 109
        end

        it "example 3" do
            @atm.withdraw([3, 10])
            @atm.balance.must_equal 109
        end

        it "example 4" do
            @atm.withdraw([200, 119])
            @atm.balance.must_equal 120
        end

        it "example 5" do
            @atm.withdraw([120, 10, 122, 2, 10, 10, 30, 1])
            @atm.balance.must_equal 56
        end
    end

    describe "withdraw" do
        before do
            @start_balance = 100
            @atm = ATM.new(@start_balance)
        end

       
        it "should reject amounts not divisible with 5" do
            @atm.stub(:commision, 0) do
                @atm.withdraw(11)
                @atm.balance.must_equal @start_balance
            end
        end

        it "should accept amounts divisbile with 5" do
            @atm.stub(:commision, 0) do
                @atm.withdraw(30)
                @atm.balance.must_equal @start_balance - 30
            end
        end

        it "can not withdraw beyond current balance" do
            current = @atm.balance
            @atm.withdraw(current + 10)
            @atm.balance.must_equal current
        end

        it "withdraws corrent" do
            atm = ATM.new(120)
            atm.withdraw(10)
            atm.balance.must_equal 109
        end

        it "should handle a array of amounts" do
            @atm.stub(:commision, 0) do
                @atm.withdraw([10, 20])
                @atm.balance.must_equal @start_balance - 30
            end
        end

        describe "commision" do
            
            it "should be 0.5 minus once percent of amount" do
                @atm.commision(100).must_equal (0.5 + (100 * 0.01))
            end

            it "should not withdraw if amount + commision exceeds balance" do
                @atm.stub(:commision, 11) do
                    @atm.withdraw(110)
                    @atm.balance.must_equal @start_balance
                end
            end

            it "should withdraw commision" do
                amount = 5
                commision = @atm.commision(amount)
                @atm.withdraw(amount)
                @atm.balance.must_equal((@start_balance - amount - commision).floor)
            end
        end
    end
end
