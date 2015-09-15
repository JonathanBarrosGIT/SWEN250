#Jonathan Correia de Barros
#September 14th 2015
#File created in order to run an unit test the class 'circle.rb'

require 'test/unit'
require './circle.rb'
require './point.rb'

class TestCircle < Test::Unit::TestCase 

	def setup
		@circle = Circle.new(Point.new(2,4),Point.new(10,4))
	end

	def teardown

	end

	def test_diameter_method
		assert_equal(8, @circle.diameter)
	end

	def test_circumference_method
		assert_equal(8, @circle.circumference)
	end

	def test_area_method
		assert_equal(8, @circle.area)
	end
end

