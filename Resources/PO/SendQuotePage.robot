*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../Resources/DataManager.robot


*** Variables ***
${INPUT_EMAIL_XPATH}         //input[@id="email"]
${PHONE_XPATH}               //input[@id="phone"]
${USERNAME_XPATH}            //input[@id="username"]
${PASSWORD_XPATH}            //input[@id="password"]
${CONFIRM_PASSWORD_XPATH}    //input[@id="confirmpassword"]
${COMMENT_AREA_XPATH}        //textarea[@id="Comments"]
${USER_PASSWORD}
${SEND_BUTTON}               //button[@id="sendemail"]
${SUCCESS_POP_UP_XATH}       //div[@class="sweet-alert showSweetAlert visible"]


*** Keywords ***
Fill With Data and Finalize
    Input Text      ${INPUT_EMAIL_XPATH}    ${USER_DATA['email']}
    Input Text      ${PHONE_XPATH}          ${USER_DATA['phone']}
    Input Text      ${USERNAME_XPATH}       ${USER_DATA['username']}
    Fill Password   ${USER_DATA['password']}
    Add Comment
    Press Send And Wait Success Message


Generate Random Password
    # TODO: implement keyword "Generate Random Password".
    ${USER_PASSWORD}  Generate Random String   length=2   chars=[UPPER]LOWER][LETTERS][NUMBERS]
    RETURN  ${USER_PASSWORD}


Fill Password
    [Arguments]    ${USER_PASSWORD}
    Input Text     ${PASSWORD_XPATH}  ${USER_PASSWORD}
    Input Text     ${CONFIRM_PASSWORD_XPATH}  ${USER_PASSWORD}


Add Comment
    Input Text   ${COMMENT_AREA_XPATH}  ${USER_DATA['comment']}


Press Send And Wait Success Message
    #Confirm That The Button Is Visible
    Wait Until Element Is Visible  ${SEND_BUTTON}  
    Click Button                   ${SEND_BUTTON} 
    Validate Pop-Up Success Message


Validate Pop-Up Success Message
    ${message}  Set Variable   Sending e-mail success!
    #MANDATORY WAIT
    Wait Until Element Is Visible   ${SUCCESS_POP_UP_XATH}     timeout=10
    Wait Until Element Contains     ${SUCCESS_POP_UP_XATH}   ${message}
    

