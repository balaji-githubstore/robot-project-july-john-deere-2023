*** Settings ***
Library     RPA.JSON

*** Test Cases ***
TC1
    ${json}     Load JSON from file     ${EXECDIR}${/}test_data${/}data.json
    Log To Console    ${json}
#    Log To Console    ${json}[id]
     ${value}   Get value from JSON    ${json}    $
     Log    ${value}
     ${value}   Get value from JSON    ${json}    $.photoUrls
     Log    ${value}
     ${value}   Get value from JSON    ${json}    $.tags
     Log    ${value}
     ${values}      Get values from JSON    ${json}    $..id
     Log    ${values}
TC2
    ${json}     Load JSON from file     ${EXECDIR}${/}test_data${/}data.json
    ${json}     Update value to JSON    ${json}    $..id    809
    Save JSON to file    ${json}    ${EXECDIR}${/}test_data${/}data1.json

TC3
    ${json}     Load JSON from file     ${EXECDIR}${/}test_data${/}data.json
    ${value}   Get value from JSON    ${json}   $.tags[?@.id>15]
    Log    ${value}