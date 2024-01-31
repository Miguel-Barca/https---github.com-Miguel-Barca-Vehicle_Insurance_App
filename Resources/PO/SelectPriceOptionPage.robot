*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DataManager.robot


*** Variables ***
${SILVER_RADIO_BUTTON_XPATH}          //table[@id="priceTable"]//label[1]/span
${GOLD_RADIO_BUTTON_XPATH}            //table[@id="priceTable"]//label[2]/span
${PLATINUM_RADIO_BUTTON_XPATH}        //table[@id="priceTable"]//label[3]/span
${ULTIMATE_RADIO_BUTTON_XPATH}        //table[@id="priceTable"]//label[4]/span
${NEXT_SEND_QUOTE_ID}                 nextsendquote


*** Keywords ***
E2E
    ${random_option}    Evaluate    random.choice(["SILVER", "GOLD", "PLATINUM", "ULTIMATE"])
    Run Keyword   Select ${random_option} Option
    Proceed To Next Page


Select SILVER Option
    Click Element                  ${SILVER_RADIO_BUTTON_XPATH}


Select GOLD Option
    Click Element                   ${GOLD_RADIO_BUTTON_XPATH}


Select PLATINUM Option
    Click Element                    ${PLATINUM_RADIO_BUTTON_XPATH}


Select ULTIMATE Option
    Click Element                    ${ULTIMATE_RADIO_BUTTON_XPATH}


Proceed To Next Page
    Wait Until Element Is Visible    ${NEXT_SEND_QUOTE_ID}   
    Click Button                     ${NEXT_SEND_QUOTE_ID} 