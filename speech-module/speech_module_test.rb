require 'minitest/spec'
require 'minitest/autorun'

require_relative 'speech_module'

describe SpeechModule do

    describe "interpret" do

        before { @module = SpeechModule.new }

        it "converts number to string representation" do
            @module.interpret(123).must_equal "one hundred twenty three"
        end

        it "checkio 1" do
            @module.interpret(4).must_equal "four" 
        end

        it "checkio 2" do
            @module.interpret(133).must_equal "one hundred thirty three"
        end

        it "extra 3" do
            @module.interpret(200).must_equal "two hundred"
        end

        it "checkio 3" do
            @module.interpret(12).must_equal "twelve"
        end

        it "checkio 4" do
            @module.interpret(101).must_equal "one hundred one"
        end

        it "checkio 5" do
            @module.interpret(212).must_equal "two hundred twelve"
        end

        it "checkio 6" do
            @module.interpret(40).must_equal "forty"
        end 
    end

    describe "number_on_position" do

        it "should return 0 on position if nothing is there" do
            expect = 0
            result = SpeechModule.number_on_position(10, 1000)
            result.must_equal expect
        end

        it "should get correct at position 1" do
            expected = 5
            result = SpeechModule.number_on_position(1005, 1)
            result.must_equal expected
        end

        it "should get correct at position 10" do
            expected = 9
            result = SpeechModule.number_on_position(1090, 10)
            result.must_equal expected
        end

        it "should get correct position 100" do
            expected = 8
            result = SpeechModule.number_on_position(1800, 100)
            result.must_equal expected
        end

        it "should get correct position 1000" do
            expected = 1
            result = SpeechModule.number_on_position(1999, 1000)
            result.must_equal expected
        end
    end
end
