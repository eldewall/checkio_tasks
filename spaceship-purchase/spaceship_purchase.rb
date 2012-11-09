class SpaceShipPurchase

    def initialize(values)
        @customer_start = values[:customer_start]
        @customer_raise = values[:customer_raise]
        @driver_start   = values[:driver_start]
        @driver_reduce  = values[:driver_reduce]
    end


    def final_price
        while (@customer_start < @driver_start) do
           @customer_start += @customer_raise
           @driver_start   -= @driver_reduce
        end
        
        @customer_start
    end

end
