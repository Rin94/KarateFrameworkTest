Feature: validate the GET endpoint
  To validate the get end point response

  Background: Set up the base url
    Given url 'http://localhost:9897'


  Scenario: To get data in JSON format and validate a specific property
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match header Content-Type == 'application/json'
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].experience[0] == 'Google'
    And match response.[0].project[0].technology[1] == 'SQL Lite'
    And match response.[0].project[0].projectName == 'Movie App'
    #validate the size of array
    And match response.[0].experience == '#[3]'
    And match response.[0].project[0].technology == '#[3]'
    #avoid using index value and use [*] wild card instead
    And match response.[0].experience[*] == ["Google","Apple","Mobile Iron"]
    And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
    #using contains kw
    And match response.[0].experience[*] contains ["Apple","Mobile Iron"]
    And match response.[0].project[0].technology[*] contains ["Gradle"]
    And match response.[*].jobId contains 1


  Scenario: Validate fuzzy matchers with JSON
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match header Content-Type == 'application/json'
    And match response.[0].jobId == '#present'
    And match response.[0].experience[1] == '#notnull'
    And match response.[0].project[0].technology == '#array'
    And match response.[0].jobTitle == '#string'
    And match response.[0].jobId == '#number'
    #complex fuzzy matcher
    And match response.[0].jobId == '#? _>=1'
    And match response.[0].jobTitle == '#string? _.length >= 1'
