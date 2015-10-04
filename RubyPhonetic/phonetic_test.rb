#Jonathan Correia de Barros
# Oct 4th 2015

require_relative 'phonetic'
require 'test/unit'

class PhoneticTest < Test::Unit::TestCase

  def test_rit_to_phonetic
    assert_equal 'ROMEO INDIA TANGO', Phonetic.to_phonetic('RIT')
  end

  def test_line_rit_to_phonetic
    assert_equal 'ROMEO INDIA TANGO', Phonetic.translate('A2P RIT')
  end

  def test_Romeo_India_Tango_from_phonetic
    assert_equal 'RIT', Phonetic.from_phonetic('Romeo India Tango')
  end

  def test_line_Romeo_India_Tango_from_phonetic
    assert_equal 'RIT', Phonetic.translate('P2A Romeo India Tango')
  end

end
