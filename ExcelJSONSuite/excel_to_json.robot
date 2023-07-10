*** Settings ***
Library     RPA.Excel.Files
Library    RPA.JSON

*** Test Cases ***
TC1
    Open Workbook    path=${EXECDIR}${/}test_data${/}open_emr_data.xlsx
    ${sheet}    Read Worksheet
    ${row_count}    Get Length    ${sheet}
    Log    ${row_count}
    ${col_count}    Get Length    ${sheet}[0]
    Log    ${col_count}
    ${json}     Load JSON from file     test_data${/}data_template.json
    ${name}      Get value from JSON    ${json}    $..tags[0].id
    Log    ${name}
    Log    ${json}
    ${tag_id_count}     Convert To Integer    0
    ${tag_name_count}     Convert To Integer    0
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
    Save JSON to file    ${json}    ${EXECDIR}/final.js
