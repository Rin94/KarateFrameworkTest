package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestReadExernalFileRunner {
	//firt way to create a runner for karate test
	@Test
	public Karate runTest() {
		return Karate.run("ReadExternalFiles").relativeTo(getClass());
		
		
	}
	



	
}

