*** Settings ***
Library   SeleniumLibrary

Resource  ../Resources/PO/Homepage.robot
Resource  ../Resources/PO/AutomobilePage.robot
Resource  ../Resources/PO/InsurantForm.robot

*** Variables ***
${RANGE}   
${ROW}   0

*** Keywords ***
Tests Multiple Categories - Nav Bar
    [Arguments]   ${Category}
    Homepage.Navigate To
    Homepage.Click Category  ${Category}

    

Fill Form Pages
    [Arguments]   ${Category}
    Homepage.Navigate To
    Homepage.Click Category  ${Category}
    AutomobilePage.Validate Correct Form
    DataManager. Get CSV File Length
    AutomobilePage.GET Single Car from List And Increment Counter   COUNTER=${COUNTER}
    AutomobilePage.Proceed To Next Page
    InsurantForm.Fill With Data and Proceed To Next Page
    

Process All Cars
    [Arguments]   ${Category}  
    Defining Range Value
    #Every Car/Row in the csv file is being selected 
    FOR   ${ROW}   IN RANGE  ${ROW}  ${RANGE}
        #Log Many  ${ROW}     ${RANGE}
        Fill Form Pages  ${Category}
        #Log Many  ${COUNTER}  ${CAR_LIST_LENGTH}
    END

Defining Range Value
    #Defining upper limit 
    ${RANGE}=  DataManager. Get CSV File Length  
    #Log    Counter after increment: ${COUNTER}
    Set Global Variable    ${RANGE}     

Process All Cars - With Picture Upload
    [Arguments]   ${Category} 
    DataManager.Assign Picture Path 
    Defining Range Value
    #Every Car/Row in the csv file is being selected 
    FOR   ${ROW}   IN RANGE  ${ROW}  ${RANGE}
        #Log Many  ${ROW}     ${RANGE}
        Fill Form Pages  ${Category}
        #Log Many  ${COUNTER}  ${CAR_LIST_LENGTH}
    END 
    