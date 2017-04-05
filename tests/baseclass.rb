
require 'test/unit'
require 'watir'
require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'

module BaseClass
  module ClassMethods
    def startup

      print <<EOF

    ╰　╮　╮　╮
　　╰　╰　╰
 ┌───────┐
 │　　　　├╮    Prepare test.......
 │███████││
 │███████││     
 │███████├╯
 ╰───────╯

EOF

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


    def shutdown




      print <<EOF

  


     ╰　╮　╮　╮
　　╰　╰　╰
 ┌───────┐
 │　　　　├╮    
 │███████││
 │███████││     
 │███████├╯   bye bye ~~~~
 ╰───────╯

EOF

      $browser.close
    end
  end

  class << self
    def included(base)
      base.extend(ClassMethods)
    end
  end

  def setup
    puts ''
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  start testing #{self.name}  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    #puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  start testing #  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts ''
  end

  def teardown
    puts ''
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> end of testing #{self.name} <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts ''
  end


end