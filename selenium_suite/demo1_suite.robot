*** Settings ***
Library     SeleniumLibrary
Test Teardown      Close Browser

*** Variables ***
${BROWSER}      chrome
#basic selenium - day1
*** Test Cases ***
TC1
    Open Browser    url=https://www.facebook.com/       browser=${BROWSER}

    Sleep    5s
    #get the title and print
    ${actual_title}     Get Title
    Log To Console    ${actual_title}

    ${actual_url}      Get Location
    Log To Console    ${actual_url}

    ${page_source}     Get Source
    Log    ${page_source}

TC2
    Open Browser   browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://www.facebook.com/       
    Input Text    id:mail    bala123434@gmail.com
    Input Password    id=pass    welcome123
    #click on login
    Click Element    name=login

TC3
    Open Browser   browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://www.facebook.com/
    #click on Create new account
    Click Element    link=Create new account
    #enter first name as john
    Input Text    name=firstname    Balaji
    #enter lastname as wick
    Input Text    name=lastname    Dinakaran
    
    Select From List By Label    id=day     31
    Select From List By Label    id=month   Dec
    #select year as 2000

    # 20 Dec 2000
    #click on gender - custom
    Click Element    xpath=//input[@value='-1']

    #click sign up