*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1 Switch window using title
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.db4free.net/
    #click on phpMyAdmin »
    Click Element    partial link=phpMyAdmin
    Switch Window   phpMyAdmin
    #enter username as admin
    Input Text    id=input_username    admin
    Input Password    id=input_password    admin123
    Click Element    id=input_go
    # validate the error message contains  "Access denied for user"
    Element Should Contain    id=pma_errors    Access denied for user
    Close Window
    Switch Window   db4free.net - MySQL Database for free
    ${actual_title}     Get Title
    Log To Console    ${actual_title}
    Title Should Be    db4free.net - MySQL Database for free
    #get the title from 1st tab and print
    Sleep    5s
    Close Browser

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
#    Set Selenium Timeout    30s
#    Set Selenium Speed    1s
    Go To    url=https://www.db4free.net/
    #click on phpMyAdmin »
#    SeleniumLibrary.Wait Until Page Contains Element    partial link=phpAdmin 
    Click Element    partial link=phpMyAdmin
    Switch Window   NEW
    #enter username as admin
    Input Text    id=input_username    admin
    Input Password    id=input_password    admin123
    Click Element    id=input_go
    # validate the error message contains  "Access denied for user"
    Element Should Contain    id=pma_errors    Access denied for user
    Close Window
    Switch Window   MAIN
    ${actual_title}     Get Title
    Log To Console    ${actual_title}
    Title Should Be    db4free.net - MySQL Database for free
    #get the title from 1st tab and print
    Sleep    5s
    [Teardown]   Run Keywords   Close Browser  AND  Log  Browser Close done

TC4
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.db4free.net/
    Sleep    2s
    Press Keys  None    CONTROL+SHIFT+C
    Sleep    5s
    Capture Page Screenshot
    Close Browser