#Ruby Diet Manager
#Jonathan Correia de Barros
#Sept 20th 2015
#Class Basic Food

class BasicFood

  private

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  public

  attr_accessor :name, :calories

  def to_s
    "#{name} #{calories}"
  end
end