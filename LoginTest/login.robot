*** Settings ***
Documentation    Test cases for login
Resource         login_Implementation.robot
Force Tags       login
*** Test Cases ***

Login Test, Happy Flow
    [Tags]    login
    Given User opens testing page
    And User enters username
    And User enters password
    When User tries to login
    Then Welcome page should be opened