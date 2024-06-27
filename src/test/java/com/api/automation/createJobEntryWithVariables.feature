Feature: To create the job entry in the test application
  Helper file POST /normal/webapi/add

  Scenario: To Create the Job Entry with JSON data
    Given url _url
    And path _path
    * def getRandomValue = function() {return Math.floor((1000)*Math.random());}
    * def id = getRandomValue()
    And request {"jobId": '#(_id)', "jobTitle": 'LOS', "jobDescription": 'SOL', "experience": ['Nothing']}
    And headers {Accept: 'application/json', Content-Type: 'application/json' }
    When method post
    Then status 201
    * def responseJobId = response.jobId
    * def responseJobTitle = response.jobTitle