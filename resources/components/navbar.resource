*** Settings ***
Library    Browser
Documentation    Representação do menu superior

*** Keywords ***
User Should Be logged In
    [Arguments]    ${user_name}

    ${logged_user}    Set Variable    css=aside strong

     Wait For Elements State    ${logged_user}    visible    5
     
     Get Text    ${logged_user}    equal    ${user_name}