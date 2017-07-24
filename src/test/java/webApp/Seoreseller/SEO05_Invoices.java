package webApp.Seoreseller;

import static org.junit.Assert.assertEquals;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.UnhandledAlertException;
import org.openqa.selenium.By.ByXPath;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import cucumber.Framework.Helper;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class SEO05_Invoices extends Helper{
	
	public static String InvoiceNumber;
	
	@FindBy(xpath=".//table[@id='invoices-table']/tbody/tr[1]/td[1]/a")
	WebElement InvoiceNumber_link;
	
	


		
	public SEO05_Invoices() {
		
		PageFactory.initElements(driver, this);
		
	}
	
	
	
	@When("^I capture and store Invoice Number from InvoiceNumber link$")
	public void i_click_SEO04_OthersPaymentMethod_radiobutton() throws Throwable, UnhandledAlertException {
		
		Thread.sleep(5000);
		InvoiceNumber = InvoiceNumber_link.getText();
		System.out.println(InvoiceNumber);
		
	}
	
	
	@Then("^Ill see ([^\"]*) successfully added in SEO$")
	public void ill_see_Product_successfully_added(String arg1) throws Throwable, UnhandledAlertException {		
		
		//We'll think how we can validate this aside from obvious
		//which is Product is listed over the table
        
	}
	
	

	
	


}
