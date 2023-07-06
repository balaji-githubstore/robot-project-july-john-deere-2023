*** Settings ***
Library     OperatingSystem
Library    Collections


*** Test Cases ***
TC1
    Append To Environment Variable     path   ${EXECDIR}${/}chromedriver.exe
    ${path}     Get Environment Variable    Path 
    Log    ${path}
    
TC2
    Create File    path=C:${/}mine${/}demo.txt      content=hello world
#    Append To File    path    content

TC3
    @{files}   List Files In Directory  path=C:${/}
    Log List    ${files}
