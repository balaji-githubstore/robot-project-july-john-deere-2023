*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://nasscom.in/about-us/contact-us
    #element should be present and visible
    Mouse Over    xpath=//a[text()='Membership']
    Click Element    xpath=//a[text()='Members Listing']

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://nasscom.in/about-us/contact-us
    #mouse over on membership
    #mouse over on become a member
    #click on membership benefits
    #Click To Apply Online
    Mouse Over    xpath=//a[text()='Membership']
    Mouse Over     xpath=//a[text()='Become a Member']
    Click Element    xpath=//a[text()='Membership Benefits']
    Click Element    xpath=//a[text()='Click to Apply Online']
    
TC3
     Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Choose File    xpath=//input[@type='file']   C:${/}Mine${/}Balaji-Profile_2023_1.pdf

*** Comments ***
    Navigate onto http://demo.openemr.io/b/openemr/
Update username as admin
Update password as pass
Select language as English (Indian)
Click on the login button
Click on Patient  Click New Search
Add the first name, last name
Update DOB as today's date
Update the gender
. Click on the create new patient button above the form
. Click on confirm create new patient button.
. Print the text from alert box (if any error before handling alert add 5 sec wait)
. Handle alert
Close the Happy Birthday popup
Get the added patient name and print in the console.

TC5
    Log To Console    hello\nworld\tdffddfdf
    Log To Console    C:\\Mine\\Balaji-Profile_2023_1.pdf
    Log To Console    C:${/}Mine${/}Balaji-Profile_2023_1.pdf
    Log To Console    ${CURDIR}
    Log To Console    ${EXECDIR}
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${TEMPDIR}





