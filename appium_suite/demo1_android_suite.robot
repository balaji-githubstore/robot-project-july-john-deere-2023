*** Settings ***
Library    AppiumLibrary



Test Teardown       Close Application

*** Keywords ***
Wait and Click On Element
    [Arguments]     ${locator}
    Wait Until Page Contains Element     ${locator}
    Click Element   ${locator} 

Wait And Input Text
    [Arguments]     ${locator}  ${text}
    Wait Until Page Contains Element     ${locator}
    Input Text    ${locator}    ${text}

*** Test Cases ***
TC1
    &{option}   Create Dictionary
    ...  userName=dinakaranbalaji1     accessKey=6yXRE4nK1fyvTHWA2kPD
    ...  buildName=JohnDeereBuild   projectName=JohnDeereProject
    ...   sessionName=JohnDeereSession
     Open Application    remote_url=http://hub.browserstack.com/wd/hub
    ...  platformName=android   platformVersion=9.0     deviceName=Google Pixel 3
    ...   app=bs://d2c5e5bb50109f3b459472754a2c4d2c398d15a6
    ...   bstack:options=${option}

    Set Appium Timeout   30s
    Wait and Click On Element    xpath=//*[@text='Dismiss']
    Wait and Click On Element    xpath=//android.widget.TextView[@text='Sign in']
    Wait and Click On Element    xpath=//android.widget.TextView[@text='Sign in']
    Wait And Input Text    xpath=//android.widget.EditText[@text='Enter an e-mail address or username']    hello
    Wait And Input Text    xpath=//*[contains(@content-desc,'Pass')]    hello
    Wait and Click On Element    xpath=(//*[@text='Sign in'])[2]
    Element Should Contain Text     xpath=//*[contains(@text,'issue')]          There was an issue signing in
    
    
    Swipe    939    1144    955    695
    
    Swipe By Percent    90    75    90    25    1000
    #CLick on Sign in
    #Click on Sign in
    #Enter username as demo@gmail.com
    #Enter password as demo1223
    #click on login
#    Validate the error message
#    ${page_source}   Get Source
#    Log     ${page_source}

TC2
    &{option}   Create Dictionary
    ...  userName=dinakaranbalaji1     accessKey=6yXRE4nK1fyvTHWA2kPD
    ...  buildName=JohnDeereBuild   projectName=JohnDeereProject
    ...   sessionName=JohnDeereSession
     Open Application    remote_url=http://hub.browserstack.com/wd/hub
    ...  platformName=android   platformVersion=9.0     deviceName=Google Pixel 3
    ...   app=bs://d2c5e5bb50109f3b459472754a2c4d2c398d15a6
    ...   bstack:options=${option}

    Set Appium Timeout   30s
    Wait and Click On Element    xpath=//*[@text='Dismiss']
    Wait and Click On Element    xpath=//*[@text='Search']
    Wait and Click On Element    xpath=//*[contains(@text,'Art')]
    
    ${count}        AppiumLibrary.Get Matching Xpath Count    xpath=//*[@text='World History']
    WHILE     ${count}==0
         Swipe By Percent    90    75    90    25    1000
         ${count}        AppiumLibrary.Get Matching Xpath Count    xpath=//*[@text='World History']
    END
    
    Wait and Click On Element    xpath=//*[@text='World History']
