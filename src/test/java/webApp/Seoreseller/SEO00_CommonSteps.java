package webApp.Seoreseller;

import org.junit.Assert;
import org.openqa.selenium.UnhandledAlertException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import com.Utilities.QueryDatabase;

import cucumber.Framework.Helper;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class SEO00_CommonSteps extends Helper{
	@FindBy(xpath="//nav[@id='main-menu']//li/a[text()='Home']")
	WebElement SrsHome_Link;
	
	@FindBy(xpath="//div//img")
	WebElement SrsBanner_Image;
	
	@FindBy(xpath="//button[@class='login_button btn btn-primary text-uppercase']")
	WebElement LoginToYourDashBoard_Button;
	
	@FindBy(xpath="//div[contains(.,'Link will only be valid for 24 hours')]")
	WebElement LinkValidFor2Hrs_Text;
	
	@FindBy(xpath="//div//a[text()='Reset your Password']")
	WebElement ResetYourPassword_Button;
	
	@FindBy(xpath="//span[text()='Ignore, I trust this message']")
	WebElement GoogleIgnoreMessage_Alert;
	
	@FindBy(xpath="//div[text()='This message is to confirm that you changed your password. Please see details:']")
	WebElement ConfirmPasswordIsChange_Text;
	
	@FindBy(xpath="//div[@class='ii gt']//div/a[contains(text(),'account')]")
	WebElement ResetYourPassword_Link;
	
	public SEO00_CommonSteps() {
		PageFactory.initElements(driver, this);
		
	}
	
	@Given("^Im an existing Partner$")
	public void im_an_existing_Partner() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	}
	
	@Given("^Im a new Partner$")
	public void im_a_new_Partner() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	}
	
	@Then("^Ill see the Dashboard Page$")
	public void ill_see_the_dashboard_page() throws Throwable {
        Thread.sleep(3000);
		Assert.assertEquals(true, SrsHome_Link.isDisplayed());
	}
	
	@When("^Ill not be redirected to the Dashboard")
	public void ill_not_be_redirected_to_dashboard() throws Throwable, UnhandledAlertException {
		Assert.assertEquals(true, SrsBanner_Image.isDisplayed());
	}
	
	@Then("^Ill see the Log In Page")
	public void ill_see_the_login_page() throws Throwable, UnhandledAlertException {
        Thread.sleep(3000);
		Assert.assertEquals(true, LoginToYourDashBoard_Button.isDisplayed());
	}
	
	@Then("^Ill see the \'Hi Partner, To reset your password please click on the button below. Link will only be valid for 24 hours:\' Message")
	public void ill_see_the_link_valid_for_24_hours_message() throws Throwable, UnhandledAlertException {
		Assert.assertEquals(true, LinkValidFor2Hrs_Text.isDisplayed());
	}
	
	@Then("^Ill see the Reset Your Password button")
	public void ill_see_the_reset_password_button() throws Throwable, UnhandledAlertException {
		Assert.assertEquals(true, ResetYourPassword_Button.isDisplayed());
	}
	
	@When("^I click the Reset ([^\"]*)$")
	public void i_click_the_reset_password_button(String resetRedirect) throws Throwable, UnhandledAlertException {
				Thread.sleep(3000);
				if(resetRedirect.equals("Reset Your Password")){
					ResetYourPassword_Button.click();
				}else if(resetRedirect.equals("Reset Password Link")){
					ResetYourPassword_Link.click();
				}
				Thread.sleep(3000);
				ReUsablesKeyword.switchtochildwindow();
	}
	
	@When("^I navigate back to my mailbox$")
	public void i_navigate_back_to_my_mailbox() throws Throwable, UnhandledAlertException {
		ReUsablesKeyword.switchtoparentwindow();
	}
	
	@Then("^Ill see the \'Hello,This message is to confirm that you changed your password.\' Message")
	public void ill_see_the_confirm_password_change_message() throws Throwable, UnhandledAlertException {
			Assert.assertEquals(true, ConfirmPasswordIsChange_Text.isDisplayed());
	}
	
	@Then("^I check if ([^\"]*) should not exist as pre condition$")
	public void ii_check_email_value_not_existing(String email) throws Throwable, UnhandledAlertException {
		String idNumber = QueryDatabase.ReturnSpecificData("SELECT * FROM tbl_user WHERE email='"+email+"'", "id");
		try{
			if(idNumber.equals(null)){
				
			}else{
				QueryDatabase.DeleteSpecificData("DELETE FROM tbl_user WHERE id="+idNumber+" AND site_id=1");
				QueryDatabase.DeleteSpecificData("DELETE FROM tbl_userinfo WHERE use_id="+idNumber+"");
				System.out.println("DATABASE : "+email +" with ID " + idNumber +" is now removed");
			}
			
		}catch(Exception e){
			System.out.println("DATABASE : Email is available and not yet registered");
		}			
	}
}