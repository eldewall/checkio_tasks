require 'minitest/spec'
require 'minitest/autorun'

require_relative 'batteries_loading'

describe BatteryLoader do

    describe "balance" do
        it "balances equals" do
            BatteryLoader.balance([10, 10]).must_equal 0
        end

        it "example 2" do
            BatteryLoader.balance([10]).must_equal 10
        end

        it "example 3" do
            BatteryLoader.balance([5, 8, 13, 27, 14]).must_equal 3
        end
    end
end
