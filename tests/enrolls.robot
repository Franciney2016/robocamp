*** Settings ***
Documentation    Suite de teste de matriculas de alunos
...              Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource

*** Test Cases ***

Deve matricular um aluno

    ${Admin}     Get fixture  Admin

    ${student}     Get fixture    student

    Reset Student Enroll    ${student}[email]
    
    Do login    ${Admin}

    Go To Enrolls
    Go to Enrolls Form
    Select Student    ${student}[name]
    Select Plan       ${student}[enroll][plan]
    Fill Start Date
    Submit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso