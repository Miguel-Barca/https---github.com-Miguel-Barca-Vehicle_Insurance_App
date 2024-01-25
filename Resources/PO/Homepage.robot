*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DataManager.robot

*** Variables ***
${NAV_BAR_AUTOMOBILE_XPATH}   xpath=//*[contains(@id, 'nav_')]
${NAV_BAR_CATEGORY_XPATH}     xpath=//*[contains(@id, 'nav_')]


*** Keywords ***
Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}
    go to  ${SignInUrl}


Click Category
    [Arguments]    ${Category}

    #Creating the xpath inside Keyword
    ${xpath_variable}=    Set Variable    xpath=//*[contains(@id, 'nav_${Category}')]
    Wait Until Element Is Visible  ${xpath_variable}
    Click Element         ${xpath_variable}
