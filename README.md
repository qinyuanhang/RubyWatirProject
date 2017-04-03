
Author: Yuanhang Qin
Object: Programming Exercise 2 - Web Automation in Ruby Watir
Project Describe:
    Given a web page, and test it. see details below.
*********************************************************
Step 1: Start on BBC.com

Step 2: Search for "World Market"

Step 3: Consider functionality and data within this results page that you reach from the last step.  Determine and automate use cases and qualitative checks, limiting yourself to this page.  For example, you could write a validation that ensures that the page always starts with 10 search results.

Step 4: Add test coverage specifically around the "Show more results" button at the bottom.

Step 5: Add test coverage related to each of the filters above (you can fore go coverage of "More Filters").  Be sure to add coverage for the "All" filter.

**********************************************************

Bonus Steps:

Bonus 1: Allow your script to take a command line argument that allows you to change the browser between Firefox and Chrome 

Bonus 2: Output the number of articles that have the "Business" tag with months that have less than 31 days and then the number of the same that occur on months with 31 days.

Bonus 3: Generate an HTML Report from the test results.

Bonus 4: Set up your tests to run against a headless browser (Look into what WatiR offers).
*********************************************************
Prerequisites

1. You must use the Ruby WatiR Framework. 
2. You must use ruby's Test/Unit class 

*********************************************************

Installation instructions:

*********************************************************
How to run:

*********************************************************
Test cases implemented:

checking each filtered result follows belowing steps:

1, check each search result contains basic info
    (1). headline
    (2). summary(short/medium/long)
    (3). post date
    (4). data site(should matches to filter key word)
    
2, verify the data total result
    (1). if total result > 10, check there are at most 10 articles displayed and "show more result" button display
    (2). if total result <= 10, check total number of articles matches total result and "show more result" button disappear
    
********************************************************

Test cases to be implemented:

********************************************************

A brief explanation of your approach in completing this exercise:

    1: Went through basic Ruby tutorial and finished environment setting
    2: Searched for some examples, had deeper understanding of watir automation test
    3: Manually went through the test steps, designed test cases and test plan
    4: started work on it


********************************************************
Future enhancements:

********************************************************
Compromises made:

