*** Settings ***
Library     RPA.PDF

*** Test Cases ***
TC1
    ${count}    Get Number Of Pages     C:${/}Mine${/}Balaji-Profile_2023_1.pdf
    Log To Console    ${count}
    ${text_result}    Get Text From Pdf   C:${/}Mine${/}Balaji-Profile_2023_1.pdf
    Log    ${text_result}

TC2
    Open Pdf    source_path=C:${/}Mine${/}Balaji-Profile_2023_1.pdf
    ${count}    Get Number Of Pages
    Log To Console    ${count}
    ${text_result}    Get Text From Pdf
    Log    ${text_result}