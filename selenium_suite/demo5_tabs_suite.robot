*** Comments ***
Task 1 – Important
Navigate onto https://www.online.citibank.co.in/
Close if any pop up comes
Click on Login
Click on Forgot User ID?
Choose Credit Card
Enter credit card number as 4545 5656 8887 9998
Enter cvv number
Enter date as “14/10/2000”
Click on Proceed
Get the text and print it “Please accept Terms and Conditions”

*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.online.citibank.co.in/
    ${count}        Get Element Count    xpath=//a[@class='newclose']
    Log To Console    ${count}
     ${count}        Get Element Count    xpath=//a[@class='newclose123']
    Log To Console    ${count}
    Click Element    xpath=//a[@class='newclose']
    Click Element    xpath=//a[@class='newclose2']
#    Click Element    xpath=//a[@class='newclose3']
    Click Element    xpath=//span[text()='Login']
    Switch Window   NEW
    Click Element    xpath=//div[contains(text(),'Forgot User')]
    Click Element    link=select your product type
    Click Element    link=Credit Card
    Input Text    css=#citiCard1    1233
    Input Text    css=input[name='citiCard2']    3444
    Input Text    css=[name='citiCard3']    1233
    Input Text    css=#citiCard4    1233
    Input Text    id=cvvnumber    666
    #approach 1 - not working in this page
#    Input Text    id=bill-date-long    14/10/2000

    #approach 2
    Click Element    id=bill-date-long
    #select year
    Select From List By Label    xpath=//select[@data-handler='selectYear']     2000
    #select month
    Select From List By Label    xpath=//select[@data-handler='selectMonth']    Oct
    Click Element    link=14
    #click date
    Click Element    css=[value='PROCEED']
    Element Should Contain    //li[contains(text(),'Terms')]    Please accept Terms and Conditions
#   Element Should Contain    //div[@role='dialog']   Please accept Terms and Conditions
    Sleep    2s
    [Teardown]      Close Browser

    
TC3
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.online.citibank.co.in/
    ${count}        Get Element Count    xpath=//a[@class='newclose']
    Log To Console    ${count}
    IF    ${count}>0
         Click Element    xpath=//a[@class='newclose']
    END
    ${count}        Get Element Count    xpath=//a[@class='newclose123']
    Log To Console    ${count}
    [Teardown]      Close Browser


TC4
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.online.citibank.co.in/
    Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose']
    Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose2']
    @{output}     Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose233']
    Log    ${output}
    Log    ${output}[0]
    Log    ${output}[1]
    ${count}    Set Variable      1
    WHILE    '${output}[0]'=='FAIL'
            @{output}     Run Keyword And Ignore Error    Click Element    xpath=//a[@class='newclose233']
            ${count}    Evaluate    ${count}+1
            IF  ${count}==100
                BREAK
            END
    END
    Click Element    xpath=//span[text()='Login']
#    Wait Until Keyword Succeeds    Cli    retry_interval    name