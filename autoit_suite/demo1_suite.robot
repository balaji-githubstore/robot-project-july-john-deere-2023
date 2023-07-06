*** Settings ***
Library     AutoItLibrary
Library    SeleniumLibrary
Test Teardown   Close Browser

*** Comments ***
http://the-internet.herokuapp.com/basic_auth
http://username:password@the-internet.herokuapp.com/basic_auth

#1. windows auth
#2. Upload activity

https://www.autoitscript.com/autoit3/docs/appendix/SendKeys.htm

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Go To    url=http://admin:admin@the-internet.herokuapp.com/basic_auth
    Sleep    2s

TC2
    Open Browser    browser=chrome
    Go To    url=http://the-internet.herokuapp.com/basic_auth
    Win Wait Active    WindowTitle=the-internet.herokuapp.com/basic_auth - Google Chrome
    ...     WindowText=${EMPTY}    TimeOut=15
    AutoItLibrary.Send      admin
    AutoItLibrary.Send      {TAB}
    AutoItLibrary.Send      admin
    AutoItLibrary.Send      {ENTER}
    Sleep    5s

TC3
    Open Browser    browser=chrome
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Click Element    id=pickfiles
    Sleep    2s
    AutoItLibrary.Control Focus     strTitle=Open      strText=${EMPTY}    strControl=Edit1
    AutoItLibrary.Control Set Text  strTitle=Open      strText=${EMPTY}    strControl=Edit1
    ...   strControlText=C:${/}Mine${/}Balaji-Profile_2023_1.pdf
#    AutoItLibrary.Send      {ENTER}
    AutoItLibrary.Control Click     strTitle=Open   strText=${EMPTY}   strControl=Button1
    Page Should Contain    Convert to WORD
    Sleep    5s





