*** Settings ***
Documentation    Suite de teste de matriculas de alunos
...              Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource


*** Test Cases ***
Deve matricular um aluno

# Falcão não mexer
# smart
# 23/03/2023

    ${Admin}       Create Dictionary
...                name=Admin
...                email=admin@smartbit.com
...                pass=qacademy

    Do login    ${Admin}

    Go To Enrolls
    Go to Enrolls Form
    Select Student    Falcão não mexer
    Select Plan       smart
    Fill Start Date
    Sleep    5