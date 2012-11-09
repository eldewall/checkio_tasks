require 'minitest/spec'
require 'minitest/autorun'

require_relative 'speech_module'

describe SpeechModule do

    describe "interpret" do

        before { @module = SpeechModule.new }

        it "converts number to string representation" do
            @module.interpret(10).must_equal "one hundred twenty three"
        end
    end
end
