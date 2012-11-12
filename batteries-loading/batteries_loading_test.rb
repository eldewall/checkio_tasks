require 'minitest/spec'
require 'minitest/autorun'

require_relative 'batteries_loading'

describe BatteryLoader do

    describe "balance" do

        it "example 1" do
            BatteryLoader.balance([10,10]).must_equal 0
        end

        it "xample 5" do
            BatteryLoader.balance([5, 8, 13, 27, 14]).must_equal 3
        end

        it "example 2" do
            BatteryLoader.balance([12, 30, 30, 32, 42, 49]).must_equal 9
        end
 
        it "example 3" do
            BatteryLoader.balance([1,1,1,3]).must_equal 0
        end

        it "example 4" do
            BatteryLoader.balance([5,5,6,5]).must_equal 1
        end
    end


    describe "sum" do

        it "returns 0 if array is empty" do
            BatteryLoader.sum([]).must_equal 0
        end

        it "blah" do 
            BatteryLoader.sum([10]).must_equal 10
        end
    end



    describe "diff" do
        it "x " do
            BatteryLoader.diff([10], [10]).must_equal 0
        end
        it "calculates difference of arrays" do
            BatteryLoader.diff([10,20], [10,10]).must_equal 10
        end

        it "calculates right when right arg2 is larger" do
            BatteryLoader.diff([1], [29, 30]).must_equal 58
        end
    end

end
