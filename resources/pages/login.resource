*** Settings ***

Library    Browser


*** Keywords ***
Go To Login Page
     New Browser    headless=False    browser=chromium
     New Page       http://localhost:3000

Fill Crendentials
    [Arguments]    ${email}    ${pass}

     Fill Text    css=input[name=email]       ${email}
     Fill Text    css=input[name=password]        ${pass}

Submit Crendentials
     Click    css=button >> text=entrar no sistema

Field type Should Be Email
    Get Attribute    css=input[placeholder="Seu e-mail"]
    ...    type    equal    email

Arlet Text Should Be
    [Arguments]      ${field}      ${expected_text}
    Get Text    xpath=//input[@type="${field}"]/..//span
...             equal    ${expected_text}