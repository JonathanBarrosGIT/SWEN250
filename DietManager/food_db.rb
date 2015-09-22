#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 20th 2015
#Class Food Database

require './basic_food.rb'
require './recipe.rb'
#require 'pp'

#Object created in order to build up the internal Database
class FoodDatabase

  private

  def initialize()
    @food_list = Array.new(0)
    @recipe_list = Array.new(0)
  end

  public

  attr_reader :food_list, :recipe_list

  #This method add the food into the internal database
  def addFood(theFoodToBeAdded)
    @food_list << theFoodToBeAdded
  end

  #This method add the recipe into the internal database
  def addRecipe(theRecipeToBeAdded)
    recipe_list << theRecipeToBeAdded
  end

  #This method returns the amount of calories upon the food's name
  def getCalories(foodName)
    @food_list.each do |value|
      if value.name === foodName
        return value.calories.to_i
      end
    end
  end

  #This method look for the given name within the two lists (food and recipes) and print their information if found.
  def printByName(name)
    #Count variable created to make sure if any food or recipe with the given name has been found
    count = 0

    @food_list.each do |value|
      if value.name == name
        puts value.name + ' ' + value.calories
        count += 1
      end
    end

    @recipe_list.each do |value|
      if value.name == name
        puts value.name + ' ' + "#{value.printFullCalories}"
        print value.printIngredients
        count += 1
      end
    end
    if count == 0
      puts 'There is no such food or recipe in the database'
    end
  end

  # Class very similar to the previous one once the output is exactly the same.
  # However, this class looks for the prefix in the beginning of either food or recipe
  def findByPrefix(prefix)
    #Count variable created to make sure if any food or recipe with the given name has been found
    count = 0
    @food_list.each do |value|
      if value.name.downcase.start_with? prefix.downcase
        puts value.name + ' ' + value.calories
        count += 1
      end
    end

    @recipe_list.each do |value|
      if value.name.downcase.start_with? prefix.downcase
        puts value.name + ' ' + "#{value.printFullCalories}"
        print value.printIngredients
        count += 1
      end
    end
    if count == 0
      puts 'There is no such food or recipe in the database'
    end
  end

  def to_s
    @food_list.each do |value|
      puts value.name + ' ' + value.calories
    end

    print "\n"

    recipe_list.each do |value|
      puts value.name + ' ' + "#{value.printFullCalories}"
      value.printIngredients
    end
  end
end
# *********** End of Class FoodDatabase *********** #

#Method created to receive the document and then process it as a basic food or recipe
def foodDB(foodDatabase)

  words = Array.new(0)

  File.open("FoodDB.txt", "r") do |f|
    f.each_line do |line|
      line.chomp!
      words = line.split(',')

      # When the line is a basic food, the program will run the following steps:
      # It will put a BasicFood object(name = words[0] and calories = words[2]) into the FoodDatabase object
      if words[1] === "b"
        foodDatabase.addFood(BasicFood.new(words[0],words[2]))

        # When the line is a recipe, the program will run the following steps:
        # It will store the recipe's name in a variable to be used furtherly
        #	It will delete the positions of the array that contain the name and the letter 'r'
      elsif words[1] === "r"
        name = words[0].to_s
        words.delete_at(0)
        words.delete_at(0)

        #Using this hash, the program counts how often the same ingredient appears in the same recipe
        recipes = Hash.new(0)
        words.each {|value| recipes[value] += 1}

        #Array created to be used in the recipe instantiation, it will be an array of arrays
        arrayOfIngredients = Array.new(0)


        #The array of ingredients will follow the pattern: 
        #[0] = name of ingredient, [1] = ingredient's calorie, [2] = frequency of the ingredient, ...
        recipes.each do |key, value|
          arrayOfIngredients << [key,foodDatabase.getCalories(key), value]
        end

        foodDatabase.addRecipe(Recipe.new(name, arrayOfIngredients))
      end
    end
  end
end # End of the method FoodDB #










