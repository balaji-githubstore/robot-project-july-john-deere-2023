*** Settings ***
Library     RequestsLibrary
Library    OperatingSystem

Suite Setup     Create Session    alias=petshop    url=https://petstore.swagger.io/v2
Suite Teardown  Delete All Sessions

*** Test Cases ***
TC1 Add Valid Pet To Store
   &{header_dic}   Create Dictionary       Content-Type=application/json
   ...   Connection=keep-alive
   ${json}      Get Binary File     ${EXECDIR}${/}test_data${/}new_pet.json
   Log To Console    ${json}

   ${response}     POST On Session     alias=petshop   url=/pet
   ...   headers=${header_dic}      data=${json}   expected_status=200
   Should Be Equal As Integers    ${response.json()}[id]    705
   #validate the added pet name
   Should Be Equal As Strings    ${response.json()}[name]    doggie
   Log To Console    ${response.json()}[category][id]

#TC2 Delete The Pet
