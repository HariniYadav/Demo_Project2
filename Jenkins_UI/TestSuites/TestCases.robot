*** Settings ***
Documentation  Testing to validate different use cases on Jenkins UI Page
Resource            ../Keywords/Keywords.robot
Variables           ../Variables/Variables.py
Variables           ../Locators/Locators.py
Suite Setup  Open the Browser
Suite Teardown  Close Browsers

*** Test Cases ***
TestCase1: Login
    [Documentation]  This testcase validates the sign in scenario on Jenkins UI Page
    [Tags]  Login
    Maximize the Browser
    Set Implicit Time
    Getting Decrypted Text
    Login with Credentials
    Validating the Title of the Page

TestCase2: New Item
    [Documentation]  This testcase validates the creation of new job scenario on Jenkins UI Page
    [Tags]  NewItem
    Selecting the Job
    Deleting the Job
    Creating New Job

TestCase3: Trigger Build
    [Documentation]  This testcase validates the triggering a build scenario on Jenkins UI Page
    [Tags]  Trigger
    Switching to New Window
    Getting Decrypted Text
    Login with Credentials
    Selecting the Job
    Triggering the Build

TestCase4: Invalid Test
    [Documentation]  This testcase validates the the sign in scenario on Jenkins UI Page with invalid credentials
    [Tags]  Invalid
    SignIn with Invalid Credentials
