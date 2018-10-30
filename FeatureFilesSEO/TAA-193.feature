#Author: lorraine@truelogic.com.ph
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
Feature: [TAA-193] [SEOReseller]: Lead Generator Smoke/Regression TestSuite

  #Scenario Description:
  #Given I'm a User
	#When I enter a website
	#And I click "Run New Audit(Beta)" Button
	#Then my report will generated using the web audit tool 
	#And I can view the report
  @SRSSMOKETEST @LeadGen @LeadGen_TS01 @TAA-302
  Scenario Outline: TAA-302
    Given Im an existing Partner
		When I navigate to "Login"
		And I populate the SEOE6_EmailAddress textfield with <email>
		And I populate the SEOE6_Password textfield with <password>
		And I click the SEO06_LoginToYourDashBoard button
		Then I see the SEO01_Home Page
		
		When I click the SEO01_LeadGenQuickAccess icon
		And I populate SEO15_Location textfield with US location coming from the test data file
		And I populate SEO15_Keyword textfield with <keyword>
		And I click the the SEO15_GenerateLeads button
		And I click the SE014_ViewLeads button of <keyword> in location from the test data file
		Then Ill see the SE014_LeadGen table
		And Ill see that SEO15_TotalLeadsFound is equal to the row count returned
		And Ill see that the Company Name is available per row

    Examples: 
      | email                | password  |           keyword       |
      | tlosrnd321@gmail.com | happy123  |      veterinary clinic  |
      
	#Given I am a user
	#And I open Lead Generator
	#When I enter text that does not match any location in Yellow Pages or Google Places
	#Then I will see the text "No locations found." in red under the field
  @SRSSMOKETEST @LeadGen @SRS-5943_TS01 @TAA-303
  Scenario Outline: TAA-303
    Given Im an existing Partner
		When I navigate to "Login"
		And I populate the SEOE6_EmailAddress textfield with <email>
		And I populate the SEOE6_Password textfield with <password>
		And I click the SEO06_LoginToYourDashBoard button
		Then I see the SEO01_Home Page
		
		When I click the SEO01_LeadGenQuickAccess icon
		Then Ill be redirected to Lead Generator page
		
		And I populate SEO15_Location textfield with <location>
		And I populate SEO15_Keyword textfield with <keyword>
		Then Ill see the SEO15_ErrorMessage 'No search results for this niche.' in red under the field


    Examples: 
      | email                | password  |       location      |
      | tlosrnd321@gmail.com | happy123  |   Akihabara, Japan  |      
      
	#Given I am a user
	#And I open Lead Generator
	#And I have selected a US location
	#When I enter text on the Niche field that does not match any of the Autocomplete listings for Yellow Pages
	#Then I will see the text "No search results for this niche." in red under the field
  @SRSSMOKETEST @LeadGen @SRS-5943_TS02 @TAA-304
  Scenario Outline: TAA-304
    Given Im an existing Partner
		When I navigate to "Login"
		And I populate the SEOE6_EmailAddress textfield with <email>
		And I populate the SEOE6_Password textfield with <password>
		And I click the SEO06_LoginToYourDashBoard button
		Then I see the SEO01_Home Page
		
		When I click the SEO01_LeadGenQuickAccess icon
		Then Ill be redirected to Lead Generator page
		
		When I populate SEO15_Location textfield with <location>
		And I enter the keyword '<keyword>' that will not display results list
		Then Ill see the SEO15_ErrorMessage 'No search results for this niche.' in red under the field

    Examples: 
      | email                | password  |       location      |      keyword        |      
      | tlosrnd321@gmail.com | happy123  |   New York, USA     |   Video Marketing   |
     
      
	#Given I am a user
	#And I have selected a Non-US location
	#When I enter <characters> in the niche field
	#Then the Generate Leads button will be enabled
  @SRSSMOKETEST @LeadGen @SRS-5943_TS03 @TAA-305
  Scenario Outline: TAA-305
    Given Im an existing Partner
		When I navigate to "Login"
		And I populate the SEOE6_EmailAddress textfield with <email>
		And I populate the SEOE6_Password textfield with <password>
		And I click the SEO06_LoginToYourDashBoard button
		Then I see the SEO01_Home Page
		
		When I click the SEO01_LeadGenQuickAccess icon
		Then Ill be redirected to Lead Generator page
		And Ill see SEO15_Location textfield
		And Ill see SEO15_Keyword textfield
		And Ill see SEO15_GenerateLeads button is Disabled
		
		When I populate SEO15_Location textfield with <location>
		And I enter the keyword '<characters>' that will not display results list
		Then Ill see SEO15_GenerateLeads button is Enabled

    Examples: 
      | email                | password  |              location                 |      characters     |      
      | tlosrnd321@gmail.com | happy123  |   Makati, Metro Manila, Philippines   |           L         |
      | tlosrnd321@gmail.com | happy123  |   Makati, Metro Manila, Philippines   |     UST Comp Sci    |
      
	#Given I am a user
	#And I have selected a Non-US location
	#When I enter <characters> in the niche field
	#And I see that the generate Leads button was enabled
	#And I click  the generate leads button
	#Then the Niche textbox will be highlighted in red
	#And I will see the text "Search term must be 3 characters and above." in red under the field
	#And I will not generate any leads
  @SRSSMOKETEST @LeadGen @SRS-5943_TS04 @TAA-306
  Scenario Outline: TAA-306
    Given Im an existing Partner
		When I navigate to "Login"
		And I populate the SEOE6_EmailAddress textfield with <email>
		And I populate the SEOE6_Password textfield with <password>
		And I click the SEO06_LoginToYourDashBoard button
		Then I see the SEO01_Home Page
		
		When I click the SEO01_LeadGenQuickAccess icon
		Then Ill be redirected to Lead Generator page
		And Ill see SEO15_Location textfield
		And Ill see SEO15_Keyword textfield
		And Ill see SEO15_GenerateLeads button is Disabled
		
		When I populate SEO15_Location textfield with <location>
		And I enter the keyword '<characters>' that will not display results list
		And I click the the SEO15_GenerateLeads button
		And Ill see the SEO15_ErrorMessage 'Search term must be 3 characters and above.' in red under the field


    Examples: 
      | email                | password  |              location                 |  characters  |      
      | tlosrnd321@gmail.com | happy123  |   Makati, Metro Manila, Philippines   |      L       |
      | tlosrnd321@gmail.com | happy123  |   Makati, Metro Manila, Philippines   |     ca       |