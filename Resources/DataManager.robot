*** Settings ***
Documentation    Use this layer to get data from external files
Library          ../CustomLibs/Csv.py

*** Variables ***
@{all_cars_list}   # Initialize an empty list to store all cars


*** Keywords ***
Get CSV Data
    ${csv_data}=    Read CSV File    ${CSV_PATH}
    RETURN        ${csv_data}

Get List Of Cars
    @{all_cars_list} =  Get CSV Data
    RETURN  @{all_cars_list}

Get Insurant Data
    RETURN  &{INSURANT_DATA}