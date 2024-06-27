Feature: Validate JSON schema
  To validate json schema post

  Background: Create and Initialize base url
    Given url 'http://localhost:9897'

  Scenario: Schema Validation in a JSON response
    Given path '/normal/webapi/add'
    And request read('../JsonRequest.json')
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And def schema = read('../JsonSchema.json')
    And match response == schema


  Scenario: Schema Validation for GET end point
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * def projectSchema = { "projectName": '#string', "technology": '#[] #string' }
    * def mainSchema = {"jobId": '#number',"jobTitle": '#string',"jobDescription": '#string',"experience": '#[] #string', "project": '#[] ##(projectSchema)'}
    #* def mainSchema = {"jobId": '#number',"jobTitle": '#string',"jobDescription": '#string',"experience": '#[] #string', "project": '#[] #object'}
    And print mainSchema
    And match response ==
    """
    '#[] ##(mainSchema)'
    """

