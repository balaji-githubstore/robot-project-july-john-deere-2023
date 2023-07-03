*** Settings ***
Library    Collections
*** Variables ***
${BROWSER_NAME}     chrome
@{COLORS}   red   green    yellow
#dic

*** Test Cases ***
TC1
    Log To Console    ${BROWSER_NAME}
    
TC2
    Log To Console    ${BROWSER_NAME}
    ${value1}     Set Variable    hello
    Set Local Variable    ${value2}     hello2

TC3
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[0]
    #print the size of the list
    ${len}  Get Length    ${COLORS}
    Log To Console    ${len}
    #append blue to the list
    Append To List  ${COLORS}   blue
    #remove value red
    Remove Values From List    red
    #insert value black at index 1
    Insert Into List    ${COLORS}    1    black
    #Log the list to the report
    Log To Console    ${COLORS}
    
TC4
    @{fruits}     Create List     mango   orange      kiwi
    Log To Console    ${fruits}

