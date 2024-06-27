package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ParallelBuilderWithTags {

    private static final String CLASS_PATH = "classpath:";
    private static final String DELIMITER = ",";

    @Test
    public void executeKarateTest() {
        Builder aRunner = new Builder();
        //aRunner.path("classpath:com/api/automation/getrequest");
        aRunner.path(getLocation());
        // aRunner.parallel(5);
        aRunner.tags(getTags());
        Results result = aRunner.parallel(5);
        System.out.println("Total Feature => " + result.getFeatureResults().count());
        System.out.println("Total Scenarios => " + result.getScenarioResults().count());
        System.out.println("Passed Scenarios => " + result.getScenariosPassed());

        //Assertions.assertEquals(0, result.getFailCount(), "There are Some Failed Scenarios ");

    }

    private List<String> getTags() {
        String aTags = System.getProperty("tags", "@Smoke,@Regression");
        List<String> aTagList = Collections.emptyList();
        // First check for the delimiter (,)
        // if the aTags has the delimiter then split the string using the delimiter
        // And create the list out of it
        // if aTags does not have delimiter, the use the old logic
        if(aTags.contains(DELIMITER)) {
            String tagArray[] = aTags.split(DELIMITER);
            aTagList = Arrays.asList(tagArray);
            return aTagList;
        }
        aTagList = Arrays.asList(aTags);
        return aTagList;

    }

    private List<String> getLocation() {
        String aLocation = System.getProperty("location", "com/api/automation");
        List<String> aLocationList = Collections.emptyList();
        if(aLocation.contains(DELIMITER)) {
            String locationArray[] = aLocation.split(DELIMITER);
            aLocationList = Arrays.asList(locationArray);
            aLocationList.replaceAll((entry) -> {
                return CLASS_PATH + entry;
            });
            return aLocationList;
        }
        aLocationList = Arrays.asList(CLASS_PATH + aLocation);
        return aLocationList;
    }

}