#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 28th 2015
#Class LogItem

require 'date'

class LogItem

  private

  def initialize(foodName, date)
    @name = foodName
    @date = date
  end

  public

  attr_reader :name,:date
end