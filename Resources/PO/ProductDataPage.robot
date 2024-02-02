*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DataManager.robot


*** Variables ***
${START_DATE_XPATH}                   xpath=//input[@id='startdate']
${MERIT_RATING_LIST_XPATH}            xpath=//select[@id='meritrating']
${INSURANCE_SUM_LIST_XPATH}           xpath=//select[@id='insurancesum']
${DAMAGE_INSURANCE_LIST_XPATH}        xpath=//select[@id='damageinsurance']
${EURO_PROTECTION_CHECKBOX_XPATH}     xpath=//*[@id="insurance-form"]/div/section[3]/div[5]/p/label[1]/span
${EURO_PROTECTION_OTHERS_XPATH}       xpath=//*[@id="insurance-form"]/div/section[3]/div[4]/p/label[1]/span

${LEGAL_DEFENSE_OTHERS_XPATH}         xpath=//*[@id="insurance-form"]/div/section[3]/div[4]/p/label[2]/span
${LEGAL_DEFENSE_CHECKBOX_XPATH}       xpath=//*[@id="insurance-form"]/div/section[3]/div[5]/p/label[2]/span
${COURTESY_CAR_LIST_XPATH}            xpath=//select[@id='courtesycar']
${NEXT_SELECT_PRICE_ID}               nextselectpriceoption


*** Keywords ***
E2E
    Run Keyword    Fill ${ACTIVE_CATEGORY} Option Product Data PO 
    Proceed To Next Page


Fill Automobile Option Product Data PO
    Input Text               ${START_DATE_XPATH}   ${PRODUCT_DATA['startdate']}
    Select Sum Dropdown      ${PRODUCT_DATA['value']}
    Select Merit Rating      ${PRODUCT_DATA['bonus']}
    Select Damage Insurance  ${PRODUCT_DATA['damageinsurance']}
    Run Keyword    Select Optionals ${ACTIVE_CATEGORY}          ${PRODUCT_DATA['optional']}
    Select Courtesy Car      ${PRODUCT_DATA['courtesycar']}


Fill Truck Option Product Data PO 
    Input Text               ${START_DATE_XPATH}   ${PRODUCT_DATA['startdate']}
    Select Sum Dropdown      ${PRODUCT_DATA['value']}
    Select Damage Insurance  ${PRODUCT_DATA['damageinsurance']}
    Run Keyword    Select Optionals ${ACTIVE_CATEGORY}         ${PRODUCT_DATA['optional']}


Fill Camper Option Product Data PO 
    Input Text               ${START_DATE_XPATH}   ${PRODUCT_DATA['startdate']}
    Select Sum Dropdown      ${PRODUCT_DATA['value']}
    Select Damage Insurance  ${PRODUCT_DATA['damageinsurance']}
    Run Keyword    Select Optionals ${ACTIVE_CATEGORY}         ${PRODUCT_DATA['optional']}


Fill Motorcycle Option Product Data PO 
    Input Text               ${START_DATE_XPATH}   ${PRODUCT_DATA['startdate']}
    Select Sum Dropdown      ${PRODUCT_DATA['value']}
    Select Damage Insurance  ${PRODUCT_DATA['damageinsurance']}
    Run Keyword    Select Optionals ${ACTIVE_CATEGORY}       ${PRODUCT_DATA['optional']}



Select Sum Dropdown
    [Arguments]  ${PRODUCT_DATA['value']}
    Select From List By Value   ${INSURANCE_SUM_LIST_XPATH}  ${PRODUCT_DATA['value']}


Select Merit Rating
    [Arguments]    ${PRODUCT_DATA['bonus']}
    Select From List By Value  ${MERIT_RATING_LIST_XPATH}   ${PRODUCT_DATA['bonus']}


Select Damage Insurance
    [Arguments]    ${PRODUCT_DATA['damageinsurance']}
    Select From List By Value   ${DAMAGE_INSURANCE_LIST_XPATH}   ${PRODUCT_DATA['damageinsurance']}

#TODO Refactor the Optional Products Form - Automobile vs others
Select Optionals Automobile
    [Arguments]    ${PRODUCT_DATA['optional']}
    Run Keyword    Select ${PRODUCT_DATA['optional']} - Optional - Automobile


Select Optionals Truck
    [Arguments]    ${PRODUCT_DATA['optional']}
    Run Keyword    Select ${PRODUCT_DATA['optional']} - Optional - Others


Select Optionals Motorcycle
    [Arguments]    ${PRODUCT_DATA['optional']}
    Run Keyword    Select ${PRODUCT_DATA['optional']} - Optional - Others


Select Optionals Camper
    [Arguments]    ${PRODUCT_DATA['optional']}
    Run Keyword    Select ${PRODUCT_DATA['optional']} - Optional - Others


Select Euro Protection - Optional - Others
     Click Element     ${EURO_PROTECTION_OTHERS_XPATH} 


Select Legal Defense Insurance - Optional - Others
     Click Element     ${LEGAL_DEFENSE_OTHERS_XPATH}  


Select Euro Protection - Optional - Automobile
     Click Element     ${EURO_PROTECTION_CHECKBOX_XPATH}


Select Legal Defense Insurance - Optional - Automobile
     Click Element     ${LEGAL_DEFENSE_CHECKBOX_XPATH}  


Select Legal Defense Insurance - Optional
     Click Element  ${LEGAL_DEFENSE_CHECKBOX_XPATH}


Select Courtesy Car
    [Arguments]    ${arg1}
    Select From List By Value   ${COURTESY_CAR_LIST_XPATH}   ${PRODUCT_DATA['courtesycar']}


Proceed To Next Page
    Click Button   ${NEXT_SELECT_PRICE_ID}  
    