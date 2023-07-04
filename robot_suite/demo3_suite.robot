*** Variables ***
${BROWSER_NAME}     chrome
@{COLORS}   red   green    yellow
&{MOBILE_CAP}   platformName=android   deviceName=redmi    platformVersion=12.0


*** Test Cases ***
TC1
    Log To Console    ${BROWSER_NAME}
    Log To Console    ${MOBILE_CAP}
    Log To Console    ${MOBILE_CAP}[platformName]
    Log To Console    ${MOBILE_CAP}[deviceName]

TC2
    &{option}       Create Dictionary       token=767667dsuhhghs    username=bala
    &{caps}      Create Dictionary   platformName=android
    ...  deviceName=redmi
    ...  platformVersion=12.0
    ...  options=${option}
    
    Log To Console    ${caps}[options]
    Log To Console    ${caps}[options][username]
    Set Global Variable    ${MY_NAME}       bala
    Set Global Variable    ${NEW_CAPS}      ${caps}
   
TC3
    Log To Console    ${MY_NAME} 
    Log To Console    ${NEW_CAPS}
    
    
    
    