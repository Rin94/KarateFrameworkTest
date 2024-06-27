Feature: To Execute JS functions

  Scenario: Execute Java Script function with and without parameter
    * def getIntValue = function() { return 10;}
    Then print getIntValue()
    * def getRandomValue = function(){return Math.floor((100)* Math.random());}
    Then print "Random Value as : ",getRandomValue()
    * def getStringValue = function(arg1){return "Hello "+ arg1;}
    Then print "Argument: ", getStringValue("World")