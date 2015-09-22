#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 20th 2015
#Class Recipe

require './food_db.rb'

class Recipe

  private

  def initialize(name, ingredients)
    @fullCalories = 0
    @name = name
    @ingredients = ingredients
  end

  public

  attr_accessor :name, :ingredients

  #Loop iterating to return the total calories based on the ingredients of the recipe
  def printFullCalories
    @ingredients.each_index do |i|
      subArray = @ingredients[i]
      subArray.each_index do |j|
        if String(j) == "1"
          @fullCalories += @ingredients[i][j] * @ingredients[i][j+1]
        end
      end
    end
    @fullCalories
  end

  def printIngredients
    @ingredients.each_index do |i|
      subArray = @ingredients[i]
      subArray.each_index do |j|
        #This if assures that it will be printed only one time per subarray
        if String(j) == "0"
          #It verifies the multiple ingredient
          if @ingredients[i][j+2] == 2
            #If the ingredient is multiple, the algorithm below prints in the required way
            puts "  " + "#{@ingredients[i][j]}" + " (" + "#{@ingredients[i][j+2]}" +") " + "#{@ingredients[i][j+1] * @ingredients[i][j+2]}"
          else
            #Otherwise, it prints normally
            puts "  " + "#{@ingredients[i][j]}" + " " + "#{@ingredients[i][j+1]}"
          end
        end
      end
    end
    print "\n"
  end
  # End of the Recipe class #
end
