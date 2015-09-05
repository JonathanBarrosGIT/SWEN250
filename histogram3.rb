##
# Author: Jonathan Correia de Barros
# Class: SWEN 250 - Personal Software Engineering
# Histogram 3
#

require 'pp'


#def longestWord(theHash)
#
#  return theHash.max_by{|k,v| k}
#
#  #return longest
#  #theArray.sort_by!(&:length)
#  #return theArray[0]
#end

# The function histogram3 receives the file name and then processes
# the steps according to what the assignment asked

def histogram3()

  #Creating the Hash Table#
  bag = Hash.new(0)

  $stdin.each do |line|
    line.chomp!
    line.downcase!
    line.gsub!(/[^a-zA-Z\s]/, '')
    line.sub!(/^\s+/, '')
    words = line.split(/ +/)
    words.each { |value| bag[value] += 1 }
  end

  #Printing each hash element per line
  #bag.each do |key, value|
  #  print key + ' ' + "#{value}" + "\n"
  #end

  # Inserting the keys and values from the Hash into the array based on the condition "At least two occurrences"
  selectedWords = bag.select{|key,value| value >= 2}.to_a
  #longest = longestWord bag

  #Sorting the elements, the counts in the order of highest to lowest and the words in alphabeticaly order
  selectedWords.sort_by!{|words,counts| [-counts, words]}
  print selectedWords
  print "\n"

  #selectedWords.inject(0)

  #longestWord = selectedWords.inject do |memo, word|
  #  memo.length < word.length ? memo : word
  #end

  #longest = selectedWords.inject(0){|word, count| }
  #end

  #longest = selectedWords.flatten
  #longest = selectedWords.sort_by{|x,y| x.length}.reverse



  #longest = longest.inject do |memo, word|
  #  memo.length < word.length ? memo : word
  #end

  #longestWord = selectedWords.max{|words,counts| words.reverse <=> counts.reverse}

  #longest = longestWord[1]

  #longest = longestWord selectedWords
  #puts longest.collect{|ind| ind[[0,0]]}

  longest = 10
  selectedWords.each do | apair |
    printf "%-*.*s ", longest, longest, apair[0]
    puts "*" * apair[1]
  end
end

# Main #
histogram3
