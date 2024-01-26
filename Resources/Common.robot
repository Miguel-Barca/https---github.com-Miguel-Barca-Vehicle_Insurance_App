*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DataManager.robot


*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    #Maximize Browser Window

End Web Test
    Close All Browsers