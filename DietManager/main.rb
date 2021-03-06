#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 20th 2015
#Main

require './food_db.rb'
require './log.rb'
require 'date'

class Main

  puts 'Diet Manager System'
  puts 'The commands suported are:'
  puts ''
  puts 'new food name,calories                           - Add a new food into the database'
  puts 'new recipe name,foodName1,foodName2,foodNameN    - Add a new recipe into the database'
  puts "print 'name'                                     - Print the basic food or recipe stored in the database"
  puts 'print all                                        - Print all the elements within the database'
  puts "find 'prefix'                                    - Print the basic food or recipe stored in the database that starts with the given prefix"
  puts "log 'name'                                       - Register a log of 'name' into the database log"
  puts "log 'name,date'                                  - Register a log of 'name' into the database log at the given date"
  puts 'save                                             - Save the current changes into the Data Base File'
  puts 'show all                                         - Print all the log records'
  puts 'show                                             - Print all the log recorded today'
  puts 'show date                                        - Print all the log records at the given date'
  puts 'quit                                             - Exit the program'

  dataBaseObject = FoodDatabase.new
  foodDB(dataBaseObject)
  logObject = Log.new

  loop do

    input = $stdin.gets.chomp
    command = input.split(/ +/)

    if(command[0] == 'print')
      if (command[1] == 'all')
        dataBaseObject.to_s
      else
        command.delete_at(0)
        name = command.join(' ')
        dataBaseObject.printByName(name)
      end
    elsif(command[0] == 'show')
      if(command[1] == 'all')
        logObject.showAll
      # In case the user types only 'show'
      elsif(command[1] == nil)
        logObject.show(Date.today)
      # In case the user types 'show date'
      else
        #Converting the String within the index 1 of the array into an array of 3 numbers (month,day and year)
        date = command[1].split('/')
        logObject.show(Date.new(date[2].to_i,date[0].to_i,date[1].to_i))
      end
    elsif(command[0] == 'log')
      command.delete_at(0)

      nameAndDate = command.join(' ') # Array into String
      nameAndDate = nameAndDate.split(',')  # String into Array

      if(nameAndDate[1] == nil)
        logObject.addLog(dataBaseObject,nameAndDate[0],Date.today)
      else
        onlyDate = nameAndDate[1].split('/')
        logObject.addLog(dataBaseObject,nameAndDate[0],Date.new(onlyDate[2].to_i,onlyDate[0].to_i,onlyDate[1].to_i))
      end
    elsif(command[0] == 'delete')
      command.delete_at(0)
      nameAndDate = command.join(' ') # Array into String
      nameAndDate = nameAndDate.split(',') # String into Array
      onlyDate = nameAndDate[1].split('/') # String into Array
      logObject.delete(nameAndDate[0],Date.new(onlyDate[2].to_i,onlyDate[0].to_i,onlyDate[1].to_i))

    elsif(command[0] == 'new')
      if(command[1] == 'food')
        command.delete_at(0) # Deleting the word 'new' from the array
        command.delete_at(0) # Deleting the word 'food' from the array

        nameAndCalories = command.join(' ') # Array into String
        nameAndCalories = nameAndCalories.split(',') # String into Array

        dataBaseObject.newFood(nameAndCalories[0],nameAndCalories[1])
      elsif(command[1] == 'recipe')
        command.delete_at(0)
        command.delete_at(0)

        nameAndIngredients = command.join(' ') # Array into String
        nameAndIngredients = nameAndIngredients.split(',') # String into Array

        recipeName = nameAndIngredients[0]
        nameAndIngredients.delete_at(0) # On this way, it will last only an array with the ingredients

        dataBaseObject.newRecipe(recipeName,nameAndIngredients)
      end
    elsif(command[0] == 'quit')
      if(dataBaseObject.updated > 0)
        puts 'There are changes to be saved'
      else
        abort('The program ended, thanks!')
      end
    elsif(command[0] == 'save')
      dataBaseObject.save
    elsif(command[0] == 'find')
      prefix = command[1]
      dataBaseObject.findByPrefix(prefix)
    else
      message = command.join(' ')
      puts "#{message} is not a valid command, please try it again."
    end
  end
end