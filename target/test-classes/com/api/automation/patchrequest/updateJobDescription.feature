Feature: To test the patch end point for updating the job description
    Patch /normal/webapi/update/details

  Background: Initialize URL
    * url 'http://localhost:9897'

  Scenario: To update a job entry using PATCH method
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def idJob = getRandomValue()
    And print idJob
    * def createJobId = call read('../createJobEntryWithVariables.feature'){_url: 'http://localhost:9897',_path:'/normal/webapi/add', _id:'#(idJob)'}
    Given path '/normal/webapi/update/details'
    And params {id: '#(idJob)', jobTitle: 'QA Tester', jobDescription: 'Finding bugs'}
    And headers {Accept: 'application/json', Content-type: 'application/json'}
    When method patch
    Then status 200
    And print response
    And match response.jobTitle == 'QA Tester'

  @Regression
  Scenario: To update a job entry using PATCH method with non existing job id
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def idJob = getRandomValue()
    And print idJob
    * def createJobId = call read('../createJobEntryWithVariables.feature'){_url: 'http://localhost:9897',_path:'/normal/webapi/add', _id:'#(idJob)'}
    Given path '/normal/webapi/update/details'
    And params {id: '-1', jobTitle: 'QA Tester', jobDescription: 'Finding bugs'}
    And headers {Accept: 'application/json', Content-type: 'application/json'}
    And request {}
    When method patch
    Then status 404

  @Smoke
  Scenario: To update a job entry using PATCH method without job title
    * def getRandomValue = function(){return Math.floor((100)*Math.random());}
    * def idJob = getRandomValue()
    And print idJob
    * def createJobId = call read('../createJobEntryWithVariables.feature'){_url: 'http://localhost:9897',_path:'/normal/webapi/add', _id:'#(idJob)'}
    Given path '/normal/webapi/update/details'
    And params {id: '#(idJob)', jobDescription: 'Finding bugs'}
    And headers {Accept: 'application/json', Content-type: 'application/json'}
    And request {}
    When method patch
    Then status 400
