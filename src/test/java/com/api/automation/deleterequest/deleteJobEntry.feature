@Regression
Feature: Delete a Job enty using DELETE
  /normal/webapi/remove/{id}

  Background: create and initialize base URL
    Given url 'http://localhost:9897'

  Scenario: To delte the job description using job id
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def idJob = getRandomValue()
    And print idJob
    * def createJobId = call read('../createJobEntryWithVariables.feature'){_url: 'http://localhost:9897',_path:'/normal/webapi/add', _id:'#(idJob)'}
    #delete request
    Given path '/normal/webapi/remove/'+ idJob
    And headers {Accept:'application/json'}
    When method delete
    Then status 200
    #Get request
    Given path "/normal/webapi/find"
    And params {id: '#(idJob)', jobTitle:'LOS'}
    And header Accept = 'application/json'
    When method get
    Then status 404

  Scenario: To demo request chaining
    # Create a new job entry.
    # Extract the job id and job title from the response of POST request
    # Send the path request, Value of query parameter will be set by , info extracted from previous request
    # Extract the job id and job title from the response of patch request
    # Get request with query parameter, value of query param is set by info extracted from responce of patch request
    # Add the validation on job description in the response of get request
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def creatJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    * def jobId = creatJob.responseJobId
    * def jobTitle = creatJob.responseJobTitle
    # Patch request
    * def jobDes = 'To develop andriod application and web application'
    Given path '/normal/webapi/update/details'
    And params {id:'#(jobId)',jobTitle:'#(jobTitle)',jobDescription:'#(jobDes)'}
    And header Accept = 'application/json'
    And request {}
    When method patch
    Then status 200
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle
    # Get Request
    Given path '/normal/webapi/find'
    And params {id:'#(jobId)',jobTitle:'#(jobTitle)'}
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.jobDescription == jobDes