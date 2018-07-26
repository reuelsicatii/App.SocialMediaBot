#Author: reuel@truelogic.com.ph, lorraine@truelogic.com.ph
#Version 1.0 06.27 2018 - Initial creation of file
Feature: [TAA-37] SRS Forgot Password Smoke Test Suite v0.1

  #Scenario Description:
  #Covered Tickets : SRS-2493, SRS-3106
  #Given I'm a existing Partner
  #When I Click Forgot Password
  #And Successfully Changed the Password
  #Then I'll see the Dashboard Page
  @SRSSMOKETEST @ForgotPassword @ForgotPassword_TS01 @TAA-43
  Scenario Outline: TAA-43
    Given Im an existing Partner
    When I navigate to "SEOSTG_Login"
    And I click the SEO06_ForgotPassword link
    Then Ill see the SEO08_ForgotPassword page
    And Ill see the SEO08_SRS banner
    When I enter <Email> in the SEO08_EnterEmail textfield
    And I click the SEO08_Submit button
    Then Ill see the 'You are almost in your account' Message
    When I open my <Domain> mailbox using my <Email> and <Password>
    And I click the email with Subject <Subject>
    Then Ill see the 'Hi Partner, To reset your password please click on the button below. Link will only be valid for 24 hours:' Message
    And Ill see the SEO00_ResetYourPassword button
    When I click the SEO00_Reset <Condition>
    Then Ill see the Reset Password Page
    And Ill see the Verbiage 'Should be at least 8 characters'
    And Ill see the toggle for visibility
    And Ill see the Back to Login page Link
    When I enter <NewPassword> in the SEO09_Password textfield
    And I click the SEO09_Submit button
    Then Ill see the Dashboard Page
    When I navigate back to my mailbox
    And I click the email with Subject <PasswordUpdated>
    Then Ill see the 'Hello,This message is to confirm that you changed your password.' Message
    And Ill delete all the email in <Domain> for post condition

    Examples: 
      | Email                        | Password  | Domain | Subject                        | Condition           | NewPassword | PasswordUpdated                       |
      | RNDAutomationTest8@gmail.com | happy123$ | google | Reset Account Password Request | Reset Your Password | happy123    | Account Password successfully updated |
      | RNDAutomationTest8@gmail.com | happy123$ | google | Reset Account Password Request | Reset Your Password | happyabc    | Account Password successfully updated |
      | RNDAutomationTest8@gmail.com | happy123$ | google | Reset Account Password Request | Reset Your Password |    12345678 | Account Password successfully updated |
      | RNDAutomationTest8@gmail.com | happy123$ | google | Reset Account Password Request | Reset Password Link | happy123    | Account Password successfully updated |
      | RNDAutomationTest8@gmail.com | happy123$ | google | Reset Account Password Request | Reset Password Link | happyabc    | Account Password successfully updated |
      | RNDAutomationTest8@gmail.com | happy123$ | google | Reset Account Password Request | Reset Password Link |    12345678 | Account Password successfully updated |

  #Scenario Description:
  #Covered Tickets : SRS-2493, SRS-3106
  #Given I'm a existing Partner
  #When I Click Forgot Password
  #And Unsuccessfully Changed the Password
  #Then I'll not see the Dashboard Page
  @SRSSMOKETEST @ForgotPassword @ForgotPassword_TS02 @TAA-44
  Scenario Outline: TAA-44
    Given Im an existing Partner
    When I navigate to "SEOSTG_Login"
    And I click the SEO06_ForgotPassword link
    Then Ill see the SEO08_ForgotPassword page
    And Ill see the SEO08_SRS banner
    When I enter <Email> in the SEO08_EnterEmail textfield
    And I click the SEO08_Submit button
    Then Ill see the 'You are almost in your account' Message
    When I open my <Domain> mailbox using my <Email> and <Password>
    And I click the email with Subject <Subject>
    Then Ill see the 'Hi Partner, To reset your password please click on the button below. Link will only be valid for 24 hours:' Message
    And Ill see the SEO00_ResetYourPassword button
    When I click the SEO00_Reset <Condition>
    Then Ill see the Reset Password Page
    And Ill see the Verbiage 'Should be at least 8 characters'
    And Ill see the toggle for visibility
    And Ill see the Back to Login page Link
    When I enter <NewPassword> in the SEO09_Password textfield
    And I click the SEO09_Submit button
    Then Ill see the 'The Password field must be at least 8 characters in length.' Message
    And Ill not be redirected to the Dashboard
    When I navigate back to my mailbox
    And Ill delete all the email in <Domain> for post condition

    Examples: 
      | Email                        | Password  | NewPassword | Subject                        | Domain | Condition           |
      | RNDAutomationTest9@gmail.com | happy123$ |         123 | Reset Account Password Request | google | Reset Your Password |
      | RNDAutomationTest9@gmail.com | happy123$ |         123 | Reset Account Password Request | google | Reset Password Link |

  #Scenario Description:
  #Covered Tickets : SRS-2493, SRS-3106z
  #Given I'm a existing Partner
  #When I Click Forgot Password
  #And did not change the Password
  #Then I'll see the Dashboard Page
  @SRSSMOKETEST @ForgotPassword @ForgotPassword_TS03 @TAA-45
  Scenario Outline: TAA-45
    Given Im an existing Partner
    When I navigate to "SEOSTG_Login"
		And I click the SEO06_ForgotPassword link
    Then Ill see the SEO08_ForgotPassword page
    And Ill see the SEO08_SRS banner
    When I enter <Email> in the SEO08_EnterEmail textfield
    And I click the SEO08_Submit button
    Then Ill see the 'You are almost in your account' Message
    When I open my <Domain> mailbox using my <Email> and <Password>
    And I click the email with Subject <Subject>
    Then Ill see the 'Hi Partner, To reset your password please click on the button below. Link will only be valid for 24 hours:' Message
    And Ill see the SEO00_ResetYourPassword button
    When I click the SEO00_Reset <Condition>
    Then Ill see the Reset Password Page
    And Ill see the Verbiage 'Should be at least 8 characters'
    And Ill see the toggle for visibility
    And Ill see the Back to Login page Link
    When I click the Back to Login page Link
    Then Ill see the Log In Page
    When I enter <Email> in the Email Address Field
    And I enter <Password> in the Password Field
    And I click the Log in to your Dashboard button
    Then Ill see the Dashboard Page
    When I navigate back to my mailbox
    And Ill delete all the email in <Domain> for post condition

    Examples: 
      | Email                         | Password  | Domain | Condition           | Subject                        |
      | RNDAutomationTest10@gmail.com | happy123$ | google | Reset Your Password | Reset Account Password Request |
      | RNDAutomationTest10@gmail.com | happy123$ | google | Reset Password Link | Reset Account Password Request |
