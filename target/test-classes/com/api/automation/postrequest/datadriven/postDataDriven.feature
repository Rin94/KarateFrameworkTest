Feature: To create job description in the test application

  Background: Read the data for data driven
    * def testdata = read("testData.csv")


  Scenario Outline: To create job description in the test application <method>
    Given print '<url>'
    When print '<path>'
    Then print '<method>'
    And print '<status>'

    Examples:
      |url|path|method|status|
      |http://localhost:9897|/normal/webapi/all|get|200|
      |http://localhost:9897|/normal/webapi/add|post|201|

  Scenario Outline: Data driven for the job description entry - <jobId>
    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request {"jobId": '#(jobId)', "jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)', "experience": ['Nothing']}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then match status == '<status>'

    Examples:
      |jobId|jobTitle|jobDescription|status|
      |9980|Data Analyst|Develop machine learning models|201|
      |id|QA Tester|Trigger and develop test scripts|400|


  Scenario Outline: Data driven for the job description entry given the csv file - <jobId>
    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request {"jobId": '#(jobId)', "jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)', "experience": ['Nothing']}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    Then match status == '<status>'

    Examples:
      |read("testData.csv")|