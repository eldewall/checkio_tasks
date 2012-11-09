require 'minitest/spec'
require 'minitest/autorun'

require_relative 'house_password'

describe HousePassword do


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



