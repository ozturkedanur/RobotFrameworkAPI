*** Settings ***
Library       Collections
Library       RequestsLibrary
Library       SeleniumLibrary
Resource      ../Facilities/Board.robot
Resource      ../Facilities/List.robot
Resource      ../Facilities/Card.robot

*** Test Cases ***
Creat board
        Creat Board     test
Creat list
        List.Creat List     newList
Creat card
        Creat Card
Update card
        Update Card
Delete card
        Delete Card
Delete board
        Delete Board


















