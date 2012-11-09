require 'minitest/spec'
require 'minitest/autorun'

require_relative 'house_password'

describe HousePassword do

    describe "Strong Password" do

        before do
            @strong = HousePassword.new("QwErTy911poqqqq")
            @short = HousePassword.new("A1213pokl")

        end

        it "has a length of 10 or greater" do
            @strong.valid_length?.must_equal true
            @short.valid_length?.must_equal false
        end

        it "has one digit" do
            valid = HousePassword.new("1")
            valid.has_one_digit?.must_equal true

            invalid = HousePassword.new("a")
            invalid.has_one_digit?.must_equal false
        end

        it "has one upper case letter" do
            valid = HousePassword.new("Abcde")
            valid.has_one_upper?.must_equal true

            invalid = HousePassword.new("abcde")
            invalid.has_one_upper?.must_equal false
        end

        it "has one lower case letter" do
            valid = HousePassword.new("XXX1123c")
            valid.has_one_lower?.must_equal true

            invalid = HousePassword.new("XXXXXX99")
            invalid.has_one_lower?.must_equal false
        end
    end

    describe "Task examples" do

        it "passes example 1" do
            a = HousePassword.new('A1213pokl')
            a.valid?.must_equal false
        end
        
        it "passes example 2" do
            a = HousePassword.new('bAse730onE')
            a.valid?.must_equal true
        end

        it "passes example 3" do
            a = HousePassword.new('asasasasasasasaas')
            a.valid?.must_equal false
        end

        it "passes example 4" do
            a = HousePassword.new('QWERTYqwerty')
            a.valid?.must_equal false
        end

        it "passes example 5" do
            a = HousePassword.new('123456123456')
            a.valid?.must_equal false
        end

        it "passes example 5" do
            a = HousePassword.new('QwErTy911poqqqq')
            a.valid?.must_equal true
        end


    end
end



