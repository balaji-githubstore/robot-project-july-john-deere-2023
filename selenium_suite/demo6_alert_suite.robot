*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    #Click on go
    Click Element    xpath=//img[@alt='Go']
    #do it after the break time
    ${actual_alert_text}    Handle Alert    action=ACCEPT   timeout=30s
    Log To Console    ${actual_alert_text}
    Should Be Equal As Strings    ${actual_alert_text}    Customer ID${SPACE}${SPACE}cannot be left blank.
