*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/PO/Homepage.robot
Resource  ../Resources/PO/VehicleData.robot
Resource  ../Resources/PO/InsurantForm.robot
Resource  ../Resources/PO/ProductDataPage.robot
Resource  ../Resources/PO/SelectPriceOptionPage.robot
Resource  ../Resources/PO/SendQuotePage.robot


*** Variables ***
${END}  30
${ROW}   0
${RANGE_INSURANTS}


*** Keywords ***
Vehicle Data Page Object - Input Data
    [Arguments]      ${ACTIVE_CATEGORY}
    Homepage.Navigate to
    Homepage.Select Category  ${ACTIVE_CATEGORY}
    VehicleData.Get ${ACTIVE_CATEGORY} From CSV File And Fill Form  ${ACTIVE_CATEGORY}

E2E Test Case
    [Arguments]  ${ACTIVE_CATEGORY}
    
    
    FOR  ${START}  IN RANGE    ${COUNTER}   ${END}
        Homepage.Navigate to
        Homepage.Select Category  ${ACTIVE_CATEGORY}
        VehicleData.E2E    COUNTER=${COUNTER}
        InsurantForm.E2E   ${COUNTER_INSURANT_COUNTER} 
        ProductDataPage.E2E
        SelectPriceOptionPage.E2E
        SendQuotePage.E2E

    END
