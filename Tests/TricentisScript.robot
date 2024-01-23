*** Settings ***
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/TricentisApp.robot
Resource  ../Resources/DataManager.robot
Test Setup     Common.Begin Web Test
Test Teardown  Common.End Web Test


*** Test Cases ***
Categories - Nav Bar - Template Test Cases
    [Template]   Tests Multiple Categories - Nav Bar
    ${CATEGORIES.ONE}
    ${CATEGORIES.TWO}
    ${CATEGORIES.THREE}
    ${CATEGORIES.FOUR}


Mapping (in Progress)
    [Documentation]  Fill Vehicle Data and Insurant Data Forms - In Progress
    TricentisApp.Fill Form Pages  ${CATEGORIES.ONE}

DATA MANAGER Tests
    ${holder}  DataManager.Get Insurant Data
    Log Many  ${holder}