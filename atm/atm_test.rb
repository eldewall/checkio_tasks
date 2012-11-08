require 'minitest/spec'
require 'minitest/autorun'

require_relative 'atm'

describe ATM do

    it "has a starting balance" do
        balance = 10
        atm = ATM.new(balance)
        atm.balance.must_equal balance
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
                @atm.withdraw(10)
                @atm.balance.must_equal @start_balance - 10
            end
        end

        it "can not withdraw beyond current balance" do
            current = @atm.balance
            @atm.withdraw(current + 10)
            @atm.balance.must_equal current
        end

        it "should handle a array of amounts" do
            @atm.stub(:commision, 0) do
                @atm.withdraw([10, 20])
                @atm.balance.must_equal @start_balance - 30
            end
        end

        describe "commision" do
            
            it "should be 0.5 minus once percent of amount" do
                @atm.commision(5).must_equal 1
                @atm.commision(100).must_equal (0.5 + (100 * 0.1)).floor
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
                @atm.balance.must_equal(@start_balance - amount - commision)
            end
        end
    end
end
