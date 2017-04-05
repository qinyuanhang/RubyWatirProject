### Automate Test with Watir 

generate a runable automation test for www.bbc.com

## Getting Started



## Installation instructions

What things you need to install the software and how to install them

    1: Have Ruby installed (2.4.1)
    
    2: Have Watir installed 
    
    3: Have Test-Unit install
    
    4: Have chrome and firefox drivers downloaded and make sure the path has been included in environment variables

* [Ruby](https://github.com/ruby/ruby) - see more about Ruby
* [Watir](https://github.com/watir/watir) - see more about Watir
* [Test/Unit](https://watir.com/frameworks/) - see more framework
* [chrome](https://sites.google.com/a/chromium.org/chromedriver/) - Chrome Driver
* [firefox](https://github.com/mozilla/geckodriver/releases) - firefox Driver

## How to run

Explain how to run the automated tests for this system

    1: use command line tool, cd to the project file 
    2: type "ruby testsuite"
        follow the instruction to select browser
            enter 1 for chrome
            enter 2 for firefox
    3: When finished, check folder "Results", there would be a report HTML file   
    
## Test cases implemented
    1: test functions of each filter 
    2: test if display correct number of articles 
        1) if the number of filter result is more then 10(there could be many articles from the search result)
            1> make sure at most 10 article display when first time click filter 
            2> make sure "show more result" link present at bottom of this page 
            3> click "show more result", make sure 10 more articles appended. 
        2) if the number of filter result is less than 10 
            1> display all the articles
            2> make sure "show more result" link disappear         
    3: test every article include items:
        1) post date
        2) headline
        3) summary 
        4) tag
    4: articles' tag shoule match to current filter 
    5: articles who have class "has_img" should contain a img tag
    6: generate test result report in HTML
 
## Test cases to be implemented
    1: add more filter function tested 
    2: make sure each link directed to the right page 
    3: image display successfully 
 
## A brief explanation of your approach in completing this exercise.
    1: requirements collection  
    2: Learn Ruby from the beginning 
    3：Search for some watir test samples, try to implement in my local 
    4: Start from modify the sample to my test

## Future enhancements
    
    1: support mobile divices webpage test 
    2: more dynamic(ex. test in different window size)
    3: support IE browser 
    4: devid a big test case into multiple small tests 

## Compromises made

    in order to test multiple filter function on the same page, I include all test cases into one big test, so that only once setup needed for multiple tests.
    Only verified in OS X Yosemite version 10.10.5. 
    Only tested in Maximized window size, change of window size would cause some test failure
    
## Authors

* ** Yuanhang Qin ** 

