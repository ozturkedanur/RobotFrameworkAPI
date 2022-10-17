*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       SeleniumLibrary
Resource      ../Resources/BaseVariables.robot
Resource      ../Resources/ListVariables.robot

*** Keywords ***
Creat Card
        ${request_body}      Create Dictionary         idList=${list_id}       key=${key}    token=${token}
        ${response}    POST      url=${BaseUrl}/cards?idList=${list_id}&key=${key}&token=${token}        json=${request_body}        expected_status=200
        ${card_id}     Get From Dictionary    ${response.json()}    id
        Set Global Variable    ${card_id}

Update Card
        ${request_body}      Create Dictionary          key=${key}    token=${token}
        ${response}    PUT      url=${BaseUrl}/cards/${card_id}?key=${key}&token=${token}        json=${request_body}        expected_status=200

Delete Card
        ${request_body}      Create Dictionary          key=${key}    token=${token}
        ${response}    DELETE      url=${BaseUrl}/cards/${card_id}?key=${key}&token=${token}        json=${request_body}