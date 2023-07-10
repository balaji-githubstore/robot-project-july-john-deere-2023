*** Settings ***
Library     demo1.py
Variables   variables.py

*** Test Cases ***
TC1
    ${res}      Add Two Value    2    2
    Log To Console    ${res}
    Log To Console    ${name}
    Log To Console    ${mobile}


TC2

    
    
    