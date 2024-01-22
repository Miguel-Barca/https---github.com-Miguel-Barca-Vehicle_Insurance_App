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

Testing CSV
    ${results} =  DataManager.Get CSV Data