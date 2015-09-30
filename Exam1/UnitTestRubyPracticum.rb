# Ruby Practicum
# Larry Kiser
# 9/29/2015

#9/30/2015
#Jonathan Correia de Barros

require 'test/unit'
require './RubyPracticum'

class TestRubyPracticum < Test::Unit::TestCase
  # setup and teardown are included but commented out since
  # every unit test is a standalone test (does not depend on any other test).
  
  # def setup
  # end

  # def teardown
  # end

  # DO NOT MODIFY this unit test!!!!!!!
  # This test verifies that you correctly implemented the ContestantStatistics class.
  # You can TEMPORARILY comment out an assert statement until you have implemented that feature.
  # There will be modest deduction if you submit the unit test with either of these asserts commented out.
  def test1_ContestantStatistics
    contestant = ContestantStatistics.new( [2.0, 2.5, 1.5] )
	assert( contestant.longest == 2.5, "Longest statistic should be 2.5 but it is: #{contestant.longest}" )
	assert( contestant.average == 2.0, "Average statistic should be 2.0 but it is: #{contestant.average}" )
  end
  
  # DO NOT MODIFY this unit test!!!!!!!
  # This test verifies that you correctly implemented the getWinner method in the EventStatistics class.
  # You can TEMPORARILY comment out an assert statement until you have implemented that feature.
  # There will be modest deduction if you submit the unit test with this assert commented out.
  def test2_EventStatistics
	event = EventStatistics.new()
	event.add( 'Larry', [2.0, 2.5, 1.5] )
	event.add( 'Kenn', [4.0, 2.5, 2.5] )
	event.add( 'Andy', [2.0, 2.5, 1.5] )
	assert( event.getWinner == "Kenn", "Winner should be Kenn but is #{event.getWinner}" )
	
 end
 
 # You need to implement two unit tests as described in the comments below.
 def test3_CreateUnitTests
	# DO NOT modify these four lines of code
	event = EventStatistics.new()
	event.add( 'Larry', [2.0, 2.5, 1.5] )
	event.add( 'Kenn', [4.0, 2.5, 2.5] )
	event.add( 'Andy', [2.0, 2.5, 1.5] )
	end
	# write a unit test to get the number of contestants.
	# This should verify that there are exactly 3 contestants based on the above events.
	 def test4_NumberOfContestants
		 event = EventStatistics.new()
		 event.add( 'Larry', [2.0, 2.5, 1.5] )
		 event.add( 'Kenn', [4.0, 2.5, 2.5] )
		 event.add( 'Andy', [2.0, 2.5, 1.5] )
		 assert(event.numberOfContestants == 3, "The number should be 3, but it is #{event.numberOfContestants}")

	 end

 	# write a unit test to verify that the longest distance for Andy is 2.5
	def test5_LongestDistance
		event = EventStatistics.new()
		event.add( 'Larry', [2.0, 2.5, 1.5] )
		event.add( 'Kenn', [4.0, 2.5, 2.5] )
		event.add( 'Andy', [2.0, 2.5, 1.5] )
		assert(event.getLongest('Andy') == 2.5, "The number should be 2.5, but it is #{event.getLongest('Andy')}")
	end
 
end