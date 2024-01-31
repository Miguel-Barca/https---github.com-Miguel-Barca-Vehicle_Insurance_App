*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${HOMEPAGE_URL}                    https://sampleapp.tricentis.com/101/
${AUTOMOBILE_CATEGORY_XPATH}       //*[@id="nav_automobile"]
${TRUCK_CATEGORY_XPATH}            //*[@id="nav_truck"]
${MOTORCYCLE_CATEGORY_XPATH}       //*[@id="nav_motorcycle"]
${CAMPER_CATEGORY_XPATH}           //*[@id="nav_camper"]



*** Keywords ***
Navigate to
    Go To    ${HOMEPAGE_URL} 


Select Category
    [Arguments]  ${ACTIVE_CATEGORY}
    Set Global Variable  ${ACTIVE_CATEGORY}
    Run Keyword  Click ${ACTIVE_CATEGORY}
     

Click Automobile
    Click Element  ${AUTOMOBILE_CATEGORY_XPATH} 


Click Truck
    Click Element  ${TRUCK_CATEGORY_XPATH}


Click Motorcycle
    Click Element  ${MOTORCYCLE_CATEGORY_XPATH} 


Click Camper
    Click Element  ${CAMPER_CATEGORY_XPATH} 