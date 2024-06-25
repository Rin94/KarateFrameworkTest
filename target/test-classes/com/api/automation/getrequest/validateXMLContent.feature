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
   