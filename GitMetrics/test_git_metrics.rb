# Jonathan Correia de Barros
# Oct 5th 2015


require_relative 'git_metrics'
require 'test/unit'

class TestGitMetrics < Test::Unit::TestCase

  def test_commit_example
  	assert_equal 2, num_commits(["commit abc", "commit 123"]), "Should have counted two commits"
  end

  def test_dates_with_three_days
  	exp = [ "Date:  Sun Jan 26 21:25:22 2014 -0600", \
  			"Date:  Sun Jan 23 21:25:22 2014 -0600", \
  			"Date:  Sun Jan 25 21:25:22 2014 -0600"]
    assert_equal 4, days_of_development(exp), "Should have been a 3 days difference"
  end

  def test_developers
    assert_equal 4, num_developers(['Author: Jeff Felchner <accounts+git@thekompanee.com>',
                                    'Author: Eugene Korbut <me@mvl.ru>',
                                    'Author: Jeff Felchner <accounts+git@thekompanee.com>',
                                    'Author: Jonathan Correia de Barros <jxc3143@rit.edu>',
                                    'Author: Jeff Felchner <accounts+git@anotheremail.com>']),
                 'Should have counted 4'
  end

  def test_0_dates
    assert_equal 0, days_of_development([]), 'It should have returned 0'
  end

  def test_1_date
    assert_equal 1, days_of_development(['Date:  Sun Jan 25 21:25:22 2014 -0600']), 'It should have returned 1'
  end

  def test_0_commits
    assert_equal 0, num_commits(['Anything']), 'It should have returned 0'

  end

  def test_same_developers
    assert_equal 1, num_developers(['Author: Jeff Felchner <accounts+git@thekompanee.com>',
                                    'Author: Jeff Felchner <accounts+git@thekompanee.com>',
                                    'Author: Jeff Felchner <accounts+git@thekompanee.com>',
                                    'Author: Jeff Felchner <accounts+git@thekompanee.com>',
                                    'Author: Jeff Felchner <accounts+git@thekompanee.com>',
                                    'Author: Jeff Felchner <accounts+git@thekompanee.com>'
                                   ]),
                 'It should have returned 1'
  end

  def test_commit_with_duplicated_string
    assert_equal 1, num_commits(['commit commit']), 'It should have returned 1'
  end

end
