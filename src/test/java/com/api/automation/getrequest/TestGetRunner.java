package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {
	//firt way to create a runner for karate test
	//@Test
	public Karate runTest() {
		return Karate.run("getRequest2", "responseMatcher", "validateJSONArray").relativeTo(getClass());
		
		
	}
	
	//@Test
	public Karate runTestUsingClassPath() {
		return Karate.run("classpath:com/api/automation/getrequest/getRequest2.feature");
	}
	
	@Test
	public Karate runTestInXML() {
		return Karate.run("validateXMLContent").relativeTo(getClass());
		
		
	}

	
}

