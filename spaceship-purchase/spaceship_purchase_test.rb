require 'minitest/spec'
require 'minitest/autorun'

require_relative 'spaceship_purchase'


describe SpaceShipPurchase do


    it "Example 1" do
        purchase = SpaceShipPurchase.new(customer_start: 150, customer_raise: 50, 
                                         driver_start: 1000, driver_reduce: 100)

        purchase.final_price.must_equal 450
    end

    it "Example 2" do
        purchase = SpaceShipPurchase.new(customer_start: 150, customer_raise: 50,
                                         driver_start: 900, driver_reduce: 100)

        purchase.final_price.must_equal 400
    end

 
end
