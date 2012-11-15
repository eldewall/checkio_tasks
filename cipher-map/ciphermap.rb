class CipherMap

    def self.rotate(matrix)
        res = Array.new(matrix.length) { Array.new(matrix.length) }
        len = matrix.length - 1

        0.upto(len) { |n| len.downto(0) { |i| res[n][len-i] = matrix[i][n] } }

        res.map(&:join)
    end

    def self.solve(map, cipher)
        answer = ''
        4.times do 
            answer += self.decipher(map, cipher)
            map = self.rotate(map)
        end

        answer
    end

    def self.decipher(map, cipher)
        res = ''    
        map.length.times do |i|
            map.length.times do |x|
                res += cipher[i][x] if map[i][x] == 'X'       
            end
        end           

        res
    end

end
