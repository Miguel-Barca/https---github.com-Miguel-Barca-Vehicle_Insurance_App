*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DataManager.robot

*** Variables ***
${selectedinsurance_xpath}   xpath=//span[@id='selectedinsurance']
${MAKE_XPATH}                xpath=//select[@id='make']
${ENGINE_PERFORMANCE_XPATH}  xpath=//input[@id='engineperformance']
${MANUFACTURE_DATE_XPATH}    xpath=//input[@id='dateofmanufacture']
${NUMBER_OF_SEATS_XPATH}     xpath=//select[@id='numberofseats']
${FUEL_TYPE_XPATH}           xpath=//select[@id='fuel']
${LIST_PRICE_XPATH}          xpath=//input[@id='listprice']
${LICENSE_PLATE_XPATH}       xpath=//input[@id='licenseplatenumber']
${ANNUAL_MILEAGE_XPATH}      xpath=//input[@id='annualmileage']
${NEXT_BUTTON_ID}         nextenterinsurantdata  
${COUNTER}  0
${CAR_LIST_LENGTH}

*** Keywords ***
Validate Correct Form
    ${FORM_TYPE}  Set Variable  Automobile Insurance
    Element Should Contain  ${selectedinsurance_xpath}  ${FORM_TYPE}

# Reusable and can iterate over every car.
#
GET Single Car from List And Increment Counter
    [Arguments]  @{cars_list}  ${COUNTER}
    @{cars_list}=  DataManager.Get List Of Cars
    
    #Defining which car go gt from @{cars_list}
    ${single_car}  Set Variable    ${cars_list}[${COUNTER}]
    
    # Mapping values from the CS unto the WebApp Form
    Select From List By Value  ${MAKE_XPATH}                 ${single_car}[0]
    Input Text                 ${ENGINE_PERFORMANCE_XPATH}   ${single_car}[1]
    Input Text                 ${MANUFACTURE_DATE_XPATH}     ${single_car}[2]
    Select From List By Value  ${NUMBER_OF_SEATS_XPATH}      ${single_car}[3]
    Select From List By Value  ${FUEL_TYPE_XPATH}            ${single_car}[4]
    Input Text                 ${LIST_PRICE_XPATH}           ${single_car}[5]
    Input Text                 ${LICENSE_PLATE_XPATH}        ${single_car}[6]
    Input Text                 ${ANNUAL_MILEAGE_XPATH}       ${single_car}[7]
    Increment Counter


Increment Counter
    #Working - Persistence of the data in test execution
    #Log    Counter before increment: ${COUNTER}
    ${COUNTER}   Evaluate    ${COUNTER} + 1
    #Log    Counter after increment: ${COUNTER}
    Set Global Variable    ${COUNTER}

Proceed To Next Page
    Click Button   ${NEXT_BUTTON_ID}            