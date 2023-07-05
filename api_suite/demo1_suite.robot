*** Settings ***
Library     RequestsLibrary
Library    SeleniumLibrary

Suite Setup     Create Session    alias=petshop    url=https://petstore.swagger.io/v2
Suite Teardown  Delete All Sessions

*** Test Cases ***
TC1 Find Valid Pet By Id
    #BaseURL or EndPoint
#    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}     GET On Session  alias=petshop      url=/pet/101     expected_status=200
    Log    ${response}
    Log    ${response.json()}
    Log    ${response.json()}[id]
    Log    ${response.header}
    Log    ${response.text}
    Log    ${response.statuscode}
    Should Be Equal As Integers    ${response.json()}[id]    101

TC2 Find Invalid Pet By Id
#    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}     GET On Session  alias=petshop      url=/pet/20001       expected_status=404
#    Status Should Be    404
    Log    ${response}
    #validate the response json should contain message as "Pet Not Found"
    Log    ${response.json()}[message]
    Should Be Equal As Strings    ${response.json()}[message]    Pet not found

TC3
    ${response}     GET On Session  alias=petshop       url=/pet/findByStatus?status=pending   expected_status=200
    #write logic to verify all the pet retireved are containing the status as pending
    ${size}   Get Length    ${response.json()}


    Log    ${response.json()}[0][status]

TC4
    ${response}     GET On Session  alias=petshop       url=/pet/findByStatus?status=pending   expected_status=200
    #write logic to verify all the pet retireved are containing the status as pending
    ${size}   Get Length    ${response.json()}
    FOR    ${i}    IN RANGE    0     ${size}
        Log    ${response.json()}[${i}][status]
        Should Be Equal As Strings    ${response.json()}[${i}][status]    pending
    END




