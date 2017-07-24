package webApp.Compass;

import static org.junit.Assert.assertEquals;

import java.io.File;
import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.By.ByXPath;
import org.openqa.selenium.UnhandledAlertException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.jayway.jsonpath.JsonPath;

import cucumber.Framework.Helper;
import cucumber.Framework.SetUp;
import cucumber.api.Scenario;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class COM10_TaskDeploymentDeploy extends Helper{
	
	@FindBy(xpath=".//input[@value='Campaign']")
	 WebElement Campaign_txtfield;
	
	@FindBy(xpath=".//table[@id='deployments-table']/tbody/tr[1]//span")
	WebElement Deployment_button;
	
	@FindBy(xpath=".//input[@name='month_num']")
	WebElement MonthNo_textfield;
	
	@FindBy(xpath=".//button[text()='Deploy!']")
	WebElement Deploy_button;
	

	

		
	public COM10_TaskDeploymentDeploy() {
		
		PageFactory.initElements(driver, this);
		
	}
	
	
	
		
	@When("^I populate COM10_MonthNo with \"([^\"]*)\"$")
	public void i_populate_MonthNo_with(String arg1) throws Throwable, UnhandledAlertException {
		MonthNo_textfield.sendKeys(arg1);
	}
	
	@When("^I click COM10_Deploy button$")
	public void i_click_Deploy_button() throws Throwable, UnhandledAlertException {
		Deploy_button.click();
	}
	
		
	@Then("^Ill see ([^\"]*) is deployed over COMDEV_Deployment$")
	public void ill_see_Product_is_deployed_over_COMDEV_Deployment(String arg1) throws Throwable, UnhandledAlertException {
	
		Thread.sleep(10000);
		assertEquals("Awesome!!!", driver.findElement(By.xpath("//h4[@class='text-success']")).getText());
		assertEquals("Tasks we're deployed successfully!", driver.findElement(
				By.xpath("//h4[@class='text-success']/following-sibling::p")).getText());
		
		driver.findElement(By.xpath("//button[@class='btn primary']")).click();
			
	}

	
	@Then("^Ill see ([^\"]*) task correctly deployed$")
	public void ill_see_Product_task_correctly_deployed(String arg1) throws Throwable, UnhandledAlertException {
		
		
		Thread.sleep(10000);
		
		List<WebElement> Tasklist = driver
		.findElements(By.xpath(".//table[@id='sp-tasks-table']//span[@class='task-name']"));
		
		List<WebElement> Status = driver
		.findElements(By.xpath(".//table[@id='sp-tasks-table']//span[contains(@class, 'tag-status')]"));
		
		List<WebElement> Priority = driver
		.findElements(By.xpath(".//table[@id='sp-tasks-table']//span[contains(@class, 'tag-priority')]"));
		
		File jsonfile;
		jsonfile = new File(System.getProperty("user.dir") + "\\Data\\" + arg1.replaceAll("\\s+","") + ".json");		
		
		int i = 0;
		for (WebElement TL : Tasklist) 
		{				
				assertEquals(JsonPath.read(jsonfile, "$.Tasklist[" + i + "]").toString(), TL.getText());			
				i++;
		}
		
		int s = 0;
		for (WebElement S : Status) 
		{				
				assertEquals(JsonPath.read(jsonfile, "$.Status[" + s + "]").toString(), S.getText());			
				s++;
		}
		
		int p = 0;
		for (WebElement P : Priority) 
		{				
				assertEquals(JsonPath.read(jsonfile, "$.Priority[" + p + "]").toString(), P.getText());			
				p++;
		}
			
	     
	    
	}

	
	
}
