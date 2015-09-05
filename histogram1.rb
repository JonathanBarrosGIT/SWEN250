##
# Author: Jonathan Correia de Barros
# Class: SWEN 250 - Personal Software Engineering
# Histogram 1
#

# The function histogram1 receives the file name from the command line and then processes
# the steps according to what the assignment asked

def histogram1()
  $stdin.each do |line|
   line.chomp!
   line.downcase!
   line.gsub!(/[^a-zA-Z\s]/, '')
   line.sub!(/^\s+/, '')
   puts line
  end
end

# Calling the function #
histogram1
