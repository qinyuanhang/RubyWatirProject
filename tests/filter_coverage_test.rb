require 'test/unit'
require 'watir'
require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'

class FilterCoverageTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    puts '**************************************************'
    puts 'What browser you want to use:'
    puts ' => enter 1 for chrome'
    puts ' => enter others digits for firefox'
    puts '**************************************************'

    input = gets.chomp
    keyword = 'world market'

    case input
      when '1' then
        browser_type='chrome'
        puts ''
        puts '******************** Chrome **********************'
        puts ''
      else
        browser_type='firefox'
        puts ''
        puts '******************** Firefox **********************'
        puts ''
    end

    $browser = Watir::Browser.new browser_type
    $browser.driver.manage.window.maximize
    $browser.goto('http://www.bbc.com')
    sleep 5
    $browser.text_field(:id, 'orb-search-q').wait_until_present
    $browser.text_field(:id, 'orb-search-q').set(keyword)
    $browser.button(:value,'Search').click
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    $browser.close
  end

  # Fake test
  def test_filter_coverage
      puts "fest_filter_add code here"
  end
end