#Jonathan Correia de Barros
#September 14th 2015
#File created in order to run an unit test the class 'line.rb'

require 'test/unit'
require './line.rb'
require './point.rb'

class TestLine < Test::Unit::TestCase 

	def setup
		@line = Line.new(Point.new(2,4),Point.new(10,4))
	end

	def teardown

	end

	def test_length_method
		assert_equal(8,@line.length)
		assert_equal(10,@line.length)
	end

	def test_null
		assert_not_nil(@line)
	end
end

