*** Settings ***
Documentation  This is a Resource file which contains custom keywords
Library  RequestsLibrary
Library     Collections
Library     OperatingSystem
Library     BuiltIn
Library  SeleniumLibrary
Variables           ../Variables/Variables.py
Variables           ../Calculations/Calculations.py

*** Keywords ***
Create a session
    Create Session      mysession     ${BASE_URL}

Create a Text file
    Create File    ${dir}/results1.txt

Delete Sessions
    Delete All Sessions

Create session and file
    Create a session
    Create a Text file

Tab space in Text file
    Append To File  ${dir}/results1.txt     \t

Getting current weather conditions by giving place name
    [Documentation]   This custom keyword will return the current weather conditions of a place given
    [Arguments]     ${place}
    ${params}   Create Dictionary   q=${place}  units=metric   appid=${API_KEY}
    ${response}=    Get Request     mysession   ${REQUEST_URI}  params=${params}
    ${actual_code}=     convert To string     ${response.status_code}
    Should be equal     ${actual_code}        ${expected_code}
    Append To File  ${dir}/results1.txt    Success Message: The Open Weather Map API is working fine for the place-${place} \n
    Append To File  ${dir}/results1.txt     \n
    ${body}=     convert to string  ${response.content}
    ${json_dict} =  set variable  ${response.json()}
    Set Test Variable   ${json_dict}

Entering weather details for a particular place in the report
    [Arguments]     ${place}
    [Documentation]   This custom keyword will enter the values in the report text file
    ${json_string}=     convert to string  ${json_dict}
    Append To File  ${dir}/results1.txt    The below is the current weather conditions of the place-${place} in string format: \n
    Append To File  ${dir}/results1.txt     ${json_string}
    Append To File  ${dir}/results1.txt     \n
    Append To File  ${dir}/results1.txt     The Weather Details in pretty detailed format are given below: \n

    Append To File  ${dir}/results1.txt     City Details: \n
    Tab space in Text file
    ${city}=     set variable    ${json_dict["name"]}
    Append To File  ${dir}/results1.txt     City Name: ${city} \n
    Tab space in Text file
    ${cityid}=     set variable    ${json_dict["id"]}
    Append To File  ${dir}/results1.txt     City Id: ${cityid} \n
    ${countrycode}=     set variable    ${json_dict["sys"]["country"]}
    Append To File  ${dir}/results1.txt     Country Code: ${countrycode} \n


    Append To File  ${dir}/results1.txt     Geographic Coordinates: \n
    Tab space in Text file
    ${latitude}=     set variable    ${json_dict["coord"]["lat"]}
    Append To File  ${dir}/results1.txt     Latitude: ${latitude} degrees \n
    Tab space in Text file
    ${longitude}=     set variable    ${json_dict["coord"]["lon"]}
    Append To File  ${dir}/results1.txt     Longitude: ${longitude} degrees \n

    Append To File  ${dir}/results1.txt     Date and Time Details: \n
    Tab space in Text file
    ${unix_timestamp}=     set variable    ${json_dict["dt"]}
    ${dt1} =	Call Method	${v}	get_datetime    ${unix_timestamp}
    Append To File  ${dir}/results1.txt     Date and Time: ${dt1}\n
    Tab space in Text file
    ${sunrise_timestamp}=     set variable    ${json_dict["sys"]["sunrise"]}
    ${dt2} =	Call Method	${v}	get_datetime    ${sunrise_timestamp}
    Append To File  ${dir}/results1.txt     Sunrise Time: ${dt2}\n
    Tab space in Text file
    ${sunset_timestamp}=     set variable    ${json_dict["sys"]["sunset"]}
    ${dt3} =	Call Method	${v}	get_datetime    ${sunset_timestamp}
    Append To File  ${dir}/results1.txt     Sunset Time: ${dt3}\n

    Append To File  ${dir}/results1.txt     Temperature Values: \n
    Tab space in Text file
    ${tempinCelsius}=     set variable    ${json_dict["main"]["temp"]}
    Append To File  ${dir}/results1.txt     Temperature in Celsius: ${tempinCelsius} `C \n
    ${tempinFahrenheit} =	Call Method	${v}	get_temp_in_Fahrenheit    ${tempinCelsius}
    Tab space in Text file
    Append To File  ${dir}/results1.txt     Temperature in Fahrenheit: ${tempinFahrenheit} `F \n
    ${tempinKelvin} =	Call Method	${v}	get_temp_in_Kelvin    ${tempinCelsius}
    Tab space in Text file
    Append To File  ${dir}/results1.txt     Temperature in Kelvin: ${tempinKelvin} kelvin \n
    Tab space in Text file
    ${min_temp}=     set variable    ${json_dict["main"]["temp_min"]}
    Append To File  ${dir}/results1.txt     Minimum Temperature in Celsius: ${min_temp} `C \n
    Tab space in Text file
    ${max_temp}=     set variable    ${json_dict["main"]["temp_max"]}
    Append To File  ${dir}/results1.txt     Maximum Temperature in Celsius: ${max_temp} `C \n

    ${pressure}=    set variable    ${json_dict["main"]["pressure"]}
    Append To File  ${dir}/results1.txt     Atmospheric Pressure: ${pressure} hpa \n

    ${humidity}=    set variable    ${json_dict["main"]["humidity"]}
    Append To File  ${dir}/results1.txt     Humidity: ${humidity} % \n

    ${cloudiness}=    set variable    ${json_dict["clouds"]["all"]}
    Append To File  ${dir}/results1.txt     Cloudiness: ${cloudiness} % \n

    Append To File  ${dir}/results1.txt     Wind Conditions: \n
    Tab space in Text file
    ${speed}=     set variable    ${json_dict["wind"]["speed"]}
    Append To File  ${dir}/results1.txt     Wind Speed: ${longitude} meter/sec \n
    Tab space in Text file
    ${direction}=     set variable    ${json_dict["wind"]["deg"]}
    Append To File  ${dir}/results1.txt     Wind Direction: ${direction} degrees \n

    Append To File  ${dir}/results1.txt     Weather Condition Codes: \n
    Tab space in Text file
    ${weather_list}=     set variable    ${json_dict["weather"]}
    ${first_element}=    set variable  ${weather_list}[0]
    ${id}=     set variable    ${first_element["id"]}
    Append To File  ${dir}/results1.txt     Weather Condition Id: ${id} \n
    Tab space in Text file
    ${condition}=     set variable    ${first_element["main"]}
    Append To File  ${dir}/results1.txt     Weather Condition: ${condition} \n
    Tab space in Text file
    ${description}=     set variable    ${first_element["description"]}
    Append To File  ${dir}/results1.txt     Weather Description: ${description} \n
    Tab space in Text file
    ${icon}=     set variable    ${first_element["icon"]}
    Append To File  ${dir}/results1.txt     Weather Icon: ${icon} \n
    Append To File  ${dir}/results1.txt   ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${icon1}=   set variable    ${icon}@2x.png
    ${url}=     set variable    http://openweathermap.org/img/wn/${icon1}
    Open Browser    ${url}  ${Browser}
    ${screenshot_filename}=    set variable    ${SCREENSHOT_NAME}-${place}.png
    ${fullPATH}=   set variable    ${dir}/${screenshot_filename}
    Capture Element Screenshot  tag:img     filename=${fullPATH}
    Set Test Variable   ${screenshot_filename}
    sleep   2s
    Close Browser
    Log  <a href="http://localhost:63342/Training/OpenWeatherMap/Results/results1.txt">Results Data File<a>   html=True


