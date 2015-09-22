#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 22nd 2015
#File created in order to run the unit test at the class 'BasicFood or basic_food.rb'

require 'test/unit'
require './recipe.rb'
require './basic_food.rb'
require './food_db.rb'

class TestBasicFood < Test::Unit::TestCase

  def setup
    @foodToTest = BasicFood.new("Apple", 95)
  end

  def teardown

  end

  def test_accessors
    #This one is supposed to work
    assert_equal("Apple", @foodToTest.name)
    #This one is supposed to fail
    assert_equal(70, @foodToTest.calories)
  end


end