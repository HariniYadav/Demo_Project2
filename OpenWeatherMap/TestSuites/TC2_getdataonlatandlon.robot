*** Settings ***
Documentation  Testing to validate different use cases on Open Weather Map API
Resource    C:/Users/HOME/PycharmProjects/Training/OpenWeatherMap/Resources/Resources.robot
Suite Setup     Create a session
Suite Teardown  Delete Sessions
Test Setup  log     Started execution of test case
Test Teardown  log   Completion of executing the test case

*** Test Cases ***
Weather Test2
    [Documentation]  This testcase will return the weather condition detailed report for a given Geographical Coordinates
    [Tags]  Geographical Coordinates
#    Pass Execution	All features available in this version test
    Allure Reports Directory
    Getting current weather conditions by giving geographical coordinates
    Entering weather details for particular geographicalcoodrinates in the report








