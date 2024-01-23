*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DataManager.robot

*** Variables ***
${FIRST_NAME_XPATH}                 xpath=//input[@id='firstname']
${LAST_NAME_XPATH}                  xpath=//input[@id='lastname']
${DOB_XPATH}                        xpath=//input[@id='birthdate']
${GENDERMALE_RADIO_BUTTON_XPATH}    xpath=//input[@id='gendermale']
${GENDERFEMALE_RADIO_BUTTON_XPATH}  xpath=//input[@id='genderfemale']
${STREET_ADDRESS_XPATH}             xpath=//input[@id='streetaddress']
${COUNTRIES_LIST_XPATH}             xpath=//select[@id='country']
${ZIP_CODE_XPATH}                   xpath=//input[@id='zipcode']
${CITY_XPATH}                       xpath=//input[@id='city']
${WEBSITE_XPATH}                    xpath=//input[@id='website']
${PICTURE_XPATH}                    xpath=//input[@id='picture']
${OCCUPATION_LIST_XPATH}            xpath=//select[@id='occupation']


### TODO HOBBIES CHECKBOX TAG + RADIO BUTTONS

*** Keywords ***
Fill Form
    Input Text                  ${FIRST_NAME_XPATH}                 ${INSURANT_DATA['firstname']}
    Input Text                  ${LAST_NAME_XPATH}                  ${INSURANT_DATA['lastname']}
    Input Text                  ${DOB_XPATH}                        ${INSURANT_DATA['dob']}
    #Input Text                  ${GENDERMALE_RADIO_BUTTON_XPATH}    ${--------
    #Input Text                  ${GENDERFEMALE_RADIO_BUTTON_XPATH}  ${----------
    Input Text                  ${STREET_ADDRESS_XPATH}             ${INSURANT_DATA['streetaddress']}
    Select From List By Value   ${COUNTRIES_LIST_XPATH}             ${INSURANT_DATA['country']}
    Input Text                  ${ZIP_CODE_XPATH}                   ${INSURANT_DATA['zipcode']}
    Input Text                  ${CITY_XPATH}                       ${INSURANT_DATA['city']}
    Input Text                  ${WEBSITE_XPATH}                    ${INSURANT_DATA['website']}
    Input Text                  ${PICTURE_XPATH}                    ${INSURANT_DATA['picture']}
    Select From List By Value   ${OCCUPATION_LIST_XPATH}            ${INSURANT_DATA['occupation']}
    
