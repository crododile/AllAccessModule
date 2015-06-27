require 'minitest/autorun'
require_relative 'attrrs.rb'

describe NoAccessor do
  before do
    @testObject = NoAccessor.new
  end

  describe "set instance variables set in initializer" do
    it "creates readers" do
      @testObject.test.must_equal "testy"
    end
    describe "writing" do
      it "can write a string" do
        @testObject.test = "toosty"
        @testObject.test.must_equal "toosty"
      end
      
      it "can write a number" do
        @testObject.test = 50
        @testObject.test.must_equal 50
      end
      
      it "can write a method result" do
        @testObject.test = ["a"] << 10
        @testObject.test.must_equal ["a",10]
      end
    end
  end

end