*** Settings ***
Documentation       This suite will have the code for testing the mysql

Library     DatabaseLibrary

Suite Setup     DatabaseLibrary.Connect To Database  dbapiModuleName=pymysql
    ...     dbName=dbfree_db    dbUsername=dbfree_db
    ...    dbPassword=12345678    dbHost=db4free.net    dbPort=3306

Suite Teardown      DatabaseLibrary.Disconnect From Database

*** Comments ***
Table name - Products
Column name - Product_ID, ProductName, description

*** Test Cases ***
TC1
    ${row_count}     DatabaseLibrary.Row Count    select * from Products
    Log To Console    ${row_count}
    
TC2
    ${desc}     DatabaseLibrary.Description    select * from Products
    Log To Console    ${desc}

TC3
    Row Count Is Equal To X    select * from Products where ProductName='watch'    1
    Row Count Is Greater Than X    select * from Products    100
    Row Count Is Less Than X    select * from Products    500
   
   
TC4 
    ${result}    DatabaseLibrary.Query    select * from Products where Product_ID<5
    Log    ${result}
    Log    ${result}[0]
    Log    ${result}[0][2]

    ${row_count}    Get Length    ${result}
    Log    ${row_count}
    ${col_count}    Get Length    ${result}[0]
    Log    ${col_count}

TC5
    #update, insert, delete  --> Execute Sql String
    DatabaseLibrary.Execute Sql String    update Products set description='analog watch' where Product_ID=1
    DatabaseLibrary.Row Count Is Equal To X
    ...   select * from Products where Product_ID=1 and description='analog watch'    1
    DatabaseLibrary.Check If Exists In Database    select * from Products where Product_ID=1 and description='analog watch'

TC6 Insert Record
#Table name - Products
#Column name - Product_ID, ProductName, description
    DatabaseLibrary.Execute Sql String    Insert into Products (Product_ID, ProductName, description) values
    ...   ('8973','Robot','Training')
    DatabaseLibrary.Check If Exists In Database    select * from Products where Product_ID=8973

TC7
    DatabaseLibrary.Execute Sql String      Delete from Products where Product_ID=8973
    Row Count Is Equal To X    select * from Products where Product_ID=8973    0
    Check If Not Exists In Database    select * from Products where Product_ID=8973
#    Execute Sql Script    D:\\file.sql

TC8 
    ${res}  Query    select * from Products p1 Left JOIN Products p2 on p1.Product_ID=p2.Product_ID
    Log To Console    ${res}






