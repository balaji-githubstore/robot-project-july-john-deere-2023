*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome    options=add_experimental_option("debuggerAddress","127.0.0.1:9223")
    Log Title
    Close Browser