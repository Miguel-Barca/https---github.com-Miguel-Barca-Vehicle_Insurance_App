*** Settings ***
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/TricentisApp.robot
Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test


*** Test Cases ***
User Should Be Able To Fill Form - All Categories
    [Tags]       VehicleForm
    [Template]   TricentisApp.Vehicle Data Page Object - Input Data
    Automobile
    Truck
    Camper
    Motorcycle


User Should Be Able To Complete Flow
    [Tags]       E2E
    [Template]   TricentisApp.E2E Test Case
    Automobile
    #Truck
   # Camper
   # Motorcycle