*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Resource  ../Resources/DataManager.robot

*** Variables ***
${FIRST_NAME_XPATH}                 xpath=//input[@id='firstname']
${LAST_NAME_XPATH}                  xpath=//input[@id='lastname']
${DOB_XPATH}                        xpath=//input[@id='birthdate']
${STREET_ADDRESS_XPATH}             xpath=//input[@id='streetaddress']
${COUNTRIES_LIST_XPATH}             xpath=//select[@id='country']
${ZIP_CODE_XPATH}                   xpath=//input[@id='zipcode']
${CITY_XPATH}                       xpath=//input[@id='city']
${WEBSITE_XPATH}                    xpath=//input[@id='website']
${PICTURE_XPATH}                    xpath=//input[@id='picture']
${OCCUPATION_LIST_XPATH}            xpath=//select[@id='occupation']
${NEXT_ENTER_PRODUCT_ID}            nextenterproductdata
${OPEN_FILE_BUTTON_ID}              open
${GENDERMALE_RADIO_BUTTON}          //form[@id="insurance-form"]//div[4]/p/label[1]/span  
${GENDERFEMALE_RADIO_BUTTON}        //form[@id="insurance-form"]//div[4]/p/label[2]/span
${HOBBIES_SPEEDING_CHECKBOX}        //form[@id="insurance-form"]//div[10]/p/label[1]/span
${HOBBIES_BUNGEE_CHECKBOX}          //form[@id="insurance-form"]//div[10]/p/label[2]/span
${HOBBIES_CLIFF_DIVING_CHECKBOX}    //form[@id="insurance-form"]//div[10]/p/label[3]/span
${HOBBIES_SKYDIVING_CHECKBOX}       //form[@id="insurance-form"]//div[10]/p/label[4]/span
${HOBBIES_OTHER_CHECKBOX}           //form[@id="insurance-form"]//div[10]/p/label[5]/span
${COUNTER_INSURANT_LIST}            0


*** Keywords ***
Get Insurant from List, Fill Form And Increment Counter
    [Arguments]  ${COUNTER_INSURANT_LIST}
    @{all_insurants_list}=  DataManager.Get List Of Insurants
    
    #Defining which car go gt from @{cars_list}
    ${single_insurant}  Set Variable    ${all_insurants_list}[${COUNTER_INSURANT_LIST}]

    # Mapping values from the CS unto the WebApp Form
    Input Text                  ${FIRST_NAME_XPATH}                 ${single_insurant}[0]
    Input Text                  ${LAST_NAME_XPATH}                  ${single_insurant}[1]
    Input Text                  ${DOB_XPATH}                        ${single_insurant}[2]
    Select Gender                                                   ${single_insurant}[3]  
    Input Text                  ${STREET_ADDRESS_XPATH}             ${single_insurant}[4]
    Select From List By Value   ${COUNTRIES_LIST_XPATH}             ${single_insurant}[5]
    Input Text                  ${ZIP_CODE_XPATH}                   ${single_insurant}[6]
    Input Text                  ${CITY_XPATH}                       ${single_insurant}[7]
    Select From List By Value   ${OCCUPATION_LIST_XPATH}            ${single_insurant}[8]
    Evaluate and Select Hobbies   ${single_insurant}[9]
    Input Text                  ${WEBSITE_XPATH}                    ${single_insurant}[10]
    ######Add Profile picture     
    Increment Counter
    Proceed To Next Page


Increment Counter
    #Persistence of the data in test execution
    ${COUNTER_INSURANT_LIST}   Evaluate    ${COUNTER_INSURANT_LIST} + 1
    Set Global Variable    ${COUNTER_INSURANT_LIST}

    
Select Gender
    [Arguments]  ${INSURANT_DATA['gender']}
    Run Keyword  Select ${INSURANT_DATA['gender']}


Select gendermale
    Click Element  ${GENDERMALE_RADIO_BUTTON}


Select genderfemale
    Click Element  ${GENDERFEMALE_RADIO_BUTTON}


Evaluate and Select Hobbies
    [Arguments]  ${INSURANT_DATA['hobbies']}
    Run Keyword  Select ${INSURANT_DATA['hobbies']} Hobby Option  


Select Speeding Hobby Option
    Click Element  ${HOBBIES_SPEEDING_CHECKBOX} 


Select Bungee Jumping Hobby Option
    Click Element  ${HOBBIES_BUNGEE_CHECKBOX}


Select Cliff Diving Hobby Option
    Click Element  ${HOBBIES_CLIFF_DIVING_CHECKBOX}


Select Skydiving Hobby Option
    Click Element  ${HOBBIES_SKYDIVING_CHECKBOX}


Select Other Hobby Option
    Click Element  ${HOBBIES_OTHER_CHECKBOX}


Proceed To Next Page
    Click Button   ${NEXT_ENTER_PRODUCT_ID} 


Add Profile picture
    #TODO  Not working
    ${path_to_directory}  Set Variable  /Users/miguelbarca/TestAutomation/Vehicle_Insurance_App/Data
    ${file}  Set Variable  malePicture.jpeg
    ${my_locator}  Set Variable  //input[@id='picture']
    

    @{my_file_list}    OperatingSystem.List Files In Directory    ${path_to_directory}

    FOR    ${file}    IN     @{my_file_list}
        Click Button   ${OPEN_FILE_BUTTON_ID} 
        #${result}=    Choose File    ${my_locator}    ${path_to_directory}${/}${file}
        #Choose File    ${my_locator}    ${path_to_directory}${/}${file}
        Choose File    ${my_locator}    ${path_to_directory}${/}${file}
        Sleep   5s
    END