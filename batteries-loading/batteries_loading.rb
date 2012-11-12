class BatteryLoader

    def self.best_of(batteries)
        right = []
        left = []
        best = batteries.inject(:+)

        batteries.length.times do |i|
            right = Array.new(batteries)
            left = right.slice!(i, 1)

            puts "l_start:" + left.to_s
            puts "r_start:" + right.to_s

            diff = BatteryLoader.diff(left, right)
            best = diff if diff <= best

            num = right.length

            puts "num_times:" + num.to_s

            num.times do |x|
                left.concat(right.slice!(0, 1))
                puts "l:" + left.to_s
                puts "r:" + right.to_s

                diff = BatteryLoader.diff(left, right)

                best = diff if diff <= best
            end
        end

        best
    end

    def self.balance(batteries)

        first = self.best_of(batteries)
        second = self.best_of(batteries.reverse())

        first <= second ? first : second
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
