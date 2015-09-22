#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 20th 2015
#Main

require './food_db.rb'
require './recipe.rb'
require './basic_food'

class Main

  puts "Diet Manager System\n"
  puts "The commands suported are:"
  puts "print all - This command will print all the elements within the database"
  puts "quit - This command will simply quit the program"

  loop do
    command = gets.chomp
    dataBaseObject = FoodDatabase.new
    foodDB(dataBaseObject)

    case command
      when "print all"
        dataBaseObject.to_s
      when "quit"
        abort("The program ended, thanks!")
      else
        puts "#{command} is not a valid command, please try it again."
    end
  end
end