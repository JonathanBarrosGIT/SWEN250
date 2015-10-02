#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 28th 2015
#Class Log

require './log_item.rb'
require 'date'

class Log

  private

  def initialize

    @log_list = Array.new(0)

    File.open('DietLog.txt', 'r') do |f|
      f.each_line do |line|
        if(line != nil)
          line.chomp!
          words = line.split(',')
          #Following the pattern 'Name,date(year-month-day)' words[1] = Name and words[0] = date
          @log_list << LogItem.new(words[1],Date.parse(words[0]))
        end
      end
    end
  end

  public

  attr_accessor :log_list

  def addLog(foodDatabase,foodName, date)
    if(foodDatabase.lookByName(foodName))
      @log_list << LogItem.new(foodName, date)
      writeLogIntoFile
    end
  end
  #----------------------------------------------#

  def writeLogIntoFile
    File.open("DietLog.txt","w") do |f|
      @log_list.each do |value|
        f.puts "#{value.date}" + ',' + "#{value.name}"
      end
    end
  end
  #----------------------------------------------#

  def sortByDate
    @log_list.sort!{|a,b| a.date <=> b.date}
  end
  #----------------------------------------------#

  # Print the log database according to the required format
  def showAll
    sortByDate
    @log_list.each do |value|
      puts "#{value.date.mon}" + '/' + "#{value.date.mday}" + '/' + "#{value.date.year}" + "\n  " +
               "#{value.name}"
    end
  end
  #----------------------------------------------#

  # By the given name and date, the program will delete only one record within the database
  def delete(givenName,givenDate)
    @log_list.each do |value|
      if(value.name == givenName && value.date == givenDate)
        @log_list.delete(value)
        writeLogIntoFile
        return 0
      end
    end
  end
  #----------------------------------------------#

  # Print the log database according to the required format
  def show(givenDate)

    hashOfNames = Hash.new(0)
    names = Array.new(0)

    @log_list.each do |value|
      if(value.date == givenDate)
        names << value.name
      end
    end
    #On this way, we will have a hash with the name and its occurrences
    names.each{|value| hashOfNames[value] += 1}

    hashOfNames.each do |key, value|
      if(value > 1)
        puts key + '(' + "#{value}" + ')'
      else
        puts key
      end
    end # End of Hash loop
  end
  #----------------------------------------------#

end # End of the class Log