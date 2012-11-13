class BatteryLoader

    def self.best_of(batteries)
        right = [], left = []
        
        best = batteries.inject(:+)

        batteries.length.times do |i|
            right = Array.new(batteries)
            left = right.slice!(i, 1)

            diff = BatteryLoader.diff(left, right)
            best = diff if diff <= best

            right.length.times do
                left.concat(right.slice!(0, 1))
                diff = BatteryLoader.diff(left, right)
                best = diff if diff <= best
            end
        end

        best
    end

    def self.balance(batteries)
        a = self.best_of(batteries)
    end

    def self.sum(arr)
        if  arr.length == 1
            arr[0]
        elsif arr.length == 0
            0
        else
            arr.inject(:+)
        end

    end

    def self.diff(arr1, arr2)
        a1_sum = BatteryLoader.sum(arr1)
        a2_sum = BatteryLoader.sum(arr2)

        sum = (a1_sum - a2_sum).abs
    end
end
