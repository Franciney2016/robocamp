*** Settings ***
Documentation    Tudo começa aqui

Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enroll.resource

*** Keywords ***
Do login
    [Arguments]    ${user}

    Go To Login Page
    Fill Crendentials    ${user}[email]    ${user}[pass]
    Submit Crendentials
    User Should Be logged In    ${user}[name]