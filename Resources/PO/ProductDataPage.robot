*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DataManager.robot


*** Variables ***
${START_DATE_XPATH}                   xpath=//input[@id='startdate']
${MERIT_RATING_LIST_XPATH}            xpath=//select[@id='meritrating']
${INSURANCE_SUM_LIST_XPATH}           xpath=//select[@id='insurancesum']
${DAMAGE_INSURANCE_LIST_XPATH}        xpath=//select[@id='damageinsurance']
${EURO_PROTECTION_CHECKBOX_XPATH}     xpath=//form[@id="insurance-form"]//div[5]/p/label[1]/span
${LEGAL_DEFENSE_CHECKBOX_XPATH}       xpath=//form[@id="insurance-form"]//div[5]/p/label[2]/span
${COURTESY_CAR_LIST_XPATH}            xpath=//select[@id='courtesycar']
${NEXT_SELECT_PRICE_ID}               nextselectpriceoption


*** Keywords ***
Fill With Data and Proceed To Next Page
    Input Text               ${START_DATE_XPATH}   ${PRODUCT_DATA['startdate']}
    Select Sum Dropdown      ${PRODUCT_DATA['value']}
    Select Merit Rating      ${PRODUCT_DATA['bonus']}
    Select Damage Insurance  ${PRODUCT_DATA['damageinsurance']}
    Select Optionals         ${PRODUCT_DATA['optional']}
    Select Courtesy Car      ${PRODUCT_DATA['courtesycar']}
    Proceed To Next Page


Select Sum Dropdown
    [Arguments]  ${PRODUCT_DATA['value']}
    Select From List By Value   ${INSURANCE_SUM_LIST_XPATH}  ${PRODUCT_DATA['value']}


Select Merit Rating
    [Arguments]    ${PRODUCT_DATA['bonus']}
    Select From List By Value  ${MERIT_RATING_LIST_XPATH}   ${PRODUCT_DATA['bonus']}


Select Damage Insurance
    [Arguments]    ${PRODUCT_DATA['damageinsurance']}
    Select From List By Value   ${DAMAGE_INSURANCE_LIST_XPATH}   ${PRODUCT_DATA['damageinsurance']}


Select Optionals
    [Arguments]    ${PRODUCT_DATA['optional']}
    Run Keyword    Select ${PRODUCT_DATA['optional']} - Optional


Select Euro Protection - Optional
     Click Element  ${EURO_PROTECTION_CHECKBOX_XPATH}


Select Legal Defense Insurance - Optional
     Click Element  ${LEGAL_DEFENSE_CHECKBOX_XPATH}


Select Courtesy Car
    [Arguments]    ${arg1}
    Select From List By Value   ${COURTESY_CAR_LIST_XPATH}   ${PRODUCT_DATA['courtesycar']}


Proceed To Next Page
    Click Button   ${NEXT_SELECT_PRICE_ID}  
    