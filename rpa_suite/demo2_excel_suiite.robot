*** Settings ***
Library    RPA.Excel.Files

*** Test Cases ***
TC1
    Open Workbook    path=${EXECDIR}${/}test_data${/}open_emr_data.xlsx
    @{sheets}    List Worksheets
    Log To Console    ${sheets}
    Log To Console    ${sheets}[0]

TC2
    Open Workbook    path=${EXECDIR}${/}test_data${/}open_emr_data.xlsx
    ${sheet}  Read Worksheet      VerifyValidLoginTemplate
    Log To Console    ${sheet}
    Log To Console    ${sheet}[0]
    Log To Console    ${sheet}[0][A]
    ${row_count}    Get Length    ${sheet}
    Log To Console    ${row_count}
    ${cell_count}    Get Length    ${sheet}[0]
    Log To Console    ${cell_count}

TC4
    Open Workbook    path=${EXECDIR}${/}test_data${/}open_emr_data.xlsx
    ${sheet}  Read Worksheet      VerifyValidLoginTemplate
    ${value}    Get Worksheet Value    1    1
    Log To Console    ${value}
    Set Worksheet Value    1    2    hello
    Save Workbook


    