Feature: Read external files and stores it
To validate the get end point response

  Background: Set up the base url
    Given url 'http://localhost:9897'
    And def actualResponseJson = read("../JsonResponse.json")
    And def actualResponseXML = read("../XmlResponse.xml")

  Scenario: To get data in JSON format and read the expected result in a json file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response == actualResponseJson


  Scenario: To get data in XML format and read the expected response in a xml file
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And def real_response = response
    And match real_response == actualResponseXML

