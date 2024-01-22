*** Settings ***
Documentation    Use this layer to get data from external files
Library          ../CustomLibs/Csv.py


*** Keywords ***
Get CSV Data
    #[Arguments]  ${FilePath}
    ${csv_data}=    Read CSV File    ${CSV_PATH}
    RETURN        ${csv_data}
