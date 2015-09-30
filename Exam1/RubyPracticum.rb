# Ruby Practicum (Exam 1)
# Larry Kiser
# 9/29/2015

#9/30/2015
#Jonathan Correia de Barros

# NOTE: To get full credit your code MUST pass the unit tests that
# are already defined in UnitTestRubyPracticum.rb.
# You MUST NOT modify the provided unit tests in UnitTestRubyPracticum.rb.
# You may TEMPORARILY disable an assert in a unit test until you have implemented that feature.

################## DO THIS FIRST ##############################
# Complete this class that stores the three jump distances.
# You must accept an array of three distances in the jumps parameter
# for the initialize method.
class ContestantStatistics
	# Fill in the initialize method.
	# jumps is an array of three numbers for the three attempts.
	# Values in jumps array range from 0.0 to 10.0 but you can assume it only contains valid values.
	# You can also assume that it always has exactly 3 jump distances.
	# I recommend that you do the calculations here for the values required by the accessors.
	def initialize( jumps )
		@jumps = jumps
		@longest = @jumps.max
		@average = @jumps.inject{ |sum, el| sum + el }.to_f / @jumps.size
	end


	
	# Using the best type of accessor add two accessors that do the following:
	
	# 1. Return the longest jump. It MUST be called longest
	
	# 2. Return the average jump. It MUST be called average

	attr_reader :longest, :average

end

# Complete this class that stores a Hash of ContestantStatistics objects using
# the contestant name as the key.
# You MUST use a Hash to get full credit.
# You MUST use that method parameters as described.
class EventStatistics
	def initialize
		@contestants = Hash.new(0)
	end
	
	# Make the following methods public
	
	# Fill in this method to add a ContestantStatistics instance to the hash.
	# name is a string that is the contestant's name.
	# jumps is an array of three numbers for the three attempts.
	# Values in jumps array range from 0.0 to 10.0 but you can assume it only contains valid values.
	# You can also assume that it always has exactly 3 jump distances.
	def add( name, jumps )
		addition = {name => ContestantStatistics.new(jumps)}
		@contestants.merge!(addition)
	end
		
	# Create a method to return the name of the winner
	def getWinner()
		winner =  @contestants.max_by{|k,v| v.longest}
		return winner[0]

		#@contestants.each do |key,value|
			#winnerName = key
			#winnerLongest = value.longest
			#if(value.longest > winnerLongest)
			#	winnerName = key
			#	winnerLongest = value.longest
			#end
		#end
		#winnerName
		#@contestants.sort_by!{|name,jumps.longest| [name, jumps.longest]}
		#puts @contestants

	end
	
	# Create a method to return the number of contestants in the event
	def numberOfContestants
		@contestants.length
	end
	
	# Create a method that gets the best distance for the requested contestant

	def getLongest( name )
		@contestants.each do |key,value|
			if(key == name)
				return value.longest
			end
		end
	end
end
