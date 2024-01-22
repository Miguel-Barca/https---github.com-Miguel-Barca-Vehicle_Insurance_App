*** Settings ***
Resource  ../Resources/PO/Homepage.robot


*** Keywords ***
Tests Multiple Categories - Nav Bar
    [Arguments]   ${Category}
    Homepage.Navigate To
    Homepage.Click Category  ${Category}