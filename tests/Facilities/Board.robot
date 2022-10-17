*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       SeleniumLibrary
Resource      ../Resources/BaseVariables.robot

*** Keywords ***
Creat Board
        [Arguments]  ${name}
        #${name}  Set Variable        test
        ${request_body}      Create Dictionary       name=${name}    key=${key}    token=${token}
        ${response}    POST      url=${baseUrl}/boards/?name=${name}&key=${key}&token=${token}        json=${request_body}        expected_status=200
        #log  ${response.json()}
        ${board_id}     Get From Dictionary    ${response.json()}    id
        Set Global Variable    ${board_id}

Delete Board
        ${request_body}      Create Dictionary          key=${key}    token=${token}
        ${response}    DELETE      url=${BaseUrl}/boards/${board_id}?key=${key}&token=${token}        json=${request_body}        expected_status=200