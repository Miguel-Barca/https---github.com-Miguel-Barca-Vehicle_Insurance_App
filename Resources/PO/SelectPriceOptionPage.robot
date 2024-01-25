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
Select Random Price Option and Proceed To Next Page
    ${random_option}    Evaluate    random.choice(["SILVER", "GOLD", "PLATINUM", "ULTIMATE"])
    Run Keyword   Select ${random_option} Option
    #Confirm That The Button Is Visible
    Wait Until Element Is Visible  ${NEXT_SEND_QUOTE_ID}
    Proceed To Next Page

Select SILVER Option
    Click Element  ${SILVER_RADIO_BUTTON_XPATH}

Select GOLD Option
    Click Element  ${GOLD_RADIO_BUTTON_XPATH}

Select PLATINUM Option
    Click Element  ${PLATINUM_RADIO_BUTTON_XPATH}

Select ULTIMATE Option
    Click Element  ${ULTIMATE_RADIO_BUTTON_XPATH}

Proceed To Next Page
    Click Button    ${NEXT_SEND_QUOTE_ID} 