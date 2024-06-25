Feature: To test the get end point of the application
To test different get end point with different data format supported by the app

Background: setup base path
	Given url 'http://localhost:9897'
	#print the output
	And print '========== This is background keyword =============' 
	

Scenario: To test get end point with JSON data
	#Given url 'http://localhost:9897'
	#base path + context path
	Given path '/normal/webapi/all'
	When method get #Send the Get request
	Then status 200 #The status code response should be 200
	
	
Scenario: To test get end point with JSON data using path variable
	#Given url 'http://localhost:9897'
	#base path + context path
	And path '/normal/webapi/all'
	And header Accept = 'application/json'
	When method get #Send the Get request
	Then status 200 #The status code response should be 200
	
Scenario: To test get end point with XML data using path variable
	#Given url 'http://localhost:9897'
	#base path + context path
	And path '/normal/webapi/all'
	#header keyword
	And header Accept = 'application/xml'
	When method get #Send the Get request
	Then status 200 #The status code response should be 200
	



