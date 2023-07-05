*** Settings ***
Library     FakerLibrary
Library    SeleniumLibrary

*** Test Cases ***
TC1
    ${word}     FakerLibrary.Word
    Log To Console    ${word}
    ${fname}    FakerLibrary.First Name
    Log To Console    ${fname}
    ${card_number}    FakerLibrary.Credit Card Number
    Log To Console    ${card_number}
    Input Text      xpath=//input       ${fname}
#    SeleniumLibrary.Input Text    locator    text