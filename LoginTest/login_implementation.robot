*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${username}    admin
${password}    12345
${url}         http://testing-ground.scraping.pro/login
${browser}     chrome

*** Keywords ***

User opens testing page
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

User enters username
    Input text    //*[@id="usr"]    ${username}

User enters password
    Input Text    //*[@id="pwd"]    ${password}

User tries to login
    Click Button    //*[@id="case_login"]/form/input[3]

Welcome page should be opened with text WELCOME
    Wait Until Page Contains Element    //*[@id="case_login"]/h3
    ${text}    Get Text    //*[@id="case_login"]/h3
    Log Many    ${text}
    Should Be Equal As Strings    ${text}    	WELCOME :)

User logs out
    Click Link    //*[@id="case_login"]/a
    Wait Until Page Contains Element    //*[@id="case_login"]/h3
    ${text}    Get Text    //*[@id="case_login"]/h3
    Log Many    ${text}
    Should Be Equal As Strings    ${text}    Please, login:
    Close Browser