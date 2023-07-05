*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Launch Browser
    [Arguments]     ${browser}
    Open Browser    browser=${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    
Click Checkbox By Name
    [Arguments]     ${name}
    FOR    ${i}    IN RANGE    1    11
        ${name}     Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}
        #check the name and click on checkbox for Brenden Wagner
        IF    'Jonas' in '${name}'
            Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
            BREAK
        END
    END

*** Test Cases ***
TC1
    Launch Browser      chrome
    ${name1}     Get Text    xpath=//table[@id='example']/tbody/tr[1]/td[2]
    Log To Console    ${name1}

TC2
    Launch Browser      chrome
    FOR    ${i}    IN RANGE    1    11
        ${name1}     Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name1}
    END

TC3 Click on Checkbox For Brenden Wagner
    Launch Browser      chrome
    FOR    ${i}    IN RANGE    1    11
        ${name}     Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}
        #check the name and click on checkbox for Brenden Wagner
        IF    '${name}'=='Brenden Wagner'
            Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
            BREAK
        END
    END

TC4 Print All Page Name
    Launch Browser      chrome
    ${flag}     Set Variable    'False'
    FOR    ${page}    IN RANGE    1    7
        ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
        FOR    ${i}    IN RANGE    1    ${row_count}+1
            ${name1}     Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            Log To Console    ${name1}
            IF    'Jonas' in ${name1}
#                Run Keyword If    '${name1}'=='Brenden'  Run Keywords    Log Title   AND  Log To Console    hello
                Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
                ${flag}     Set Variable    'True'
                BREAK
            END
        END
        Exit For Loop If    '${flag}'=='True'
        Click Element    link=Next
    END

TC5 Click on Checkbox For Jonas
    Launch Browser      chrome
    FOR    ${page}    IN RANGE    1    6
        Click Checkbox By Name    Jonas
        Click Element    link=Next
    END

TC6
    Launch Browser    chrome
    Table Should Contain    //table[@id='example']    Brenden Wagner
    Table Row Should Contain    //table[@id='example']    1    Airi Satou
    