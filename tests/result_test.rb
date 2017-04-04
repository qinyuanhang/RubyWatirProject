



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


class ResultTest < Test::Unit::TestCase
  include BaseClass

  @@info_indicate=   '--------- info -----------'
  @@warning_indicate='!!!!!!!!! warning !!!!!!!!'
  @@business_tag = 0
  @@total_month_31days = 0
  @@total_month_less_31days = 0
  @@month_31 = Array[1,3,5,7,8,10,12]



  ############################################################################ test cases area

  ## check if the page has been loaded successfully

  ## filter all
  def test_a_filter_all
    filter = 'filter-all'
    tag_name='All'
    basic_check_list(filter, tag_name)
  end

  #filter "news"
  def test_b_filter_news
    filter = 'filter-news'
    tag_name='news'
    basic_check_list(filter, tag_name)
  end

  ## filter programmes
  def test_d_filter_programmes
    filter = 'filter-programmes'
    tag_name='Programmes'
    basic_check_list(filter, tag_name)
  end

  ## filter sport
  def test_e_filter_sport
    filter = 'filter-sport'
    tag_name = 'Sport'
    basic_check_list(filter, tag_name)
  end

  # filter about bbc
  def test_f_filter_bbc
    filter = 'filter-bbc'
    tag_name = 'About the BBC'
    basic_check_list(filter, tag_name)
  end


  def test_c_filter_world_service
    filter = 'filter-worldservice'
    tag_name = 'World Service'
    basic_check_list(filter, tag_name)
  end


  def test_z_all_business_artical
    puts "the number of articles that have the '"'Business'"' tag is #{@@business_tag}"
    puts "the number of articles that have the '"'Business'"' tag with months that have less than 31 days is #{@@total_month_less_31days}"
    puts "the number of articles that have the '"'Business'"' tag that occur on months with 31 days is #{@@total_month_31days}"
  end


  ############################################################################  end of test cases area





  ############################################################################  my classes


  def basic_check_list(filter, tag_name)
    check_filter_by_class(filter)
    click_filter(filter)
    li_arr = get_results_as_array
    check_number_of_results(li_arr)
    check_result_has_headline(li_arr)
    check_result_has_summary(li_arr)
    check_show_more_result_btn
    check_result_has_img(li_arr)
    collect_Business_tag(li_arr)
    if tag_name != 'All'
      check_result_datasite(li_arr, tag_name)
    end
    check_result_has_date(li_arr)
  end






  def result_more_then_ten
    total_result = get_data_total_results
    if total_result.to_i > 10
      true
    else
      false
    end
  end


  def check_filter_by_class(filter)
    puts "#{@@info_indicate} start checking filter existence..."
    $browser.div(:class,'filters-content').wait_until_present
    assert_not_nil($browser.link(:class,filter.chomp),"#{@@warning_indicate} Could not find filter #{filter}")
  end


  def click_filter(filter)
    $browser.link(:class,filter.chomp).click
  end


  def get_data_total_results
    $browser.ols(:class,'search-results results')[0].attribute_value('data-total-results')
  end

  # make sure if the total results more than 10, then 10 result should be displayed
  #  if the total results less than 10, display all results
  def check_number_of_results(li_arr)
    puts "#{@@info_indicate} start checking if displaying correct number of results"
    if result_more_then_ten
      assert_true(li_arr.size == 10, 'display 10 results')
    else
      #result_more
      assert_true(li_arr.size == get_data_total_results, 'display all results')
    end
  end

  def get_results_as_array
    $browser.ols(:class,'search-results results')[0].lis
  end


  def get_post_time(li_element)
    times = li_element.times
    if times.size > 0
      times[0].attribute_value('datetime')
    else
      nil
    end
  end


  def check_result_has_img(li_arr)
    puts "#{@@info_indicate} start checking img"
    li_arr.each do |li|
      class_img = li.articles[0].attribute_value('class').to_s.chomp.downcase
      if class_img.include?'has_image'
        assert_equal(1,li.articles[0].imgs.size,"#{@@warning_indicate} incorrect number of picture displayed")
      else
        assert_equal(0,li.articles[0].imgs.size,"#{@@warning_indicate} there should not be any picture")
      end
    end
  end




  # make sure each result has post date
  def check_result_has_date(li_arr)
    puts "#{@@info_indicate} start checking post date"
    li_arr.each do |li|
      assert_not_nil(get_post_time(li),"#{@@warning_indicate}Could not found time tag//n")
    end
  end


  ## make sure each result has headline
  def check_result_has_headline(li_arr)
    puts "#{@@info_indicate} start checking headline"
    li_arr.each do |li|
      assert_not_nil(get_headline(li),"#{@@warning_indicate}Could not found headline//n")
    end
  end




  def get_headline(li)

    headline = li.div.h1.text
    if headline.nil?
      nil
    else
      headline
    end
  end



  def get_summary_medium(li)
    summary_medium = li.div.p(:class,'summary medium')
    if summary_medium.nil?
      nil
    else
      summary_medium
    end
  end

  def get_summary_long(li)
    summary_long = li.div.p(:class, 'summary long')
    if summary_long.nil?
      nil
    else
      summary_long
    end
  end

  def get_summary_short(li)
    summary_short = li.div.p(:class,'summary short')
    if summary_short.nil?
      nil
    else
      summary_short
    end
  end


  ## make sure each result has 3 summaries
  def check_result_has_summary(li_arr)
    puts "#{@@info_indicate} start checking summaries(long, medium, short)"
    li_arr.each do |li|
      assert_not_nil(get_summary_long(li),"#{@warning_indicate}  Could not find summary long")
      assert_not_nil(get_summary_medium(li),"#{@warning_indicate}  Could not find summary medium")
      assert_not_nil(get_summary_short(li),"#{@warning_indicate}  Could not find summary short")
    end
  end



  def check_result_datasite(li_arr, keyword)
    puts "#{@@info_indicate} start checking data site"
    li_arr.each  do |li|
      signpost_site = get_signpost_site(li)
      assert_equal(keyword.downcase,signpost_site.chomp.downcase, "#{@@warning_indicate}Could not find matched signpost_site")
    end
  end

  def get_signpost_site(li)
    signpost_site = li.span(:class,'signpost-site').text.chomp
    if signpost_site.nil?
      nil
    else
      signpost_site
    end
  end


  def get_signpost_section(li)
    if li.span(:class,'signpost-section').exist?
      signpost_section = li.span(:class,'signpost-section').text.chomp
    end
  end

  def check_show_more_result_btn
    puts "#{@@info_indicate} start checking show more result btn"
    if result_more_then_ten
      assert_not_nil(get_show_more_result_btn, "#{@@warning_indicate}Could not find 'show more result' button")
      check_function
    else
      #show more result btn should not be there
      assert_nil(get_show_more_result_btn, "#{@@warning_indicate}'show more result' button should NOT be there")
    end
  end

  def get_show_more_result_btn
    if $browser.link(:class, 'more').exist?
      $browser.link(:class, 'more')
    else
      nil
    end
  end


  def check_function
    puts "#{@@info_indicate} start checking functionality of show more btn"
    before_ols_size = $browser.ols(:class,'search-results results').size
    get_show_more_result_btn.click
    # wait for 5 sec to let more result to be loaded
    sleep 5
    after_lis_size = $browser.ols(:class,'search-results results').size
    assert_true(after_lis_size > before_ols_size, "Could not load more results")
  end


  def collect_Business_tag(li_arr)
    li_arr.each  do |li|
      signpost_section = get_signpost_section(li)
      if signpost_section.to_s.downcase.== 'business'
        @@business_tag = @@business_tag + 1
        date = Date.parse (get_post_time li)
        month = date.month.to_i
        if @@month_31.include? month
          @@total_month_31days += 1
        else
          @@total_month_less_31days += 1
        end

      end
    end
  end

############################################################################ end of my classes
end





