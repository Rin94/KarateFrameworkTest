Feature: validate the GET endpoint
  To validate the get end point response

  Background: Set up the base url
    Given url 'http://localhost:9897'


  Scenario: To get data in XML format and validate a specific property
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match header Content-Type == 'application/xml'
    And match response/List/item/jobId == '1'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/experience/experience contains 'Google'
    And match response/List/item/experience/experience[1] == 'Google'
    #in karate you can use the json way but the index starts with 0
    And match response.List.item.experience.experience[0] == 'Google'


  Scenario: To get data in XML format and validate a specific property
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match header Content-Type == 'application/xml'
    And match response/List/item/jobId == '#notnull'
    And match response/List/item/project/project/projectName == '#present'
    And match response/List/item/experience/experience == '#notnull'
    #in karate you can use the json way but the index starts with 0
    And match response.List.item.experience.experience[0] == '#ignore'
    #fuzzy matcher expressions
    And match response/List/item/jobId == '#notnull'
    And match response/List/item/jobTitle == '#string? _.length >= 1'
    #check an element is an array
    And match response/List/item/experience/experience == '#'

    And match response/List/item/experience/experience == '#[3] #string? _.length >= 2'

