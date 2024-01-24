*** Settings ***
Documentation    Use this layer to get data from external files
Library          ../CustomLibs/Csv.py
Library          OperatingSystem

*** Variables ***
@{all_cars_list}   # Initialize an empty list to store all cars
${PICTURE_NORMALIZED_PATH}

*** Keywords ***
Get CSV Data
    ${csv_data}=    Read CSV File    ${CSV_PATH}
    RETURN        ${csv_data}

Get List Of Cars
    @{all_cars_list} =  Get CSV Data
    RETURN  @{all_cars_list}

Get Insurant Data
    RETURN  &{INSURANT_DATA}

Get CSV File Length
    @{cars_list}=  Get List Of Cars
    
    #Setting upper range to use in "for loop"
    ${file_length}=  Get Length  ${cars_list}

    RETURN  ${file_length}

Assign Picture Path
    ${PICTURE_NORMALIZED_PATH} =  OperatingSystem.Normalize Path     /Users/miguelbarca/TestAutomation/Vehicle_Insurance_App/Data/malePicture.jpeg
    Set Global Variable   ${PICTURE_NORMALIZED_PATH}