Getting current weather conditions by giving geographical coordinates
    [Documentation]   This custom keyword will return  the current weather conditions of a place for the given geographical coordinates
#    Create Session      mysession     ${BASE_URL}
    ${params}   Create Dictionary   lat=${LAT}   lon=${LON}    units=metric     appid=${API_KEY}
    ${response}=    Get Request     mysession   ${REQUEST_URI}  params=${params}
    ${actual_code}=     convert To string     ${response.status_code}
    Should be equal     ${actual_code}        ${expected_code}
    ${body}=     convert to string  ${response.content}
    ${json_dict} =  set variable  ${response.json()}
    Set Test Variable   ${json_dict}
    Create File    ${dir}/results2.txt
    Append To File  ${dir}/results2.txt    Success Message: The Open Weather Map API is working fine for the given lat-${LAT} and lon-${LON} \n
    Append To File  ${dir}/results2.txt     \n

Entering weather details for particular geographical coodrinates in the report
    [Documentation]   This custom keyword will enter the values in the report text file
    ${json_string}=     convert to string  ${json_dict}
    Append To File  ${dir}/results2.txt    The below is the current weather conditions of the place having lat-${LAT} and lon-${LON} in string format: \n
    Append To File  ${dir}/results2.txt     ${json_string}
    Append To File  ${dir}/results2.txt     \n
    Log  <a href="http://localhost:63342/Training/OpenWeatherMap/Results/results2.txt">Results Data File<a>   html=True


Embed the Screenshot File
    [Documentation]  This custom keyword will help in embed the external screenshot file in the report
    [Arguments]     ${place}
    Log  <a href="http://localhost:63342/Training/OpenWeatherMap/Results/${screenshot_filename}">Weather Icon Screeshot<a>   html=True

Allure Reports Directory
    [Documentation]  This custom keyword will help in finding AllureReports directory and empties it if exists
    ${path}=    Set Variable    C:/Users/HOME/PycharmProjects/Training/OpenWeatherMap/AllureReports
    ${status}=   Run Keyword And Return Status   Directory Should Exist	path=${path}
    Run Keyword If	'${status}' == 'True'  Empty Directory     path=${path}








