*** Settings ***
Library   SeleniumLibrary

Resource  ../Resources/PO/Homepage.robot
Resource  ../Resources/PO/AutomobilePage.robot
Resource  ../Resources/PO/InsurantForm.robot

*** Variables ***
${RANGE}   30
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
    InsurantForm.Fill Form
    

Process All Cars
    [Arguments]   ${Category}  
    
    #Every Car/Row in the csv file is being selected 
    FOR   ${ROW}   IN RANGE  ${ROW}  ${RANGE}
        #Log Many  ${ROW}     ${RANGE}
        Fill Form Pages  ${Category}
        #Log Many  ${COUNTER}  ${CAR_LIST_LENGTH}
    END


    
    