*** Variables ***
# Configuration
${BROWSER} =  chrome
${ENVIRONMENT} =  prod
&{BASE_URL}  dev=https://dev.cars.com/  qa=https://qa.cars.com/  prod=https://sampleapp.tricentis.com/101/index.php

&{CATEGORIES}    ONE=automobile  TWO=truck  THREE=motorcycle  FOUR=camper
${CSV_PATH}    /Users/miguelbarca/TestAutomation/Vehicle_Insurance_App/Data/Cars.csv

${FORM_TYPE}

#TODO - CREATE A CSV
&{INSURANT_DATA}    firstname=John    lastname=Doe    dob=01/01/1984    gender=gendermale    
...    streetaddress=123 Main St    country=Portugal    zipcode=12345    city=Lisbon    occupation=Employee    
...    hobbies=Speeding,BungeeJumping    website=http://example.com    picture=path/to/picture.jpg