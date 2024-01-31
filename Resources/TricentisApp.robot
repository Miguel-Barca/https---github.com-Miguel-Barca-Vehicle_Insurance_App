*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/PO/Homepage.robot
Resource  ../Resources/PO/VehicleData.robot
Resource  ../Resources/PO/InsurantForm.robot
Resource  ../Resources/PO/ProductDataPage.robot
Resource  ../Resources/PO/SelectPriceOptionPage.robot
Resource  ../Resources/PO/SendQuotePage.robot
Resource  ../Resources/DataManager.robot


*** Variables ***
${RANGE}   
${ROW}   0
${RANGE_INSURANTS}


*** Keywords ***
Tests Multiple Categories - Nav Bar
    [Arguments]   ${Category}
    Homepage.Navigate To
    Homepage.Select Category  ${Category}

    
Fill Form Pages (only Cars CSV)
    [Arguments]   ${Category}
    Homepage.Navigate To
    Homepage.Select Category  ${Category}
    VehicleData.Validate Correct Form
    DataManager. Get CSV File Length
    VehicleData.GET Single Car from List And Increment Counter   COUNTER=${COUNTER}
    VehicleData.Proceed To Next Page
    InsurantForm.Get Insurant from List, Fill Form And Increment Counter  COUNTER_INSURANT_LIST=${COUNTER_INSURANT_LIST}
    ProductDataPage.Fill With Data and Proceed To Next Page
    SelectPriceOptionPage.Select Random Price Option and Proceed To Next Page
    SendQuotePage.Fill With Data and Finalize


Fill Form Pages (Cars + Insurants CSV)
    [Arguments]   ${Category}
    Homepage.Navigate To
    Homepage.Select Category  ${Category}
    VehicleData.Validate Correct Form
    DataManager. Get CSV File Length
    VehicleData.GET Single Car from List And Increment Counter   COUNTER=${COUNTER}
    VehicleData.Proceed To Next Page
    InsurantForm.Get Insurant from List, Fill Form And Increment Counter   COUNTER_INSURANT_LIST=${COUNTER_INSURANT_LIST}
    ProductDataPage.Fill With Data and Proceed To Next Page
    SelectPriceOptionPage.Select Random Price Option and Proceed To Next Page
    SendQuotePage.Fill With Data and Finalize


Process All Cars
    [Arguments]   ${Category}  
    Defining Range Value
    #Every Car/Row in the csv file is being selected 
    FOR   ${ROW}   IN RANGE  ${ROW}  ${RANGE}
        #Log Many  ${ROW}     ${RANGE}
        Fill Form Pages (only Cars CSV)  ${Category}
        #Log Many  ${COUNTER}  ${CAR_LIST_LENGTH}
    END


Process All Cars - With Picture Upload
    [Arguments]   ${Category} 
    Defining Range Value
    #Every Car/Row in the csv file is being selected 
    FOR   ${ROW}   IN RANGE  ${ROW}  ${RANGE}
        #Log Many  ${ROW}     ${RANGE}
        Fill Form Pages (only Cars CSV)  ${Category}
        #Log Many  ${COUNTER}  ${CAR_LIST_LENGTH}
    END 


Process All Cars And Insurants
    [Arguments]   ${Category}
    Defining Range Value - Insurants
    #Every Car/Row in the csv file is being selected 
    FOR   ${ROW}   IN RANGE  ${ROW}  ${RANGE_INSURANTS}
        #Log Many  ${ROW}     ${RANGE}
        Fill Form Pages (Cars + Insurants CSV)  ${Category}  
        #Log Many  ${COUNTER}  ${CAR_LIST_LENGTH}
    END 


Defining Range Value
    #Defining upper limit 
    ${RANGE}=  DataManager. Get CSV File Length  
    #Log    Counter after increment: ${COUNTER}
    Set Global Variable    ${RANGE}     


Defining Range Value - Insurants
    #Defining upper limit 
    ${RANGE_INSURANTS}=  DataManager.Get Length List Of Insurants
    #Log    Counter after increment: ${COUNTER}
    Set Global Variable    ${RANGE_INSURANTS}    

