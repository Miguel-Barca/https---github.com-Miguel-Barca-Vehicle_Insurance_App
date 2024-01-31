*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DataManager.robot

*** Variables ***
*** Variables ***
${selectedinsurance_xpath}        xpath=//span[@id='selectedinsurance']
${MAKE_XPATH}                     xpath=//select[@id='make']
${ENGINE_PERFORMANCE_XPATH}       xpath=//input[@id='engineperformance']
${MANUFACTURE_DATE_XPATH}         xpath=//input[@id='dateofmanufacture']
${NUMBER_OF_SEATS_XPATH}          xpath=//select[@id='numberofseats']
${FUEL_TYPE_XPATH}                xpath=//select[@id='fuel']
${PAYLOAD_XPATH}                  xpath=//input[@id='payload']
${TOTAL_WEIGHT_XPATH}             xpath=//input[@id='totalweight']
${LIST_PRICE_XPATH}               xpath=//input[@id='listprice']
${LICENSE_PLATE_XPATH}            xpath=//input[@id='licenseplatenumber']
${ANNUAL_MILEAGE_XPATH}           xpath=//input[@id='annualmileage']
${NEXT_ENTER_INSURANT_ID}         nextenterinsurantdata  
${MODEL_XPATH}                    xpath=//select[@id='model']
${CYLINDER_CAPACITY_XPATH}        xpath=//input[@id='cylindercapacity']
${NUMBER_OF_SEATS_MOTO_XPATH}     xpath=//select[@id="numberofseatsmotorcycle"]

${RIGHT_HAND_YES_RADIO_XPATH}     xpath=//*[@id="insurance-form"]//div[5]/p/label[1]/span
${RIGHT_HAND_NO_RADIO_XPATH}      xpath=//*[@id="insurance-form"]//div[5]/p/label[2]/span

${NEXT_ENTER_INSURANT_ID}    nextenterinsurantdata  
${COUNTER}                   0

*** Keywords ***
Validate Correct Form
    ${FORM_TYPE}  Set Variable  Automobile Insurance
    Element Should Contain  ${selectedinsurance_xpath}  ${FORM_TYPE}

# Reusable and can iterate over every car.
#
GET Single Car from List And Increment Counter
    [Arguments]  @{cars_list}  ${COUNTER}
    @{cars_list}=  DataManager.Get Automobile CSV File - List

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
    ${COUNTER}   Evaluate    ${COUNTER} + 1
    Set Global Variable    ${COUNTER}

Proceed To Next Page
    Click Button   ${NEXT_ENTER_INSURANT_ID}             

Fill Automobile Form Data
    GET Single Car from List And Increment Counter   COUNTER=${COUNTER}

Get ${ACTIVE_CATEGORY} From CSV File And Fill Form
    [Arguments]  ${ACTIVE_CATEGORY}
    Run Keyword   DataManager.Defining ${ACTIVE_CATEGORY} CSV File Range Value
    ${LIST}=  Run Keyword  DataManager.Get ${ACTIVE_CATEGORY} CSV File - List

    #Processing each vehicle in the chosen category csv file
    FOR  ${ROW}  IN RANGE  ${COUNTER}  ${RANGE}
        Run Keyword   VehicleData.Fill ${ACTIVE_CATEGORY} Form Data  ${LIST}[${COUNTER}]
        DataManager.Increment Counter

    END


Fill Truck Form Data
    [Arguments]  ${truck}
    Select From List By Value  ${MAKE_XPATH}                 ${truck}[0]
    Input Text                 ${ENGINE_PERFORMANCE_XPATH}   ${truck}[1]
    Input Text                 ${MANUFACTURE_DATE_XPATH}     ${truck}[2]
    Select From List By Value  ${NUMBER_OF_SEATS_XPATH}      ${truck}[3]
    Select From List By Value  ${FUEL_TYPE_XPATH}            ${truck}[4]
    Input Text                 ${PAYLOAD_XPATH}              ${truck}[5]    
    Input Text                 ${TOTAL_WEIGHT_XPATH}         ${truck}[6]    
    Input Text                 ${LIST_PRICE_XPATH}           ${truck}[7]
    Input Text                 ${LICENSE_PLATE_XPATH}        ${truck}[8]
    Input Text                 ${ANNUAL_MILEAGE_XPATH}       ${truck}[9]


Fill Motorcycle Form Data
    [Arguments]  ${motorcycle}
    Select From List By Value  ${MAKE_XPATH}                  ${motorcycle}[0]
    Select From List By Value  ${MODEL_XPATH}                 ${motorcycle}[1]
    Input Text                 ${CYLINDER_CAPACITY_XPATH}     ${motorcycle}[2]
    Input Text                 ${ENGINE_PERFORMANCE_XPATH}    ${motorcycle}[3]
    Input Text                 ${MANUFACTURE_DATE_XPATH}      ${motorcycle}[4]    
    Select From List By Value  ${NUMBER_OF_SEATS_MOTO_XPATH}  ${motorcycle}[5]    
    Input Text                 ${LIST_PRICE_XPATH}            ${motorcycle}[6]
    Input Text                 ${ANNUAL_MILEAGE_XPATH}        ${motorcycle}[7]


Fill Camper Form Data
    [Arguments]  ${camper}
    Select From List By Value        ${MAKE_XPATH}                 ${camper}[0]
    Input Text                       ${ENGINE_PERFORMANCE_XPATH}   ${camper}[1]
    Input Text                       ${MANUFACTURE_DATE_XPATH}     ${camper}[2]
    Select From List By Value        ${NUMBER_OF_SEATS_XPATH}      ${camper}[3]
    Select Right Hand Drive Option                                 ${camper}[4]
    Select From List By Value        ${FUEL_TYPE_XPATH}            ${camper}[5]
    Input Text                       ${PAYLOAD_XPATH}              ${camper}[6]    
    Input Text                       ${TOTAL_WEIGHT_XPATH}         ${camper}[7]    
    Input Text                       ${LIST_PRICE_XPATH}           ${camper}[8]
    Input Text                       ${LICENSE_PLATE_XPATH}        ${camper}[9]
    Input Text                       ${ANNUAL_MILEAGE_XPATH}       ${camper}[10]


Select Right Hand Drive Option
    [Arguments]    ${arg}
    Run Keyword If    '${arg}' == 'Yes'  Click Element   ${RIGHT_HAND_YES_RADIO_XPATH}
    ...   ELSE   Click Element  ${RIGHT_HAND_NO_RADIO_XPATH}

    
    
