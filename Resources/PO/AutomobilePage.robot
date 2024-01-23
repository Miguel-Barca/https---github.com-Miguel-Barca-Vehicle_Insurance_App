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

*** Keywords ***
Validate Correct Form
    ${FORM_TYPE}  Set Variable  Automobile Insurance
    Element Should Contain  ${selectedinsurance_xpath}  ${FORM_TYPE}

#TODO MAKE it reusable and make it so it can iterate over every car.
# Right now it is only inputing a single car (if I delete RETURN it will input every single car)
GET Single Car from List
    [Arguments]  @{all_cars_list}
    @{all_cars_list}=  DataManager.Get List Of Cars

    FOR  ${single_car}  IN  @{all_cars_list}
                   # Mapping values from the CS unto the WebApp Form
                   Select From List By Value  ${MAKE_XPATH}                 ${single_car}[0]
                   Input Text                 ${ENGINE_PERFORMANCE_XPATH}   ${single_car}[1]
                   Input Text                 ${MANUFACTURE_DATE_XPATH}     ${single_car}[2]
                   Select From List By Value  ${NUMBER_OF_SEATS_XPATH}      ${single_car}[3]
                   Select From List By Value  ${FUEL_TYPE_XPATH}            ${single_car}[4]
                   Input Text                 ${LIST_PRICE_XPATH}           ${single_car}[5]
                   Input Text                 ${LICENSE_PLATE_XPATH}        ${single_car}[6]
                   Input Text                 ${ANNUAL_MILEAGE_XPATH}       ${single_car}[7]
                   RETURN  ${single_car}
    END
    
Proceed To Next Page
    Click Button   ${NEXT_BUTTON_ID}            