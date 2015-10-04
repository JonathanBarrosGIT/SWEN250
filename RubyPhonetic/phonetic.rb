# Convert to/from phonetic alphabet
# Jonathan Correia de Barros
# Oct 3rd 2015

#require 'jcode'

class Phonetic

  Letters = [
             ['A', 'ALPHA'],
             ['B', 'BRAVO'],
             ['C', 'CHARLIE'],
             ['D', 'DELTA'],
             ['E', 'ECHO'],
             ['F', 'FOXTROT'],
             ['G', 'GOLF'],
             ['H', 'HOTEL'],
             ['I', 'INDIA'],
             ['J', 'JULIET'],
             ['K', 'KILO'],
             ['L', 'LIMA'],
             ['M', 'MIKE'],
             ['N', 'NOVEMBER'],
             ['O', 'OSCAR'],
             ['P', 'PAPA'],
             ['Q', 'QUEBEC'],
             ['R', 'ROMEO'],
             ['S', 'SIERRA'],
             ['T', 'TANGO'],
             ['U', 'UNIFORM'],
             ['V', 'VICTOR'],
             ['W', 'WHISKEY'],
             ['X', 'XRAY'],
             ['Y', 'YANKEE'],
             ['Z', 'ZULU'],
             ]

  # Translate a word to its phonetic alphabet equivalent
  def self.to_phonetic(word)

    string = String.new

    if(word.kind_of?(Array))
      word = word.join('')
    end

    word.upcase!

    word.each_char do |c|
      Letters.each_index do |i|
        subarray = Letters[i]
        if(subarray.first == c)
          string += subarray.last
        end
      end
      string += ' '
    end
    return string.rstrip
  end

  # Translate a sequence of phonetic alphabet code words 
  # to their alphabetic equivalent
  def self.from_phonetic(str)

    string = String.new

    if(str.kind_of?(String))
      str = str.split(' ')
    end

    str.each {|value| value.upcase!}

    str.each do |value|
      Letters.each_index do |i|
        subarray = Letters[i]
        if(subarray.last == value)
          string += subarray.first
        end
      end
    end
    return string
  end

  # If the line starts with A2P, call to_phonetic on the rest of the substring
  # If the line starts with P2A, call from_phonetic on the rest of the substring
  # Otherwise, return nothing.
  def self.translate(line)
    array = line.split(' ')

    if(array[0] == 'A2P')
      array.delete_at(0)
      to_phonetic(array)
    elsif(array[0] == 'P2A')
      array.delete_at(0)
      from_phonetic(array)
    end
  end

end

# This is ruby idiom that allows us to use both unit testing and command line processing
# This gets run with ruby phonetic.rb
# Does not get run when we use unit testing, e.g. ruby phonetic_test.rb
if __FILE__ == $PROGRAM_NAME
  $stdin.each do |line|
    puts Phonetic.translate(line)
  end
end
