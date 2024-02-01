*** Settings ***
Resource        ../Data/InputData.robot
Resource        ../Resources/Common.robot
Resource        ../Resources/TricentisApp.robot
Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test


*** Test Cases ***
User Should Be Able To Vehicle Form - All Categories
    [Documentation]  Testing First Module - Vehicle Data Form - Multiple Categories CSV files 
    [Tags]           VehicleForm
    [Template]       TricentisApp.Vehicle Data Page Object - Input Data
    Automobile
    Truck
    Camper
    Motorcycle


User Should Be Able To Complete Flow
    [Documentation]  Complete Flow 
    [Tags]       E2E
    [Template]   TricentisApp.E2E Test Case
    Automobile
    #Truck
    #Camper
  # Motorcycle