#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 22nd 2015
#File created in order to run the unit test at the class 'BasicFood or basic_food.rb'

require 'test/unit'
require './recipe.rb'
require './basic_food.rb'
require './food_db.rb'

class TestRecipe < Test::Unit::TestCase

  def setup
    @recipeToTest = Recipe.new("Egg Sandwich",[["Egg", 78, 1],["Cheese",69,1]])
  end

  def teardown

  end

  def test_accessors
    #This one is supposed to work
    assert_equal("Egg Sandwich", @recipeToTest.name)
    #This one is supposed to work
    assert_equal("Egg", @recipeToTest.ingredients[0][0])
    #This one is supposed to fail
    assert_equal("Egg", @recipeToTest.ingredients[0][1])
  end
end