*** Settings ***
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/TricentisApp.robot
Test Setup     Common.Begin Web Test
Test Teardown  Common.End Web Test


*** Test Cases ***
Categories - Nav Bar - Template Test Cases
    [Template]   Tests Multiple Categories - Nav Bar
    ${CATEGORIES.ONE}
    ${CATEGORIES.TWO}
    ${CATEGORIES.THREE}
    ${CATEGORIES.FOUR}


User Should Be Able To Fill Forms - Single Car
    [Documentation]  Fill Vehicle Data and Insurant Data Forms - In Progress
    TricentisApp.Fill Form Pages  ${CATEGORIES.ONE}


User Should Be Able To Fill Forms - Cars CSV File
    [Tags]           all
    [Documentation]  Reading CSV File With Cars Information And Finalizing Workflow - In Progress
    
    TricentisApp.Process All Cars  ${CATEGORIES.ONE}  



