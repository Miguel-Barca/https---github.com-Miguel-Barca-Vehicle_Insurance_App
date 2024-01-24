*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Variables ***
${FIRST_NAME_XPATH}                 xpath=//input[@id='firstname']
${LAST_NAME_XPATH}                  xpath=//input[@id='lastname']
${DOB_XPATH}                        xpath=//input[@id='birthdate']
#${GENDERMALE_RADIO_BUTTON_ID}       gendermale 
#${GENDERFEMALE_RADIO_BUTTON_ID}     genderfemale 
${STREET_ADDRESS_XPATH}             xpath=//input[@id='streetaddress']
${COUNTRIES_LIST_XPATH}             xpath=//select[@id='country']
${ZIP_CODE_XPATH}                   xpath=//input[@id='zipcode']
${CITY_XPATH}                       xpath=//input[@id='city']
${WEBSITE_XPATH}                    xpath=//input[@id='website']
${PICTURE_XPATH}                    xpath=//input[@id='picture']
${OCCUPATION_LIST_XPATH}            xpath=//select[@id='occupation']
${NEXT_ENTER_PRODUCT_ID}            nextenterproductdata
${GENDERMALE_RADIO_BUTTON}          //form[@id="insurance-form"]//div[4]/p/label[1]/span  #partial path //
${GENDERFEMALE_RADIO_BUTTON}        //form[@id="insurance-form"]//div[4]/p/label[2]/span
${HOBBIES_SPEEDING_CHECKBOX}        //form[@id="insurance-form"]//div[10]/p/label[1]/span
${HOBBIES_BUNGEE_CHECKBOX}          //form[@id="insurance-form"]//div[10]/p/label[2]/span
${HOBBIES_CLIFF_DIVING_CHECKBOX}    //form[@id="insurance-form"]//div[10]/p/label[3]/span
${HOBBIES_SKYDIVING_CHECKBOX}       //form[@id="insurance-form"]//div[10]/p/label[4]/span
${HOBBIES_OTHER_CHECKBOX}           //form[@id="insurance-form"]//div[10]/p/label[5]/span

### TODO HOBBIES CHECKBOX TAG

*** Keywords ***
Fill With Data and Proceed To Next Page
    Input Text                  ${FIRST_NAME_XPATH}                 ${INSURANT_DATA['firstname']}
    Input Text                  ${LAST_NAME_XPATH}                  ${INSURANT_DATA['lastname']}
    Input Text                  ${DOB_XPATH}                        ${INSURANT_DATA['dob']}
    Select Gender               ${INSURANT_DATA['gender']}
    Input Text                  ${STREET_ADDRESS_XPATH}             ${INSURANT_DATA['streetaddress']}
    Select From List By Value   ${COUNTRIES_LIST_XPATH}             ${INSURANT_DATA['country']}
    Input Text                  ${ZIP_CODE_XPATH}                   ${INSURANT_DATA['zipcode']}
    Input Text                  ${CITY_XPATH}                       ${INSURANT_DATA['city']}
    Select From List By Value   ${OCCUPATION_LIST_XPATH}            ${INSURANT_DATA['occupation']}
    Select Hobbies              ${INSURANT_DATA['hobbies']}
    Input Text                  ${WEBSITE_XPATH}                    ${INSURANT_DATA['website']}
    ######Add Profile picture     
    #Sleep   3s
    Proceed To Next Page
    
Select Gender
    [Arguments]  ${INSURANT_DATA['gender']}
    IF   '${INSURANT_DATA['gender']}' == 'gendermale'   Click Element  ${GENDERMALE_RADIO_BUTTON} 
    #Note that the method below does not work in this case. 
    #Select Radio Button   group_name=Gender   value=Male
    #ElementClickInterceptedException: Message: element click intercepted:
    #  Element <input id="gendermale" name="Gender" type="radio" value="Male" style="position: absolute; left: -9999px;
    # "> is not clickable at point (303, 512). Other element would receive the click: <span class="ideal-radio"></span> 
    
    ...  ELSE IF  '${INSURANT_DATA['gender']}' == 'genderfemale'  Click Element  ${GENDERFEMALE_RADIO_BUTTON}
    ...  ELSE  Log  message=Error with data


Select Hobbies
    [Arguments]  ${INSURANT_DATA['hobbies']}
    IF   '${INSURANT_DATA['hobbies']}' == 'Speeding'   Click Element  ${HOBBIES_SPEEDING_CHECKBOX} 
    ...  ELSE IF  '${INSURANT_DATA['hobbies']}' == 'Bungee Jumping'   Click Element  ${HOBBIES_BUNGEE_CHECKBOX}
    ...  ELSE IF  '${INSURANT_DATA['hobbies']}' == 'Cliff Diving'   Click Element  ${HOBBIES_CLIFF_DIVING_CHECKBOX}
    ...  ELSE IF  '${INSURANT_DATA['hobbies']}' == 'Skydiving'   Click Element  ${HOBBIES_SKYDIVING_CHECKBOX}
    ...  ELSE IF  '${INSURANT_DATA['hobbies']}' == 'Other'   Click Element  ${HOBBIES_OTHER_CHECKBOX}
    ...  ELSE  Log  message=Error with data

Add Profile picture
    #TODO  Not working
    ${path_to_directory}  Set Variable  /Users/miguelbarca/TestAutomation/Vehicle_Insurance_App/Data
    ${file}  Set Variable  malePicture.jpeg
    ${my_locator}  Set Variable  //input[@id='picture']
    

    #Log Many  ${path_to_directory}${/}${file}


    @{my_file_list}    OperatingSystem.List Files In Directory    ${path_to_directory}

    FOR    ${file}    IN     @{my_file_list}
        ${result}=    Choose File    ${my_locator}    ${path_to_directory}${/}${file}
    END


Proceed To Next Page
    Click Button   ${NEXT_ENTER_PRODUCT_ID} 