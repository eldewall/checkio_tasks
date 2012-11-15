require 'minitest/spec'
require 'minitest/autorun'

require_relative 'ciphermap'

describe CipherMap do

    before do
        @map = [
            'X...',
            '..X.',
            'X..X',
            '....'
        ]

        @rotated = [
            '.X.X',
            '....',
            '..X.',
            '.X..'
        ]

        @cipher = [
            'itdf',
            'gdce',
            'aton',
            'qrdi'
        ]
    end

    it "can rotate matrix" do
        CipherMap.rotate(@map).must_equal @rotated
    end

    it "decipher, without rotation" do
        CipherMap.decipher(@map, @cipher).must_equal 'ican' 
    end

    it "can solve entire cipher" do
        CipherMap.solve(@map, @cipher).must_equal 'icantforgetiddqd'
    end
end



