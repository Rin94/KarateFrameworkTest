Feature: To test the get end poin of the application
To test different get end point with different data format supported bu the app

Scenario: To test get end point with JSON data
	Given the application url 'www.google.com'
	And the context paht is '/getdata'
	When I send the get request
	Then status code should be 200
	And the response format should be in JSON
	
Scenario: To test get end point with XML data
	Given the application url 'www.google.com'
	And the context paht is '/getdata'
	When I send the get request
	Then status code should be 200
	And the response format should be in XML
	

