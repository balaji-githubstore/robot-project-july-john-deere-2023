
*** Settings ***
Library     SeleniumLibrary


Test Teardown   Close Browser

*** Test Cases ***
TC1 Javascript
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.citibank.co.in/ssjsps/forgetuseridmidssi.jsp
    Click Element    link=select your product type
    Click Element    link=Credit Card
    Scroll Element Into View    css=#bill-date-long
    Execute Javascript      document.querySelector('#bill-date-long').value='14/10/2000'
    ${value}    Get Element Attribute    css=#bill-date-long    value
    Log To Console    ${value}
    ${value}       Get Value    css=#bill-date-long
    Log To Console    ${value}

    ${res}      Execute Javascript      return document.querySelector('#bill-date-long').value
    
    ${log_error}    Execute Javascript  return window.performance.getEntries()
    Log To Console    ${log_error}
    Log To Console    ${res}
    Sleep    2s

TC2 WebElement and Javascript
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.citibank.co.in/ssjsps/forgetuseridmidssi.jsp
    Click Element    link=select your product type
    Click Element    link=Credit Card
    Scroll Element Into View    css=#bill-date-long
    ${ele}      Get WebElement    xpath=//input[@id='bill-date-long']
    Execute Javascript      arguments[0].value='14/10/2000'     ARGUMENTS      ${ele}
    ${value}    Get Element Attribute    css=#bill-date-long    value
    Log To Console    ${value}
    ${value}       Get Value    css=#bill-date-long
    Log To Console    ${value}
    Sleep    2s

TC4
    Open Browser    browser=chrome   options=add_argument("start-maximized");add_argument("--disable-notifications")
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.irctc.co.in/nget/
    Sleep    10s

TC3
    &{pref_dir}      Create Dictionary       download.default_directory=C:${/}Mine${/}Demo
    Open Browser    browser=chrome      options=add_experimental_option("prefs",&{pref_dir})
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.selenium.dev/downloads/
#    Scroll Element Into View    link=Chrome
#    Click Element    link=32 bit Windows IE
    ${ele}      Get WebElement    link=32 bit Windows IE
    Execute Javascript      arguments[0].click()    ARGUMENTS      ${ele}
    Sleep    10s

TC5
    &{emu}      Create Dictionary       deviceName=Pixel 4
    Open Browser    browser=chrome      options=add_experimental_option("mobileEmulation",${emu})
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
      Go To    url=https://www.selenium.dev/downloads/
#    Scroll Element Into View    link=Chrome
#    Click Element    link=32 bit Windows IE
    ${ele}      Get WebElement    link=32 bit Windows IE
    Execute Javascript      arguments[0].click()    ARGUMENTS      ${ele}
    Sleep    10s

TC6
    Open Browser    browser=chrome      alias=b1
    Open Browser    browser=edge    alias=b2
    Go To    url=http://google.com
    Switch Browser    b1
    Go To    url=http://facebook.com
    Close All Browsers






