Feature: To upload the file using karate framework

  Background:
    * url 'http://localhost:9897'

  Scenario: To upload a file in the app
    Given path '/normal/webapi/upload'
    #karate kw multipart file and: key value
    # location of file, #name of the file, #content-type header value in JSON formtat
    And multipart file file = {read:'fileToUpload.txt', filename: 'fileToUpload.txt', Content-type:'multipart/form-data'}
    When method post
    Then status 200
    And print response


  Scenario: To upload a json file in the app
    Given path '/normal/webapi/upload'
    #karate kw multipart file and: key value
    # location of file, #name of the file, #content-type header value in JSON formtat
    And multipart file file = {read:'../data/JsonRequest.json', filename: 'JsonRequest.json', Content-type:'multipart/form-data'}
    When method post
    Then status 200
    And print response
    And match response.message contains 'JsonRequest'