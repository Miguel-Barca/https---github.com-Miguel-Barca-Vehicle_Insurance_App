*** Settings ***
Documentation    Use this layer to get data from external files
Library          ../CustomLibs/Csv.py
Library          OperatingSystem
Resource         ../Data/InputData.robot


*** Variables ***
@{all_cars_list}   # Initialize an empty list to store all cars
${PICTURE_NORMALIZED_PATH}
${RANGE}
${COUNTER}   0


*** Keywords ***
Get Automobile CSV Data
    ${csv_data}=    Read CSV File    ${CSV_CARS_PATH}
    RETURN        ${csv_data}

Get Automobile CSV File - List
    @{all_cars_list} =  Get Automobile CSV Data
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
    @{cars_list}=  Get Automobile CSV File - List
    
    #Setting upper range to use in "for loop"
    ${file_length}=  Get Length  ${cars_list}

    RETURN  ${file_length}


Assign Picture Path
    ${PICTURE_NORMALIZED_PATH} =  OperatingSystem.Normalize Path     /Users/miguelbarca/TestAutomation/Vehicle_Insurance_App/Data/malePicture.jpeg
    Set Global Variable   ${PICTURE_NORMALIZED_PATH}


Get Truck CSV File - List
    @{TRUCK_LIST}=  Csv.Read Csv File  ${CSV_TRUCKS_PATH}
    RETURN    @{TRUCK_LIST}


Get Motorcycle CSV File - List
    @{MOTORCYCLE_LIST}=  Csv.Read Csv File  ${CSV_MOTORCYCLE_PATH}
    RETURN    @{MOTORCYCLE_LIST}


Get Camper CSV File - List
    @{CAMPER_LIST}=  Csv.Read Csv File  ${CSV_CAMPER_PATH}
    RETURN    @{CAMPER_LIST}


Increment Counter
    #Working - Persistence of the data in test execution
    ${COUNTER}   Evaluate    ${COUNTER} + 1
    Set Global Variable    ${COUNTER}


Defining Automobile CSV File Range Value
    #Defining upper limit 
    @{AUTOMOBILE_LIST}=  Get Automobile CSV File - List
    ${RANGE}=  Get Length  ${AUTOMOBILE_LIST}
    Set Global Variable  ${RANGE}


Defining Truck CSV File Range Value
    #Defining upper limit 
    @{TRUCK_LIST}=  Get Truck CSV File - List
    ${RANGE}=  Get Length  ${TRUCK_LIST}
    Set Global Variable  ${RANGE}


Defining Motorcycle CSV File Range Value
    #Defining upper limit 
    @{MOTORCYCLE_LIST}=  Get Motorcycle CSV File - List
    ${RANGE}=  Get Length  ${MOTORCYCLE_LIST}
    Set Global Variable  ${RANGE}


Defining Camper CSV File Range Value
    #Defining upper limit 
    @{CAMPER_LIST}=  Get Camper CSV File - List
    ${RANGE}=  Get Length  ${CAMPER_LIST}
    Set Global Variable  ${RANGE}