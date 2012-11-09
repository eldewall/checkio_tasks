require 'minitest/spec'
require 'minitest/autorun'

require_relative 'length_validator'

describe LengthValidator do

    describe "valid" do
        before do
            @valid_length = 10
            @validator = LengthValidator.new(@valid_length)
            @valid_str = "0987654abc"
        end

        it "should be true when the given number of characters has been passed" do
            @valid_str.chars.to_a.each { |c| @validator.validate(c) }
            @validator.valid?.must_equal true
        end

        it "should be false when wrong number characters has been passed" do
            "123ba23".chars.to_a.each { |c| @validator.validate(c) }
            @validator.valid?.must_equal false
        end
    end
end

