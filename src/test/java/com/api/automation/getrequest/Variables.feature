Feature: Variable Creation in Karate
  #<Gherkin kw> <def><variable_name> = <Value>
  # * def variable_name = value
  #you can use background kw to create global variables
  Background: Create and Initialize Variables
    * def app_name = 'Google'
    * def page_load_time_out = 20

  Scenario: To Create a Variable
    #use variable for repeating value
    #storing data from an external file
    #In the matche expression
    #passin the data from one feature to another
    Given def var_int = 10
    And def var_string = 'karate'
    Then print 'Int variable : ', var_int
    And print 'String variable: ', var_string
    * def var_int2 = var_int + 10
    And print "New variable ==> ", var_int2
    And print 'Background variable', app_name


  Scenario: Print global variable
    * print app_name
    And print 'The other background var', page_load_time_out






