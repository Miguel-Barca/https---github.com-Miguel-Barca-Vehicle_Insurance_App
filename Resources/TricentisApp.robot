*** Settings ***
Resource  ../Resources/PO/Homepage.robot
Resource  ../Resources/PO/AutomobilePage.robot
Resource  ../Resources/PO/InsurantForm.robot


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
    Process Each Car
    

Process Each Car
    AutomobilePage.GET Single Car from List
    AutomobilePage.Proceed To Next Page
    InsurantForm.Fill Form


    
    