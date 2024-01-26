*** Variables ***
# Configuration
${BROWSER} =  chrome
${ENVIRONMENT} =  prod
&{BASE_URL}  dev=https://dev.cars.com/  qa=https://qa.cars.com/  prod=https://sampleapp.tricentis.com/101/index.php

&{CATEGORIES}    ONE=automobile  TWO=truck  THREE=motorcycle  FOUR=camper
${CSV_CARS_PATH}    /Users/miguelbarca/TestAutomation/Vehicle_Insurance_App/Data/Cars.csv
${CSV_INSURANTS_PATH}    /Users/miguelbarca/TestAutomation/Vehicle_Insurance_App/Data/Insurants.csv

${FORM_TYPE}

#For hardcoded test case
&{INSURANT_DATA}    firstname=John    lastname=Doe    dob=01/01/1984    gender=gendermale    
...    streetaddress=123 Main St    country=Portugal    zipcode=12345    city=Lisbon    occupation=Employee    
...    hobbies=Speeding    website=https://github.com/Miguel-Barca    picture=path/to/picture.jpg

#TODO - CREATE A CSV
&{PRODUCT_DATA}    startdate=01/01/2025   value=20000000   
...    bonus=Bonus 8    damageinsurance=Full Coverage    optional=Euro Protection  
...    courtesycar=Yes

#TODO - CREATE A CSV
&{USER_DATA}    email=test@tricentis.com   phone=919999999 
...    username=Miguel_Barca  password=Qwerty_1
...    comment=Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
