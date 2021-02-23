*** Settings ***
Documentation  Testing to validate different use cases on Open Weather Map API
Metadata   Input Data File    http://localhost:63342/Training/OpenWeatherMap/TestData/testdata.csv
Resource    C:/Users/HOME/PycharmProjects/Training/OpenWeatherMap/Resources/Resources.robot
Library     DataDriver     file=C:/Users/HOME/PycharmProjects/Training/OpenWeatherMap/TestData/testdata.csv
Suite Setup     Create session and file
Suite Teardown  Delete Sessions
Test Setup  log     Started execution of test case
Test Teardown  log   Completion of executing the test case
Test Template  Weather Test1

*** Test Cases ***
Getting current weather conditions for place ${place}

*** Keywords ***
Weather Test1
    [Documentation]  This testcase will return the weather condition detailed report for a given city
    [Tags]  Place
    [Arguments]     ${place}
#    Pass Execution	All features available in this version test
    Allure Reports Directory
    Getting current weather conditions by giving place name     ${place}
    Entering weather details for a particular place in the report   ${place}
    Embed the Screenshot File   ${place}



#robot --listener allure_robotframework TestSuites/

#robot --listener allure_robotframework;AllureReports TestSuites/TC1_getcurrentdata.robot

#robot --listener allure_robotframework;AllureReports TestSuites/TC2_getdataonlatandlon.robot

#allure generate C:\Users\HOME\PycharmProjects\Training\OpenWeatherMap\AllureReports --clean
