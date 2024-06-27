Feature: To test Get end point with a Query parameter
  Get /normal/webapi/find

  Background: Create and initialize URL
    Given url 'http://localhost:9897'
  @Regression
  Scenario: To get the data using Query Parameter
  #create job entry to search
    * def randomValue = function(){return Math.floor((100)* Math.random());}
    * def id = randomValue()
    * def createJob = call read("../../createJobEntryWithVariables.feature") {_url: "http://localhost:9897",_path:"/normal/webapi/add",_id:'#(id)'}
    And print createJob
    #send request with query param kw param
    Given path '/normal/webapi/find'
    #And param id = id
    #And param jobTitle = 'LOS'
    And params {id:'#(id)',jobTitle:'LOS'}
    And headers {Accept: 'application/json'}
    When method get
    Then status 200
    And print response
    And match response.jobId == id
