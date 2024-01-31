*** Variables ***
# Configuration
${BROWSER} =  chrome
${ENVIRONMENT} =  prod
&{BASE_URL}  dev=https://dev.cars.com/  qa=https://qa.cars.com/  prod=https://sampleapp.tricentis.com/101/index.php

&{CATEGORIES}    ONE=Automobile  TWO=Truck  THREE=Motorcycle  FOUR=Camper


${FORM_TYPE}

#For hardcoded test case
&{INSURANT_DATA}    firstname=John    lastname=Doe    dob=01/01/1984    gender=gendermale    
...    streetaddress=123 Main St    country=Portugal    zipcode=12345    city=Lisbon    occupation=Employee    
...    hobbies=Speeding    website=https://github.com/Miguel-Barca    picture=path/to/picture.jpg

#For hardcoded test case
&{PRODUCT_DATA}    startdate=01/01/2025   value=20000000   
...    bonus=Bonus 8    damageinsurance=Full Coverage    optional=Euro Protection  
...    courtesycar=Yes

#For hardcoded test case
&{USER_DATA}    email=test@tricentis.com   phone=919999999 
...    username=Miguel_Barca  password=Qwerty_1
...    comment=Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. 


${AUTOMOBILE_CATEGORY}  Automobile
${TRUCK_CATEGORY}       Truck
${MOTORCYCLE_CATEGORY}  Motorcycle
${CAMPER_CATEGORY}      Camper
${CSV_TRUCKS_PATH}      Data/CSVFiles/Trucks.csv
${CSV_MOTORCYCLE_PATH}  Data/CSVFiles/Motorcycle.csv
${CSV_CAMPER_PATH}      Data/CSVFiles/Camper.csv
${CSV_CARS_PATH}        Data/CSVFiles/Cars.csv
${CSV_INSURANTS_PATH}   Data/CSVFiles/Insurants.csv

${ACTIVE_CATEGORY}