*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       SeleniumLibrary
Resource      ../Resources/BaseVariables.robot
Resource      ../Resources/BoardVariables.robot

*** Keywords ***
Creat List
        [Arguments]  ${name}
        #${name}  Set Variable        eda
        ${request_body}      Create Dictionary          name=${name}        idBoard=${board_id}       key=${key}    token=${token}
        ${response}    POST      url=${BaseUrl}/lists?name=${name}&idBoard=${board_id}&key=${key}&token=${token}        json=${request_body}        expected_status=200
        ${list_id}     Get From Dictionary    ${response.json()}    id
        Set Global Variable    ${list_id}