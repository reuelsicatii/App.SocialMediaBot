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
		glue = {"cucumber.Framework","webApp.Compass", "webApp.Seoreseller", "webApp.PayPerContent", "webApp.Mailbox"},
        plugin = {"com.cucumber.listener.ExtentCucumberFormatter:target/SRSDashboardReport.html","rerun:target/SrsRerun.txt"},
        tags = {"@SRSSMOKETEST"}
   
)


public class R1_SrsSmokeTest extends Helper{
	
	@BeforeClass
	public static void BeforeClass() throws Exception
	{
		log.info("Execution is started from First Runner Test - BeforeClass Annotation");
	}	
 	
	@AfterClass
	public static void AfterClass() throws IOException, Throwable
	{	
		Mail.SendReport("SRSDashboardReport.html", "SeoresellerSTGURL_Login", "[SMOKE TEST]: SRS - ");
		log.info("Execution is ended from Second Runner - Test AfterClass Annotation");
	}
}

