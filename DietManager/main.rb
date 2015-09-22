#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 20th 2015
#Main

require './food_db.rb'
require './recipe.rb'
require './basic_food'

class Main

  puts 'Diet Manager System\n'
  puts 'The commands suported are:'
  puts "print 'name' - This command will print the basic food or recipe stored in the database"
  puts "find 'prefix' - This command will print the basic food or recipe stored in the database that starts with the given prefix"
  puts 'print all - This command will print all the elements within the database'
  puts 'quit - This command will simply quit the program'

  loop do
    input = $stdin.gets.chomp
    command = input.split(/ +/)

    dataBaseObject = FoodDatabase.new
    foodDB(dataBaseObject)

    if(command[0] == 'print')
      if (command[1] == 'all')
        dataBaseObject.to_s
      else
        # Once the word 'print' was identified, the program don't need it anymore. So it will convert the rest of the positions
        # into an string separated by space.
        command.delete_at(0)
        name = command.join(' ')
        dataBaseObject.printByName(name)
      end
    elsif(command[0] == 'quit')
      abort('The program ended, thanks!')
    elsif(command[0] == 'find')
      prefix = command[1]
      dataBaseObject.findByPrefix(prefix)
    else
      message = command.join(' ')
      puts "#{message} is not a valid command, please try it again."
    end
  end
end