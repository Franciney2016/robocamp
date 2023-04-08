*** Settings ***
Documentation    Tudo começa aqui

Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enroll.resource
Resource    database.resource
Library    JSONLibrary

*** Keywords ***
Do login
    [Arguments]    ${user}

    Go To Login Page
    Fill Crendentials    ${user}[email]    ${user}[pass]
    Submit Crendentials
    User Should Be logged In    ${user}[name]

Get fixture
    [Arguments]    ${fixture_file}

    ${fixture}     Load Json From File
...            ${EXECDIR}/resources/fixtures/${fixture_file}.json
...            encoding=UTF-8
    [Return]    ${fixture}