@Admin
Feature Ability to link a user to a privacy policy from the login page
  PRD ID - 361

  Background 
    Given Launch application

  @author-aarti
@TCID-TC4139 @regression @approved
  Scenario Configure privacy policy message
    Given Perform successful login
       username        password        usertype 
       testUsername  testPassword  admin    
    And Select organization as OrganizationName
    And Navigate to Privacy Policy under Users section of Admin main menu
    When Edit the privacy policy message as To review our Privacy Policy for <OrganizationName> please click HERE
    And Click on update button on privacy policy editor page
    Then Validate summary message as The Privacy Policy has been successfully saved.

  @author-aarti 
  @TCID-TC4140 @regression @approved
  Scenario Verify privacy policy message for a new user
    Given Configure privacy policy message
       username        password        usertype  organization     
       testUsername  testPassword  admin     OrganizationName 
    And Navigate to Manage Users under Users section of Admin main menu
    And Create a new user
       user_Name  default_Org       user_Role_Org     assign_Role         first_Name  last_Name  email               
       Test_User  OrganizationName  OrganizationName  Organization Admin  User123     test123    test123@yopmail.com 
    And Validate summary message as The user has been successfully saved.,A temporary password has been sent to the email address associated with the user account.
    And User logout from the application
    When Login with username and password
       username   password      usertype           
       Test_User  temppassword  Organization Admin 
    And Change Password from old_Password to new_Password for username
       old password   new Password  confirm Password  Username  
       temp_password  password1234  password1234      Test_User 
    Then Validate password change success message Congratulations! You have successfully changed your password. Click the link below to continue. and continue
    And Setup RSA Answers and continue
       Question1  Question2  Question3  Answer1  Answer2  Answer3   
       Default    Default    Default    Auto     Auto     Auto      
    And Validate overlay-popup as To review our Privacy Policy for <OrganizationName> please click HERE
