#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 22nd 2015
#File created in order to run the unit test at the class 'FoodDatabase or food_db.rb'

require 'test/unit'
require './recipe.rb'
require './basic_food.rb'
require './food_db.rb'

class TestFoodDatabase < Test::Unit::TestCase

  def setup
    @fDataBase = FoodDatabase.new
    foodDB(@fDataBase)

  end

  def teardown

  end

  def test_addFood_method
    #This one is supposed to work
    assert_equal(67, @fDataBase.getCalories("Orange"))
    #This one is supposed to fail
    assert_equal(70, @fDataBase.getCalories("Bread slice"))
  end

  #This test verifies the first position of the food_list array, which is the first element of the FooDB.txt
  # Orange (medium). This Orange is a BasicFood object containing two attributes: name and calories.

  #The first test is supposed to work once the name is correct
  #The second test is supposed to fail once the name obviously is not the same that calories
  def test_accessors
    assert_equal("Orange", @fDataBase.food_list[0].name)
    assert_equal("Orange", @fDataBase.food_list[0].calories)
  end

end