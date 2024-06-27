package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestJsonPathExpressionRunner {
	//firt way to create a runner for karate test
	@Test
	public Karate runTest() {
		return Karate.run("jsonPathExpression").relativeTo(getClass());

	}

}

