*** Settings ***
Library     OperatingSystem
Library  RequestsLibrary
Library     Collections
Library     BuiltIn

*** Variables ***
${BASE_URL}  http://localhost:8080/
${expected_code}    200
${expected_code1}    201
${api_token_name}   my_token
${dir}  C:\\Users\\HOME\\PycharmProjects\\Training\\Jenkins_API\\Results
${job_name}     First_Job
${expected_count}   2

*** Test Cases ***
Jenkins Demo Test
    [Documentation]  Test case validates different use cases on Jenkins API Page
    Create a session
    Getting the details in Jenkins API page
    Triggering the build with API token name
    Enter Output in Text File
    Validating the output of API data
    Delete Sessions

*** Keywords ***
Create a session
    ${auth}=    create list     admin   117e4cb54419e33718c072badfc30dbefa
    Create Session      mysession     ${BASE_URL}      auth=${auth}

Getting the details in Jenkins API page
    ${params}   Create Dictionary   pretty=true
    ${response}=    Get Request     mysession   api/json?  params=${params}
    ${actual_code}=     convert To string     ${response.status_code}
    Should be equal     ${actual_code}        ${expected_code}
    ${body}=     convert to string  ${response.content}
    ${json_output} =  set variable  ${response.json()}
    Set Test Variable   ${json_output}
    ${params1}   Create Dictionary   pretty=true    tree=jobs[name,color]{0,3}
    ${response1}=    Get Request     mysession   api/json?  params=${params1}
    ${actual_code1}=     convert To string     ${response1.status_code}
    Should be equal     ${actual_code1}        ${expected_code}
    ${json_output1} =  set variable  ${response1.json()}
    Set Test Variable   ${json_output1}
    ${params2}   Create Dictionary   pretty=true    depth=2
    ${response2}=    Get Request     mysession   api/json?  params=${params2}
    ${actual_code2}=     convert To string     ${response2.status_code}
    Should be equal     ${actual_code2}        ${expected_code}
    ${json_output2} =  set variable  ${response2.json()}
    Set Test Variable   ${json_output2}

Validating the output of API data
    ${params}   Create Dictionary   pretty=true tree=jobs[name,color]
    ${response}=    Get Request     mysession   api/json?  params=${params}
    ${json} =  set variable  ${response.json()}
    ${jobs_list}=     set variable    ${json["jobs"]}
    Log to Console      ${jobs_list}
    ${cnt}=    Get length    ${jobs_list}
    Should Be Equal As Numbers    ${cnt}        ${expected_count}

Triggering the build with API token name
    ${params}   Create Dictionary   token=${api_token_name}
    ${response}=    Post Request     mysession   job/${job_name}/build   params=${params}
    ${actual_code}=     convert To string     ${response.status_code}
    Should be equal     ${actual_code}        ${expected_code1}

Enter Output in Text File
    ${json_string}=     convert to string  ${json_output}
    ${json_string1}=     convert to string  ${json_output1}
    ${json_string2}=     convert to string  ${json_output2}
    Create File    ${dir}/results.txt
    Append To File  ${dir}/results.txt    The below is the details of triggered jobs retrived from Jenkins API in JSON format \n
    Append To File  ${dir}/results.txt     ${json_string}
    Append To File  ${dir}/results.txt     \n
    Append To File  ${dir}/results.txt   --------------------------------------------------------------------------------------------------------------------------------------------\n
    Append To File  ${dir}/results.txt    The below is the details of first three jobs retrived from Jenkins API in JSON format \n
    Append To File  ${dir}/results.txt     ${json_string1}
    Append To File  ${dir}/results.txt     \n
    Append To File  ${dir}/results.txt   --------------------------------------------------------------------------------------------------------------------------------------------\n
    Append To File  ${dir}/results.txt    The below is the details of triggered jobs retrived from Jenkins API in JSON format to certain depth \n
    Append To File  ${dir}/results.txt     ${json_string2}
    Append To File  ${dir}/results.txt     \n
    Log  <a href="http://localhost:63342/Training/Jenkins_API/Results/results.txt">Results Data File<a>   html=True


Delete Sessions
    Delete All Sessions












