*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${NAV_BAR_AUTOMOBILE_XPATH}   xpath=//*[contains(@id, 'nav_')]
${NAV_BAR_CATEGORY_XPATH}   xpath=//*[contains(@id, 'nav_')]


*** Keywords ***
Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}
    go to  ${SignInUrl}


Click Category
    [Arguments]    ${Category}

    #Creating the xpath inside Keyword
    ${xpath_variable}=    Set Variable    xpath=//*[contains(@id, 'nav_${Category}')]
    Click Element         ${xpath_variable}
    Sleep                 5s
