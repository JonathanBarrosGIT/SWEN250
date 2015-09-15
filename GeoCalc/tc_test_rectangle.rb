#Jonathan Correia de Barros
#September 14th 2015
#File created in order to run an unit test the class 'rectangle.rb'

require 'test/unit'
require './rectangle.rb'
require './point.rb'

class TestRectangle < Test::Unit::TestCase 

	def setup
		@rectangle = Rectangle.new(Point.new(2,4),Point.new(10,4))
	end

	def teardown

	end

	def test_width_method
		assert_equal(8, @rectangle.width)
	end

	def test_height_method
		assert_equal(8, @rectangle.height)
	end

	def test_perimeter_method
		assert_equal(8, @rectangle.perimeter)
	end

	def test_area_method
		assert_equal(8, @rectangle.area)
	end
end

