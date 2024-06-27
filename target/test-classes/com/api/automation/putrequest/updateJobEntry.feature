Feature: To Test the update of the job enty in the test app
  With the end point  PUT /normal/webapi/update

  Background: Create and initizalite base url
    Given url 'http://localhost:9897'

    Scenario: To update the job entry for existing job in JSON format
      Given path '/normal/webapi/add'
      * def getRandomValue = function() {return Math.floor((1000)*Math.random());}
      * def id = getRandomValue()
      And request {"jobId": '#(id)', "jobTitle": 'LOS', "jobDescription": 'SOL', "experience": ['Nothing']}
      And headers {Accept: 'application/json', Content-Type: 'application/json' }
      When method post
      Then status 201
      And print response
      Given path '/normal/webapi/update'
      And request {"jobId": '#(id)', "jobTitle": 'IOS', "jobDescription": 'APPLE', "experience": ['Nothing']}
      And headers {Accept: 'application/json', Content-Type: 'application/json'}
      And method put
      Then status 200
      * def validation = karate.jsonPath(response, "$[?(@.jobId == "+id+")].jobTitle")
      And match validation == ["IOS"]
      And match validation[0] == "IOS"


  Scenario: To update the job entry for existing job in JSON format by calling another feature file
    # <Gherkin kw> <call> <read(<location of file>)>
    #Given call read("../createJobEntry.feature") {var1:value, var2: value}
    * def postRequest = call read('../createJobEntry.feature')
    And print "Calling : ", postRequest.id
    Given path '/normal/webapi/update'
    And request {"jobId": '#(postRequest.id)', "jobTitle": 'IOS', "jobDescription": 'APPLE', "experience": ['Nothing']}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    And method put
    Then status 200
    * def validation = karate.jsonPath(response, "$[?(@.jobId == "+postRequest.id+")].jobTitle")
    And match validation == ["IOS"]
    And match validation[0] == "IOS"


  Scenario: To update the job entry for existing job in JSON format by calling another feature with vars
    * def getRandomValue = function() {return Math.floor((1000)*Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature"){_url: 'http://localhost:9897', _path:'/normal/webapi/add', _id: '#(id)'}
    Given path '/normal/webapi/update'
    And request {"jobId": '#(postRequest.responseJobId)', "jobTitle": 'IOS', "jobDescription": 'APPLE', "experience": ['Nothing']}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    And method put
    Then status 200

