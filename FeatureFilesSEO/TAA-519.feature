#Author: reuel@truelogic.com.ph, lorraine@truelogic.com.ph
#Version 1.0 01.28 2019 - Initial creation of file
Feature: [TAA-519] [SEOReseller] Support Menu Smoke/Regression TestSuite

  #Scenario Description:
	#Given I am a Partner
	#When I hover to the support menu
	#And I click the Getting Started Link
	#Then see the Getting Started Blog
  @SRSSMOKETEST @SupportMenu @SupportMenu_TS01 @TAA-520
  Scenario Outline: TAA-520
		Given Im a new Partner
    When I navigate to "Login"
    And I populate the SEOE6_EmailAddress textfield with <email>
    And I populate the SEOE6_Password textfield with <password>
    And I click the SEO06_LoginToYourDashBoard button
    And I wait for page to load
    Then Ill see the SEO00_Dashboard page
    
    When I hover to SEO00_SupportMenu link
    Then Ill see the SEO00_GettingStarted link
    And Ill see the SEO00_LearnTheBasic "Learn the basics to get productive with our marketing suite in minutes." text
    
    When I click the SEO00_GettingStarted link
    Then Ill be redirected to the SEO00_Helpcenter
    And Ill see the SEO00_GettingStarted header
    
    Examples: 
			| FirstName | LastName   | email                     | password  |
      | RND       | Automation | lorraine@truelogic.com.ph | 123456789 |