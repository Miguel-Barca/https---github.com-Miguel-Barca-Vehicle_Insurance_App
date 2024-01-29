*** Settings ***
Documentation    Use this layer to get data from external files
Library          ../CustomLibs/Csv.py
Library          OperatingSystem
Resource         ../Data/InputData.robot


*** Variables ***
@{all_cars_list}   # Initialize an empty list to store all cars
${PICTURE_NORMALIZED_PATH}


*** Keywords ***
Get CSV Data
    ${csv_data}=    Read CSV File    ${CSV_CARS_PATH}
    RETURN        ${csv_data}

Get List Of Cars
    @{all_cars_list} =  Get CSV Data
    RETURN  @{all_cars_list}


Get CSV Data - Insurants
    ${csv_data}=    Read CSV File    ${CSV_INSURANTS_PATH}
    RETURN        ${csv_data}


Get List Of Insurants
    @{all_insurants_list} =  Get CSV Data - Insurants
    RETURN  @{all_insurants_list}


Get Length List Of Insurants
    @{all_insurants_list} =  Get List Of Insurants

    #Setting upper range to use in "for loop"
    ${file_length}=  Get Length  ${all_insurants_list}

    RETURN  ${file_length}


Get CSV File Length
    @{cars_list}=  Get List Of Cars
    
    #Setting upper range to use in "for loop"
    ${file_length}=  Get Length  ${cars_list}

    RETURN  ${file_length}


Assign Picture Path
    ${PICTURE_NORMALIZED_PATH} =  OperatingSystem.Normalize Path     /Users/miguelbarca/TestAutomation/Vehicle_Insurance_App/Data/malePicture.jpeg
    Set Global Variable   ${PICTURE_NORMALIZED_PATH}

