*** Settings ***
Library    String

*** Test Cases ***
TC1
    Log To Console    hello${SPACE}${SPACE}${SPACE}orld
    Log To Console    message=robot session

TC2
     ${my_name}     Set Variable    balaji
     Log To Console    ${my_name}
     Log    ${my_name}

TC3
    ${radius}=   Set Variable    10
    ${res}      Evaluate    3.14*${radius}*${radius}
    Log To Console    ${res}
    Should Be Equal As Numbers    ${res}    314
#    Should Be Equal    ${res}    314

TC4
    ${num1}     Set Variable    $${SPACE}${SPACE}${SPACE}120,440,000
    ${num2}     Set Variable    $120,000
    ${num1}     Remove String   ${num1}     $   ,   ${SPACE}
    ${num2}     Remove String   ${num2}     $   ,
    Log To Console    ${num1}${num1}
#    ${num1}  Convert To Number    ${num1}

    ${res}   Evaluate    ${num1}+${num2}
    Log To Console    ${res}




