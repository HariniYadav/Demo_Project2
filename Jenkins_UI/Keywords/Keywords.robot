*** Settings ***
Documentation  This is the robot format file which consits of the user-defined keywords for testing Jenkins UI page
Library  SeleniumLibrary
Variables    ../Encrypted/env.py
Variables           ../Variables/Variables.py
Variables           ../Locators/Locators.py
Library     CryptoLibrary    %{private_key_password}    variable_decryption=False

*** Keywords ***
Open the Browser
    Open Browser    ${url}    ${browser}    alias=Browser1

Maximize the Browser
    Maximize Browser Window

Set Implicit Time
    Set Selenium Implicit Wait  15 seconds

Close Browsers
    Close All Browsers

Getting Decrypted Text
    ${user}=    Get Decrypted Text  ${enc_user}
    Set Test Variable   ${user}
    ${password}=    Get Decrypted Text    ${enc_pwd}
    Set Test Variable   ${password}
    ${password1}=    Get Decrypted Text    ${wrong_pwd}
    Set Test Variable   ${password1}


Login with Credentials
    ${username} =     Call Method	${e}	get_username_name
    Input Text      name:${username}  ${user}
    ${passwrd} =     Call Method	${e}	get_password_name
    Input Text  name:${passwrd}  ${password}
    ${signin} =     Call Method	${e}	get_signIn_name
    Click Element  name:${signin}

Validating the Title of the Page
    Page Should Contain     ${title1}
    sleep   2

Selecting the Job
    ${jobname} =     Call Method	${e}	get_job_xpath
    Click Element  xpath:${jobname}
    Page Should Contain     ${title2}
    sleep   2

Deleting the Job
    ${deletexpath} =     Call Method	${e}	get_delete_xpath
    Click Element  xpath:${deletexpath}
    sleep   3
    handle alert    accept
    sleep   2


Creating New Job
    ${newitem} =     Call Method	${e}	get_newitem_classname
    Click Element  class:${newitem}
    ${text} =     Call Method	${e}	get_projectname_id
    Input Text  id:${text}  Demo_Job
    ${type} =     Call Method	${e}	get_projecttype_classname
    Click Element  class:${type}
    ${button} =     Call Method	${e}	get_okbutton_id
    Click Element  id:${button}
    ${desc} =     Call Method	${e}	get_description_name
    Input Text  name:${desc}  ${description}
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep   2
    ${buildbutton} =     Call Method	${e}	get_buildstep_xpath
    Click Element  xpath:${buildbutton}
    ${linktext} =     Call Method	${e}	get_commandtype_linktext
    Click Link  link:${linktext}
    ${commandbutton} =     Call Method	${e}	get_command_name
    Input Text  name:${commandbutton}  ${command}
    ${savebutton} =     Call Method	${e}	get_savebutton_xpath
    Click Element  xpath:${savebutton}
    sleep   5

Switching to New Window
    Execute Javascript	window.open()
    Switch Window	locator=NEW
    Go To   ${url}

Triggering the Build
    ${buildxpath} =     Call Method	${e}	get_build_xpath
    Click Element  xpath:${buildxpath}
    sleep   15
    Reload Page
    ${lastbuild} =     Call Method	${e}	get_lastbuild_xpath
    Click Element  xpath:${lastbuild}
    ${consoleoutput} =     Call Method	${e}	get_consoleoutput_xpath
    Click Element  xpath:${consoleoutput}
    ${outputtext} =     Call Method	${e}	get_consoleoutputtext_xpath
    ${finalstatus} =   Get Text  xpath:${outputtext}
    Log  ${finalstatus}
    sleep   3

SignIn with Invalid Credentials
    Open Browser    ${url}    ${browser}    alias=Browser2
    Maximize the Browser
    Set Implicit Time
    Getting Decrypted Text
    ${username} =     Call Method	${e}	get_username_name
    Input Text      name:${username}  ${user}
    ${passwrd} =     Call Method	${e}	get_password_name
    Input Text  name:${passwrd}  ${password1}
    ${signin} =     Call Method	${e}	get_signIn_name
    Click Element  name:${signin}
    Page Should Contain     ${title3}
    sleep   2

Getting Token
    ${accountxpath} =     Call Method	${e}	get_account_xpath
    Click Element  xpath:${accountxpath}
    ${configure} =     Call Method	${e}	get_configure_xpath
    Click Element  xpath:${configure}
    sleep    2
    ${addnew} =     Call Method	${e}	get_addnew_xpath
    Click Element  xpath:${addnew}
    ${tokenname} =     Call Method	${e}	get_token_xpath
    Input Text  xpath:${tokenname}  test_token
    ${generate} =     Call Method	${e}	get_generate_xpath
    Click Element  xpath:${generate}
    sleep    3
    Reload Page
    ${revoke} =     Call Method	${e}	get_revoke_xpath
    Click Element  xpath:${revoke}
    sleep   5
    handle alert    accept
    sleep   3
