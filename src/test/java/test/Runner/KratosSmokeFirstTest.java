package test.Runner;

import java.io.IOException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import com.Utilities.Mail;

import cucumber.Framework.Helper;
import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;




@RunWith(Cucumber.class)
@CucumberOptions(
		
		format = { "pretty", "html:target/cucumber","json:target/JSON/Output.json" },
		features = {"."},
		glue = {"webApi.Kratos", "restassured.Framework"},
        plugin = {"com.cucumber.listener.ExtentCucumberFormatter:target/KratosReport.html","rerun:target/rerun_apikratos.txt"},
        tags = {"@KRATOSSMOKETEST"}

   

)


public class KratosSmokeFirstTest extends Helper {
	
	@BeforeClass
	public static void BeforeClass() throws Exception
	{
		log.info("Execution is started from First Runner Test - BeforeClass Annotation");
	}	
		
 	
	@AfterClass
	public static void AfterClass() throws IOException, Throwable
	{	
		Mail.SendReport("KratosReport.html", "KratosDEVURL", "[SMOKE TEST]: KRATOS - ");		
		log.info("Execution is ended from First Runner - Test AfterClass Annotation");
		
	}
}


