*** Comments ***
Navigate to https://www.salesforce.com/in/form/signup/freetrial-sales/
Enter first name as “John”
Enter last name as “wick”
Enter work email as “john@gmail.com”
Select Job title as “IT Manager”
Select Employees as “101-500 employees”
Select country as “United Kingdom”
Do not fill the phone number
Click on check box
Click on start my free trial
Validate the error message displayed “Enter a valid phone number”

*** Settings ***
Library     SeleniumLibrary     
Library    DatabaseLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.salesforce.com/in/form/signup/freetrial-sales/
    Input Text    name=UserFirstName    bala
    Input Text    xpath=//input[contains(@id,'UserLast')]    dina
    Input Text    name=UserEmail    bala@gmail.com
    Input Text    name=CompanyName    CCCS
    Select From List By Label    name=UserTitle     IT Manager
    Select From List By Label    name=CompanyCountry    United Kingdom
    Select From List By Value    name=CompanyEmployees      150
    Click Element    xpath=//select[@name='CompanyCountry']/following::div[@class='checkbox-ui']
    Click Element    name=start my free trial
    Element Text Should Be    //span[contains(@id,'UserPhone')]    Enter a valid phone number
    Row Count Is Equal To X    select * from Products where first_name='bala' and lastname='dina'   1
























