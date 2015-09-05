##
# Author: Jonathan Correia de Barros
# Class: SWEN 250 - Personal Software Engineering
# Histogram 2
#

# The function histogram2 receives the file name and then processes
# the steps according to what the assignment asked

def histogram2()

  #Creating the Hash Table#
  bag = Hash.new(0)

  $stdin.each do |line|
    line.chomp!
    line.downcase!
    line.gsub!(/[^a-zA-Z\s]/, '')
    line.sub!(/^\s+/, '')
    words = line.split(/ +/)
    #words.each { | value | puts value }
    words.each { |value| bag[value] += 1 }
  end

  #Printing each hash element per line
  bag.each do |key, value|
    print key + ' ' + "#{value}" + "\n"
  end

  # Inserting the keys and values from the Hash into the array based on the condition "At least two occurrences"
  selectedWords = bag.select{|key,value| value >= 2}.to_a

  print selectedWords
end

# Main #
histogram2

