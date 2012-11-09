require 'minitest/spec'
require 'minitest/autorun'

require_relative 'has_down_case_validator'

describe HasDownCaseValidator do

    describe "valid" do
        before do
            @validator = HasDownCaseValidator.new
            @valid_str = "abBb0"
        end

        it "it should be valid when a digit has been passed to it" do
            @valid_str.chars.to_a.each { |c| @validator.validate(c) }
            @validator.valid?.must_equal true
        end

        it "should be false when wrong number characters has been passed" do
            "XXX000YYY".chars.to_a.each { |c| @validator.validate(c) }
            @validator.valid?.must_equal false
        end
    end
end

