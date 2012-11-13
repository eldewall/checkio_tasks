class BatteryLoader

    def self.combination_best_of(batteries)
        best = batteries.inject(:+)

        batteries.length.times do |i|
            batteries.combination(i).each do |c|
                left = self.sum(c)
                right = (self.sum(c) - self.sum(batteries)).abs
                diff = (left - right).abs
                best = diff unless diff > best
            end
        end

        best
    end

    def self.balance(batteries)
        x = self.combination_best_of(batteries)
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
end

