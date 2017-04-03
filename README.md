
Author: Yuanhang Qin


Project Describe:

    Given a web page, and test it. see details below.
    
Prerequisites

    1. You must use the Ruby WatiR Framework. 
    2. You must use ruby's Test/Unit class 



Installation instructions:


How to run:

    

Test cases implemented:
 
   
checking each filtered result follows steps below:

    1), check each search result contains basic info
        (1). headline
        (2). summary(short/medium/long)
        (3). post date
        (4). data site(should matches to filter key word)    
    2), verify the data total result
        (1). if total result > 10, check there are at most 10 articles displayed and "show more result" button display
        (2). if total result <= 10, check total number of articles matches total result and "show more result" button disappear
    
Test cases to be implemented:



A brief explanation of your approach in completing this exercise:

    1: Went through basic Ruby tutorial and finished environment setting
    2: Searched for some examples, had deeper understanding of watir automation test
    3: requirements confirmaton  
    4: Manually went through the test steps, designed test cases and test plan, 
        thinking about corner caes

Future enhancements:



Compromises made:

