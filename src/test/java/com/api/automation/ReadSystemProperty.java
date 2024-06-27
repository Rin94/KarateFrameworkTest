package com.api.automation;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ReadSystemProperty {

	public static void main(String[] args) {
		System.out.println("Location " + System.getProperty("location", "com/api/automation"));
		System.out.println("Tags " + System.getProperty("tags", "@Smoke"));
	}



}


