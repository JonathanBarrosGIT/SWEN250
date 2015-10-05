# Script that obtains various git metrics from a basic git log file
# Jonathan Correia de Barros
# Oct 4th 2015

require 'set'
require 'date'

# Given an array of git log lines, count the number of commits in the log
def num_commits(lines)

  counts = 0
  lines.each do |value|
    array = value.split(' ')
    if(array[0] == 'commit')
      counts += 1
    end
  end
  return counts
end

# Given an array of git log lines, count the number of different authors
#   (Don't double-count!)
# You may assume that emails make a developer unique, that is, if a developer
# has two different emails they are counted as two different people.
def num_developers(lines)

  counts = Hash.new(0)
  lines.each do |value|
    array = value.split(' ')
    if(array[0] == 'Author:')
      counts[array.last] += 1
    end
  end
  return counts.length

end

# Given an array of Git log lines, compute the number of days this was in development
# Note: you cannot assume any order of commits (e.g. you cannot assume that the newest commit is first).
def days_of_development(lines)
  dates = Array.new

  lines.each do |value|
    if(value.include?('Date:'))
      dates << Date.parse(value.gsub('Date:',''))
    end
  end

  if(dates.size == 0)
    return 0
  else
    dates.sort!
    return dates.last.mjd - dates.first.mjd + 1

  end


  # first = Soonest date
  # last = furthest date
  # mjd = Modified Julian Date (Number of days between two dates)
  # +1 = After obtained the difference, add the current day



end

# This is a ruby idiom that allows us to use both unit testing and command line processing
# Does not get run when we use unit testing, e.g. ruby test_git_metrics.rb
# These commands will invoke this code with our test data: 
#    ruby git_metrics.rb < ruby-progressbar-short.txt
#    ruby git_metrics.rb < ruby-progressbar-full.txt
if __FILE__ == $PROGRAM_NAME
  lines = []
  $stdin.each { |line| lines << line }
  puts "Number of commits: #{num_commits lines}"
  puts "Number of developers: #{num_developers lines}"
  puts "Number of days in development: #{days_of_development lines}"
end

