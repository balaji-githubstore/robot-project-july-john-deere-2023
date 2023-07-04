*** Settings ***
Library     SeleniumLibrary     run_on_failure=None
Library    Collections

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/
    #enter userid as test123
    Select Frame    xpath=//frame[@name='login_page']
    Input Text    name=fldLoginUserId    test123
    #click on continue

    Unselect Frame
    Sleep    2s
    [Teardown]   Close Browser

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=file:///C:/Mine/HTML/demo1.html
    Input Text    id=fname    hello
    Select Frame    id=frame1
    Select Frame    id=frame1A
    Input Text    id=fname3    hello2
    Unselect Frame
    Input Text    id=fname    againhello   clear=False
    Sleep    5s
    Close Browser

