package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ParallelBuilderWithCucumberReport {
	
	@Test
	public void executeKarateTest() {
		Builder aRunner = new Builder();
		//aRunner.path("classpath:com/api/automation/getrequest");
		//aRunner.path("classpath:com/api/automation").outputCucumberJson(true);
		// aRunner.parallel(5);
		Results result = aRunner.path("classpath:com/api/automation").outputCucumberJson(true).parallel(5);
		generateCucumberReport(result.getReportDir());
		//Assertions.assertEquals(0, result.getFailCount(), "There are Some Failed Scenarios ");
		
	}
	
	// reportDirLocation --> C:\Data\GitHub\KarateFrameworkTutorial\target\surefire-reports
	private void generateCucumberReport(String reportDirLocation) {
		File reportDir = new File(reportDirLocation);
		Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[] {"json"}, true);
		
		List<String> jsonFiles = new ArrayList<String>();
		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
		
		Configuration configuration = new Configuration(reportDir, "Karate Run");
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		reportBuilder.generateReports();
	}

}