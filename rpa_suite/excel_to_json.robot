*** Settings ***
Library     RPA.Excel.Files
Library    RPA.JSON

*** Test Cases ***
TC1
    Open Workbook    path=${EXECDIR}${/}ExcelJSONSuite${/}open_emr_data.xlsx
    ${sheet}    Read Worksheet
    ${row_count}    Get Length    ${sheet}
    Log    ${row_count}
    ${col_count}    Get Length    ${sheet}[0]
    Log    ${col_count}
    ${json}     Load JSON from file     ExcelJSONSuite${/}data_template.json
    ${name}      Get value from JSON    ${json}    $..tags[0].id
    Log    ${name}
    Log    ${json}
    #tags in the data_template.json - similar format of mulitple set
    ${tag_id_count}     Convert To Integer    0
    ${tag_name_count}     Convert To Integer    0
    #logic to iterate each row and verify its header in previous colomn and
    #adds id and name inside the tags array dynamically based on excel
    FOR    ${r}    IN RANGE    2    ${row_count}+1
            ${val1}  Get Worksheet Value    ${r}    1
            ${val1}     Convert To String    ${val1}
            Log    ${val1}
            ${val2}  Get Worksheet Value    ${r}    2
            Log    ${val2}
            IF    '${val1}'=='id'
                 Update value to JSON    ${json}    $..id    ${val2}
            ELSE IF  '${val1}'=='tag-id'
                Update value to JSON    ${json}    $..tags[${tag_id_count}].id    ${val2}
                ${tag_id_count}     Evaluate  ${tag_id_count}+1
            ELSE IF  '${val1}'=='tag-name'
                Update value to JSON    ${json}    $..tags[${tag_name_count}].name    ${val2}
               ${tag_name_count}   Evaluate    ${tag_name_count}+1
            END

    END
    #deleting the dictionary with name as 'na' under tags array
    Delete from JSON    ${json}    $..tags[?(@..name=='na')]
    Log    ${json}
    Save JSON to file    ${json}    ${EXECDIR}/ExcelJSONSuite/data_final.js
