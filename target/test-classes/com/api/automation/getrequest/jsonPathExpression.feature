Feature: To Use the JSON path expression

  Background: Setup the base path
  Given url 'http://localhost:9897'

  Scenario: To get the value of property using the json path expression
    Given path '/normal/webapi/all'
    When method get
    Then status 200
    # karate.jsonPath(doc, jsonPathExpression)
    #you can filter data in json document using filter path as it described
    * def jobTitle = karate.jsonPath(response, "$[?(@.jobId == 1)].jobTitle")
    * def jobDescription = karate.jsonPath(response, "$[?(@.jobId == 1)].jobDescription")
    * def jobExperience = karate.jsonPath(response, "$[?(@.jobId == 1)].jobExperience")
    And print jobTitle
    And print jobDescription
    And print jobExperience




