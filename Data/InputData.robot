*** Variables ***
# Configuration
${BROWSER} =  chrome
${ENVIRONMENT} =  prod
&{BASE_URL}  dev=https://dev.cars.com/  qa=https://qa.cars.com/  prod=https://sampleapp.tricentis.com/101/index.php

&{CATEGORIES}    ONE=automobile  TWO=truck  THREE=motorcycle  FOUR=camper
${CSV_PATH}    /Users/miguelbarca/TestAutomation/Vehicle_Insurance_App/Data/Cars.csv