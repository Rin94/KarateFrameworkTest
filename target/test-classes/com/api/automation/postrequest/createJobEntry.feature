@Confidence
Feature: To create the job entry in the application
  Use POST /normal/webapi/add to create job entry in the application

  Background: Create and Initialize base url
    Given url 'http://localhost:9897'

  Scenario: To create the job entry in JSON format
    Given path '/normal/webapi/add'
    And request read('../JsonRequest.json')
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    #And print response
    And match response.jobTitle == 'Data Engg'


  Scenario: To create the job entry in XML format
    Given path '/normal/webapi/add'
    And request read('../XmlRequest.xml')
    And headers {Accept: 'application/xml', Content-Type: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response/Job/jobId == '4'
    And match response/Job/jobTitle == 'QA Tester'


  Scenario: To create the job entry in JSON format WITH EMBEDEED expression
    Given path '/normal/webapi/add'
    * def getJobID = function(){return Math.floor(1000*Math.random());}
    And request {"jobId": '#(getJobID())',"jobTitle": "Data Engg","jobDescription": "Create machine learning apps","experience": ["IBM","INTEL"],"project": [{"projectName": "SCASE","technology": ["Python","R"]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    #And print response
    And match response.jobTitle == 'Data Engg'



  Scenario: To create the job entry in XML format WITH EMBEDEED expression
    Given path '/normal/webapi/add'
    * def getJobID = function(){return Math.floor(1000*Math.random());}
    * def jobId = getJobID()
    And request <item><jobId>#(jobId)</jobId><jobTitle>QA Tester</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>RRD</experience><experience>ApD</experience><experience>MobileIron</experience></experience><project><project><projectName>Eccc</projectName><technology><technology>Selenium</technology><technology>Robot</technology></technology></project></project></item>
    And headers {Accept: 'application/xml', Content-Type: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response/Job/jobTitle == 'QA Tester'

