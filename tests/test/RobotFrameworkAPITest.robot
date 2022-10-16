*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       SeleniumLibrary

*** Variables ***
${baseUrl}        https://api.trello.com/1
${key}            74b61a3549d616fbb82c5cca0fa19a5b
${token}          07fbcd41063c892c7d521b89c9e0614c9652534d4f8364b9a9ba9534e4941188
${board_id}
${list_id}
${card_id}

*** Test Cases ***
Creat Board
        ${name}  Set Variable        test
        ${request_body}      Create Dictionary       name=${name}    key=${key}    token=${token}
        ${response}    POST      url=${baseUrl}/boards/?name=${name}&key=${key}&token=${token}        json=${request_body}        expected_status=200
        #log  ${response.json()}
        ${board_id}     Get From Dictionary    ${response.json()}    id
        Set Global Variable    ${board_id}

Creat Lİst
        ${name}  Set Variable        eda
        ${request_body}      Create Dictionary          name=${name}        idBoard=${board_id}       key=${key}    token=${token}
        ${response}    POST      url=${BaseUrl}/lists?name=${name}&idBoard=${board_id}&key=${key}&token=${token}        json=${request_body}        expected_status=200
        ${list_id}     Get From Dictionary    ${response.json()}    id
        Set Global Variable    ${list_id}

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
        ${response}    DELETE      url=${BaseUrl}/cards/${card_id}?key=${key}&token=${token}        json=${request_body}        expected_status=200

Delete Board
        ${request_body}      Create Dictionary          key=${key}    token=${token}
        ${response}    DELETE      url=${BaseUrl}/boards/${board_id}?key=${key}&token=${token}        json=${request_body}        expected_status=200


















