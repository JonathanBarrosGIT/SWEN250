# Ruby Practice Practicum
# Larry Kiser
# 9/25/2015

# Student: Jonathan Correia de Barros
# 9/27/2015

# NOTE: To get full credit your code MUST pass the unit tests that
# are already defined in UnitTestRubyPractices.rb.
# You MUST NOT modify the provided unit tests.

################## DO THIS FIRST ##############################
# Complete this class that converts an Imperial distance
# that is provided in feet and inches to other units (inches only and centimeters)
# Note -- one inch = 2.54 centimeters.
class DistanceConverter
	# fill in the initialize method
	def initialize( feet, inches )
    @feet = feet
    @inches = inches
  end

  def inches
    return (@feet * 12) + @inches
  end

  def centimeters
    centimeters =  (@feet * 30.48) + (@inches * 2.54)
    return centimeters.round(2)

  end
	
	# add accessors that do the following:
	# 1. return the distance in inches. The accessor must be called inches.
	# 2. return the distance in centimeters. The accessor must be called centimeters

end

# Complete this class that stores a Hash of DistanceConverter objects
class ProjectMeasurements
	def initialize
    @measurements = Hash.new(0)
	end
	
	# Make the following methods public
	public

  attr_accessor :measurements

	# Fill in this method to add a DistanceConverter instance to the hash.
	# The first parameter is the name of the measurement like 'door width' and 'window height'
	def add( measurementName, feet, inches )
    addition = {measurementName => DistanceConverter.new(feet,inches)}
    @measurements.merge!(addition)

	end
		
	# Create a method to retrieve a particular length in inches by its measurementName
	# You can assume that only existing valid measurementName strings are provided
	def getMeasurementInches( measurementName )
    @measurements[measurementName].inches

	end
	
	# Create a method to return the length of the hash
	def numberOfMeasurements
    return @measurements.size

	end
	
	# Create a method that returns the sum (in inches) of the two measurements
	def addTwoMeasurementsInInches( measurementName1, measurementName2 )
    @measurements[measurementName1].inches + @measurements[measurementName2].inches
  end
end
